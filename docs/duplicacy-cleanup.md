# Clean up old Duplicacy backups using the Web UI

Use this procedure to remove old backup revisions and reclaim storage after
excluding unwanted files. Exclusions only affect new backups; older revisions
still retain those files.

Pruning permanently removes the selected restore points. This procedure keeps
your new successful backup by selecting an explicit range of older revisions.

## 1. Identify the backup and the revision to keep

1. Open Duplicacy Web, then **Restore**.
2. Select the storage provider containing the backups.
3. Select the relevant **Backup ID** in the next dropdown. Copy its exact value;
   this is the value used with `-id`, not the source directory or storage name.
4. Find the new revision created after updating your exclusions. Confirm its
   backup log reports successful completion, and browse its files to confirm
   the unwanted Music Assistant files are absent.
5. Record the revision number you want to keep and the older revisions to delete.

The revision number in a backup completion log is not the Backup ID. Use the
Restore dropdown to identify the backup.

The examples below assume the Backup ID is `homeserver`, the new successful
revision is **123**, and revisions **1–122** should be deleted. Substitute your
actual values. If the new backup uses a different Backup ID, inspect both IDs
separately: revision numbers are specific to each ID, so this example range
cannot be applied across them.

## 2. Pause other storage activity

Disable scheduled jobs that access this storage and wait for running jobs to
finish. Include backups, copies, checks, restores, and other prune jobs on any
computer using the same storage. Keep Duplicacy Web running.

The `-exclusive` option assumes exclusive access and immediately deletes unused
data. Do not use it while another client or job is accessing the storage.

## 3. Create a temporary prune job and preview it

1. Open **Schedules** and create a temporary schedule.
2. Add a **prune** job targeting the correct storage provider.
3. Click the job's **Options** field and replace the default options with:

   ```text
   -id homeserver -r 1-122 -exclusive -exhaustive -dry-run
   ```

4. Keep automatic scheduling disabled and run the temporary job manually.
5. Read its log. Confirm the storage, Backup ID, and selected revisions are
   correct, and that revision **123** is not selected for deletion.

Enter only the options in the Web UI, without a `duplicacy prune` prefix.
Remove any default `-all`, `-a`, or `-keep` options so this job targets only the
intended ID and revision range.

| Option | Purpose |
| --- | --- |
| `-id homeserver` | Select this Backup ID. |
| `-r 1-122` | Delete revisions 1 through 122, inclusive. |
| `-exclusive` | Immediately delete unused chunks instead of waiting for normal fossil collection. |
| `-exhaustive` | Also scan for unreferenced chunks, including leftovers from incomplete backups. |
| `-dry-run` | Preview the operation without changing storage. |

Do not assume the latest revision is automatically protected: `-exclusive` can
allow its deletion. Keep its number outside the selected range.

## 4. Delete the old revisions

Once the dry-run output matches your intended selection, remove only `-dry-run`:

```text
-id homeserver -r 1-122 -exclusive -exhaustive
```

Run the job manually and wait for successful completion. Duplicacy preserves
chunks referenced by retained revisions, including revisions under other IDs.
Consequently, unwanted files will continue consuming space if another retained
revision still references them.

Do not manually delete files from Duplicacy's `chunks` folder in the storage provider;
chunks can be shared by multiple backups.

## 5. Verify and resume normal backups

1. Check the prune log for errors.
2. Refresh **Restore** and confirm the intended new revision remains.
3. Restore a small important file from that revision to a separate location.
4. Check storage provider usage after the cleanup has completed.
5. Delete the temporary prune job or schedule, then re-enable normal schedules.

Keep your usual retention policy for ongoing cleanup. The explicit revision
range above is a one-time operation, not a recurring retention policy.

If little space is reclaimed, check whether retained revisions under any Backup
ID still contain the unwanted files, and whether the prune job completed without
errors. Review those revisions before selecting any additional deletions.

## References

- [Duplicacy Web Edition guide](https://duplicacy.com/guide.html)
- [Duplicacy prune command reference](https://forum.duplicacy.com/t/prune-command-details/1005)
- [Backup ID selection on the Restore page](https://forum.duplicacy.com/t/duplicacy-web-restore-not-showing-all-files-that-were-backed-up/9429)
