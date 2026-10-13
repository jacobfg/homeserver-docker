"""Offline provider regression tests; run after terraform init, with Terraform on PATH."""

import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


MODULE = Path(__file__).resolve().parents[1]
TERRAFORM = shutil.which("terraform")


@unittest.skipUnless(TERRAFORM and (MODULE / ".terraform/providers").is_dir(),
                     "Requires Terraform on PATH and terraform init")
class AdminLifecycleTests(unittest.TestCase):
    def plan_admin(self, *, preferences, configured_email="admin@example.invalid"):
        # Only fictional state is used. No deployment inputs or credentials are read.
        with tempfile.TemporaryDirectory(prefix="sftpgo-admin-test-") as directory:
            root = Path(directory)
            for source in MODULE.glob("*.tf"):
                shutil.copyfile(source, root / source.name)
            shutil.copyfile(MODULE / ".terraform.lock.hcl", root / ".terraform.lock.hcl")
            (root / ".terraform").symlink_to(MODULE / ".terraform", target_is_directory=True)
            attributes = dict.fromkeys([
                "additional_info", "description", "groups", "password", "password_wo",
                "password_wo_version", "role",
            ])
            attributes.update(
                id="example-admin", username="example-admin", email="admin@example.invalid",
                status=1, permissions=["*"], created_at=0, updated_at=0, last_login=0,
                filters={"allow_api_key_auth": True, "allow_list": None,
                         "disable_password_auth": None, "require_password_change": None,
                         "require_two_factor": None},
                preferences=preferences,
            )
            state = {
                "version": 4, "terraform_version": "1.11.4", "serial": 1,
                "lineage": "eb598f79-9a67-4d5d-ae96-3b05c5263488", "outputs": {},
                "resources": [{
                    "mode": "managed", "type": "sftpgo_admin", "name": "oidc",
                    "provider": 'provider["registry.terraform.io/drakkan/sftpgo"]',
                    "instances": [{"schema_version": 0, "attributes": attributes,
                                   "sensitive_attributes": [
                                       [{"type": "get_attr", "value": "password"}],
                                       [{"type": "get_attr", "value": "password_wo"}],
                                   ]}],
                }],
            }
            (root / "terraform.tfstate").write_text(json.dumps(state))
            inputs = {
                "sftpgo_host": "http://127.0.0.1:1",
                "admin": {"username": "example-admin", "email": configured_email},
                "accounts": {}, "folders": {},
                "web_client_url": "https://sftp.example.invalid/web/client",
                "email_names": {"scan_action": "scan-email", "scan_rule": "scan-email",
                                "large_scan_action": "large-scan-email",
                                "large_scan_rule": "large-scan-email"},
            }
            (root / "test.tfvars.json").write_text(json.dumps(inputs))
            env = {key: value for key, value in os.environ.items()
                   if not key.startswith(("TF_", "SFTPGO_"))}
            env.update(SFTPGO_API_KEY="offline-test-only",
                       TF_VAR_admin_seed_password="offline-test-only-password-never-used-on-server",
                       TF_IN_AUTOMATION="1")

            def terraform(*args):
                result = subprocess.run(
                    [TERRAFORM, f"-chdir={root}", *args], env=env,
                    capture_output=True, text=True, timeout=60,
                )
                self.assertEqual(result.returncode, 0, result.stderr)
                return result.stdout

            terraform("plan", "-refresh=false", "-input=false", "-lock=false",
                      "-var-file=test.tfvars.json", "-out=test.tfplan")
            plan = json.loads(terraform("show", "-json", "test.tfplan"))
            return next(resource["change"] for resource in plan["resource_changes"]
                        if resource["address"] == "sftpgo_admin.oidc")

    def test_imported_admin_does_not_update_for_seed_or_empty_preferences(self):
        change = self.plan_admin(preferences={"default_users_expiration": None,
                                              "hide_user_page_sections": None})
        self.assertEqual(change["actions"], ["no-op"])
        self.assertIsNone(change["after"]["password_wo_version"])

    def test_personal_ui_preferences_are_preserved(self):
        preferences = {"default_users_expiration": 30, "hide_user_page_sections": 16}
        change = self.plan_admin(preferences=preferences)
        self.assertEqual(change["actions"], ["no-op"])
        self.assertEqual(change["after"]["preferences"], preferences)

    def test_real_admin_changes_are_still_planned(self):
        change = self.plan_admin(preferences=None, configured_email="updated@example.invalid")
        self.assertEqual(change["actions"], ["update"])
        self.assertEqual(change["after"]["email"], "updated@example.invalid")


if __name__ == "__main__":
    unittest.main()
