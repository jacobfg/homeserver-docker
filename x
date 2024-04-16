DEBUG: Using RE2 regex engine
DEBUG: Parsing configs
DEBUG: Checking for config file in .github/renovate.json5
 WARN: cli config dryRun property has been changed to full
DEBUG: File config
       "config": {
         "extends": ["config:best-practices"],
         "baseBranches": ["main"],
         "labels": ["dependencies", "bot"],
         "enabled": true,
         "enabledManagers": ["docker-compose", "github-actions", "custom.regex"],
         "packageRules": [
           {
             "matchDatasources": ["docker"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["ghcr.io/esphome/esphome"],
             "enabled": false
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": [
               "spx01/blocky",
               "saspus/duplicacy-web",
               "b4bz/homer"
             ],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["nodered/node-red"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)-18-minimal$"
           },
           {
             "matchDatasources": ["github-releases"],
             "matchDepNames": ["tjhorner/upsy-desky"],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           }
         ],
         "customManagers": [
           {
             "customType": "regex",
             "fileMatch": ["^README\\.md$"],
             "matchStrings": [
               "[^_]github.com\\/(?<packageName>.*) \\| (?<currentValue>v?\\d+\\.\\d+\\.\\d+) \\|"
             ],
             "depNameTemplate": "{{packageName}}-{{newVersion}}",
             "datasourceTemplate": "github-releases"
           }
         ]
       }
DEBUG: CLI config
       "config": {"dryRun": "full", "platform": "local"}
DEBUG: Env config
       "config": {"hostRules": [], "printConfig": true, "token": "***********"}
DEBUG: Combined config
       "config": {
         "extends": ["config:best-practices"],
         "baseBranches": ["main"],
         "labels": ["dependencies", "bot"],
         "enabled": true,
         "enabledManagers": ["docker-compose", "github-actions", "custom.regex"],
         "packageRules": [
           {
             "matchDatasources": ["docker"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["ghcr.io/esphome/esphome"],
             "enabled": false
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": [
               "spx01/blocky",
               "saspus/duplicacy-web",
               "b4bz/homer"
             ],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["nodered/node-red"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)-18-minimal$"
           },
           {
             "matchDatasources": ["github-releases"],
             "matchDepNames": ["tjhorner/upsy-desky"],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           }
         ],
         "customManagers": [
           {
             "customType": "regex",
             "fileMatch": ["^README\\.md$"],
             "matchStrings": [
               "[^_]github.com\\/(?<packageName>.*) \\| (?<currentValue>v?\\d+\\.\\d+\\.\\d+) \\|"
             ],
             "depNameTemplate": "{{packageName}}-{{newVersion}}",
             "datasourceTemplate": "github-releases"
           }
         ],
         "hostRules": [],
         "printConfig": true,
         "token": "***********",
         "dryRun": "full",
         "platform": "local"
       }
DEBUG: Enabling forkProcessing while in non-autodiscover mode
DEBUG: Found valid git version: 2.43.2
DEBUG: Setting global hostRules
DEBUG: Using baseDir: /tmp/renovate
DEBUG: Using cacheDir: /tmp/renovate/cache
DEBUG: Using containerbaseDir: /tmp/renovate/cache/containerbase
DEBUG: Initializing Renovate internal cache into /tmp/renovate/cache/renovate/renovate-cache-v1
DEBUG: Commits limit = null
DEBUG: Setting global hostRules
DEBUG: validatePresets()
DEBUG: Reinitializing hostRules for repo
DEBUG: Clearing hostRules
 INFO: Repository started (repository=local)
       "renovateVersion": "37.269.2"
DEBUG: Using localDir: /usr/src/app (repository=local)
DEBUG: PackageFiles.clear() - Package files deleted (repository=local)
DEBUG: Resetting npmrc (repository=local)
DEBUG: Resetting npmrc (repository=local)
DEBUG: checkOnboarding() (repository=local)
DEBUG: isOnboarded() (repository=local)
DEBUG: findFile(renovate.json) (repository=local)
DEBUG: Could not get file list using git, using glob instead (repository=local)
DEBUG: findFile(renovate.json5) (repository=local)
DEBUG: Could not get file list using git, using glob instead (repository=local)
DEBUG: findFile(.github/renovate.json) (repository=local)
DEBUG: Could not get file list using git, using glob instead (repository=local)
DEBUG: findFile(.github/renovate.json5) (repository=local)
DEBUG: Could not get file list using git, using glob instead (repository=local)
DEBUG: Config file exists, fileName: .github/renovate.json5 (repository=local)
DEBUG: Repo is onboarded (repository=local)
DEBUG: Could not get file list using git, using glob instead (repository=local)
DEBUG: Found .github/renovate.json5 config file (repository=local)
DEBUG: Repository config (repository=local)
       "fileName": ".github/renovate.json5",
       "config": {
         "extends": ["config:best-practices"],
         "baseBranches": ["main"],
         "labels": ["dependencies", "bot"],
         "enabled": true,
         "enabledManagers": ["docker-compose", "github-actions", "custom.regex"],
         "packageRules": [
           {
             "matchDatasources": ["docker"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["ghcr.io/esphome/esphome"],
             "enabled": false
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": [
               "spx01/blocky",
               "saspus/duplicacy-web",
               "b4bz/homer"
             ],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["nodered/node-red"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)-18-minimal$"
           },
           {
             "matchDatasources": ["github-releases"],
             "matchDepNames": ["tjhorner/upsy-desky"],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           }
         ],
         "customManagers": [
           {
             "customType": "regex",
             "fileMatch": ["^README\\.md$"],
             "matchStrings": [
               "[^_]github.com\\/(?<packageName>.*) \\| (?<currentValue>v?\\d+\\.\\d+\\.\\d+) \\|"
             ],
             "depNameTemplate": "{{packageName}}-{{newVersion}}",
             "datasourceTemplate": "github-releases"
           }
         ]
       }
DEBUG: migrateAndValidate() (repository=local)
DEBUG: No config migration necessary (repository=local)
DEBUG: Setting hostRules from config (repository=local)
DEBUG: Found repo ignorePaths (repository=local)
       "ignorePaths": [
         "**/node_modules/**",
         "**/bower_components/**",
         "**/vendor/**",
         "**/examples/**",
         "**/__tests__/**",
         "**/test/**",
         "**/tests/**",
         "**/__fixtures__/**"
       ]
DEBUG: No vulnerability alerts found (repository=local)
 INFO: Full resolved config and hostRules including presets (repository=local)
       "config": {
         "detectGlobalManagerConfig": false,
         "detectHostRulesFromEnv": false,
         "useCloudMetadataServices": true,
         "postUpgradeTasks": {
           "commands": [],
           "fileFilters": [],
           "executionMode": "update"
         },
         "onboardingBranch": "renovate/configure",
         "onboardingCommitMessage": null,
         "onboardingConfigFileName": "renovate.json",
         "onboardingNoDeps": false,
         "onboardingPrTitle": "Configure Renovate",
         "configMigration": true,
         "productLinks": {
           "documentation": "https://docs.renovatebot.com/",
           "help": "https://github.com/renovatebot/renovate/discussions",
           "homepage": "https://github.com/renovatebot/renovate"
         },
         "statusCheckNames": {
           "artifactError": "renovate/artifacts",
           "configValidation": "renovate/config-validation",
           "mergeConfidence": "renovate/merge-confidence",
           "minimumReleaseAge": "renovate/stability-days"
         },
         "globalExtends": [],
         "description": [
           "Enable Renovate Dependency Dashboard creation.",
           "Use semantic commit type `fix` for dependencies and `chore` for all others if semantic commits are in use.",
           "Ignore `node_modules`, `bower_components`, `vendor` and various test/tests directories.",
           "Group known monorepo packages together.",
           "Use curated list of recommended non-monorepo package groupings.",
           "Apply crowd-sourced package replacement rules.",
           "Apply crowd-sourced workarounds for known problems with packages.",
           "Pin Docker digests.",
           "Pin `github-action` digests.",
           "Pin dependency versions for `devDependencies`.",
           "Preset with best practices from the Renovate maintainers. Recommended for advanced users, who want to follow our best practices.",
           "Enable Renovate Dependency Dashboard creation.",
           "Use semantic commit type `fix` for dependencies and `chore` for all others if semantic commits are in use.",
           "Ignore `node_modules`, `bower_components`, `vendor` and various test/tests directories.",
           "Group known monorepo packages together.",
           "Use curated list of recommended non-monorepo package groupings.",
           "Apply crowd-sourced package replacement rules.",
           "Apply crowd-sourced workarounds for known problems with packages.",
           "Pin Docker digests.",
           "Pin `github-action` digests.",
           "Pin dependency versions for `devDependencies`.",
           "Preset with best practices from the Renovate maintainers. Recommended for advanced users, who want to follow our best practices."
         ],
         "enabled": true,
         "constraintsFiltering": "none",
         "repositoryCache": "disabled",
         "repositoryCacheType": "local",
         "reportType": null,
         "reportPath": null,
         "force": {"dryRun": "full", "platform": "local"},
         "draftPR": false,
         "printConfig": true,
         "env": {},
         "customDatasources": {},
         "composerIgnorePlatformReqs": [],
         "goGetDirs": ["./..."],
         "onboarding": true,
         "onboardingConfig": {
           "$schema": "https://docs.renovatebot.com/renovate-schema.json"
         },
         "onboardingRebaseCheckbox": false,
         "forkProcessing": "enabled",
         "includeMirrors": false,
         "forkCreation": true,
         "forkToken": null,
         "forkOrg": null,
         "inheritConfig": false,
         "inheritConfigRepoName": "{{parentOrg}}/renovate-config",
         "inheritConfigFileName": "org-inherited-config.json",
         "inheritConfigStrict": false,
         "requireConfig": "optional",
         "optimizeForDisabled": false,
         "dependencyDashboard": true,
         "dependencyDashboardApproval": false,
         "dependencyDashboardAutoclose": false,
         "dependencyDashboardTitle": "Dependency Dashboard",
         "dependencyDashboardHeader": "This issue lists Renovate updates and detected dependencies. Read the [Dependency Dashboard](https://docs.renovatebot.com/key-concepts/dashboard/) docs to learn more.",
         "dependencyDashboardFooter": null,
         "dependencyDashboardLabels": null,
         "dependencyDashboardOSVVulnerabilitySummary": "none",
         "configWarningReuseIssue": true,
         "privateKeyPath": null,
         "privateKeyPathOld": null,
         "encrypted": null,
         "timezone": null,
         "schedule": ["at any time"],
         "automergeSchedule": ["at any time"],
         "updateNotScheduled": true,
         "persistRepoData": true,
         "ignorePlugins": false,
         "ignoreScripts": true,
         "username": null,
         "password": null,
         "npmrc": null,
         "npmrcMerge": false,
         "npmToken": null,
         "updateLockFiles": true,
         "skipInstalls": null,
         "baseBranches": ["main"],
         "useBaseBranchConfig": "none",
         "gitAuthor": null,
         "gitIgnoredAuthors": [],
         "enabledManagers": ["docker-compose", "github-actions", "custom.regex"],
         "includePaths": [],
         "ignorePaths": [
           "**/node_modules/**",
           "**/bower_components/**",
           "**/vendor/**",
           "**/examples/**",
           "**/__tests__/**",
           "**/test/**",
           "**/tests/**",
           "**/__fixtures__/**"
         ],
         "excludeCommitPaths": [],
         "registryAliases": {},
         "defaultRegistryUrls": null,
         "registryUrls": null,
         "extractVersion": null,
         "versionCompatibility": null,
         "versioning": null,
         "azureWorkItemId": 0,
         "autoApprove": false,
         "ignoreDeps": [],
         "updateInternalDeps": false,
         "packageRules": [
           {
             "matchDatasources": ["docker"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["ghcr.io/esphome/esphome"],
             "enabled": false
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": [
               "spx01/blocky",
               "saspus/duplicacy-web",
               "b4bz/homer"
             ],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["nodered/node-red"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)-18-minimal$"
           },
           {
             "matchDatasources": ["github-releases"],
             "matchDepNames": ["tjhorner/upsy-desky"],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {"matchPackagePatterns": ["*"], "semanticCommitType": "chore"},
           {"matchDepTypes": ["dependencies", "require"], "semanticCommitType": "fix"},
           {
             "matchDatasources": ["maven"],
             "matchDepTypes": [
               "compile",
               "provided",
               "runtime",
               "system",
               "import",
               "parent"
             ],
             "semanticCommitType": "fix"
           },
           {
             "description": [
               "accounts monorepo",
               "Group packages from accounts monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/accounts-js/accounts"],
             "groupName": "accounts monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "acot monorepo",
               "Group packages from acot monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/acot-a11y/acot"],
             "groupName": "acot monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ag-grid monorepo",
               "Group packages from ag-grid monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ag-grid/ag-grid"],
             "groupName": "ag-grid monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "algolia-instantsearch monorepo",
               "Group packages from algolia-instantsearch monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/algolia/instantsearch",
               "https://github.com/algolia/instantsearch.js"
             ],
             "groupName": "algolia-instantsearch monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "algolia-react-instantsearch monorepo",
               "Group packages from algolia-react-instantsearch monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/algolia/react-instantsearch"],
             "groupName": "algolia-react-instantsearch monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "algoliasearch-autocomplete monorepo",
               "Group packages from algoliasearch-autocomplete monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/algolia/autocomplete"],
             "groupName": "algoliasearch-autocomplete monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "algoliasearch-client-javascript monorepo",
               "Group packages from algoliasearch-client-javascript monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/algolia/algoliasearch-client-javascript"
             ],
             "groupName": "algoliasearch-client-javascript monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "analog monorepo",
               "Group packages from analog monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/analogjs/analog"],
             "groupName": "analog monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angular monorepo",
               "Group packages from angular monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular/angular"],
             "groupName": "angular monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angular-cli monorepo",
               "Group packages from angular-cli monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular/angular-cli"],
             "groupName": "angular-cli monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angular-eslint monorepo",
               "Group packages from angular-eslint monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular-eslint/angular-eslint"],
             "groupName": "angular-eslint monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angularfire monorepo",
               "Group packages from angularfire monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular/angularfire"],
             "groupName": "angularfire monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angularjs monorepo",
               "Group packages from angularjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular/angular.js"],
             "groupName": "angularjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "apollo-server monorepo",
               "Group packages from apollo-server monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apollographql/apollo-server"],
             "groupName": "apollo-server monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "apolloclient monorepo",
               "Group packages from apolloclient monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apollographql/apollo-client"],
             "groupName": "apolloclient monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "applicationinsights-dotnet monorepo",
               "Group packages from applicationinsights-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/Microsoft/ApplicationInsights-dotnet"
             ],
             "groupName": "applicationinsights-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.background-jobs monorepo",
               "Group packages from arcus.background-jobs monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/arcus-azure/arcus.backgroundjobs"
             ],
             "groupName": "arcus.background-jobs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.event-grid monorepo",
               "Group packages from arcus.event-grid monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.eventgrid"],
             "groupName": "arcus.event-grid monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.messaging monorepo",
               "Group packages from arcus.messaging monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.messaging"],
             "groupName": "arcus.messaging monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.observability monorepo",
               "Group packages from arcus.observability monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.observability"],
             "groupName": "arcus.observability monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.security monorepo",
               "Group packages from arcus.security monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.security"],
             "groupName": "arcus.security monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.webapi monorepo",
               "Group packages from arcus.webapi monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.webapi"],
             "groupName": "arcus.webapi monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aspnet aspnetwebstack monorepo",
               "Group packages from aspnet aspnetwebstack monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aspnet/AspNetWebStack"],
             "groupName": "aspnet aspnetwebstack monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aspnet extensions monorepo",
               "Group packages from aspnet extensions monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aspnet/Extensions"],
             "groupName": "aspnet extensions monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aspnet-api-versioning monorepo",
               "Group packages from aspnet-api-versioning monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Microsoft/aspnet-api-versioning"],
             "groupName": "aspnet-api-versioning monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aspnet-health-checks monorepo",
               "Group packages from aspnet-health-checks monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/xabaril/AspNetCore.Diagnostics.HealthChecks"
             ],
             "groupName": "aspnet-health-checks monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "automapper-dotnet monorepo",
               "Group packages from automapper-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/AutoMapper/AutoMapper",
               "https://github.com/AutoMapper/AutoMapper.Extensions.Microsoft.DependencyInjection"
             ],
             "groupName": "automapper-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-cdk monorepo",
               "Group packages from aws-cdk monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-cdk"],
             "groupName": "aws-cdk monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-lambda-powertools-typescript monorepo",
               "Group packages from aws-lambda-powertools-typescript monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/awslabs/aws-lambda-powertools-typescript",
               "https://github.com/aws-powertools/powertools-lambda-typescript"
             ],
             "groupName": "aws-lambda-powertools-typescript monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-client-mock monorepo",
               "Group packages from aws-sdk-client-mock monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/m-radzikowski/aws-sdk-client-mock"
             ],
             "groupName": "aws-sdk-client-mock monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-go monorepo",
               "Group packages from aws-sdk-go monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-sdk-go"],
             "groupName": "aws-sdk-go monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-go-v2 monorepo",
               "Group packages from aws-sdk-go-v2 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-sdk-go-v2"],
             "groupName": "aws-sdk-go-v2 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-js-v3 monorepo",
               "Group packages from aws-sdk-js-v3 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-sdk-js-v3"],
             "groupName": "aws-sdk-js-v3 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-net monorepo",
               "Group packages from aws-sdk-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-sdk-net"],
             "groupName": "aws-sdk-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-rust monorepo",
               "Group packages from aws-sdk-rust monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/smithy-lang/smithy-rs",
               "https://github.com/awslabs/smithy-rs",
               "https://github.com/awslabs/aws-sdk-rust"
             ],
             "groupName": "aws-sdk-rust monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "awsappsync monorepo",
               "Group packages from awsappsync monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/awslabs/aws-mobile-appsync-sdk-js"
             ],
             "groupName": "awsappsync monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "azure azure-libraries-for-net monorepo",
               "Group packages from azure azure-libraries-for-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Azure/azure-libraries-for-net"],
             "groupName": "azure azure-libraries-for-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "azure azure-sdk-for-net monorepo",
               "Group packages from azure azure-sdk-for-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Azure/azure-sdk-for-net"],
             "groupName": "azure azure-sdk-for-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "azure azure-storage-net monorepo",
               "Group packages from azure azure-storage-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Azure/azure-storage-net"],
             "groupName": "azure azure-storage-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "babel monorepo",
               "Group packages from babel monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/babel/babel"],
             "groupName": "babel monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "backstage monorepo",
               "Group packages from backstage monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/backstage/backstage"],
             "groupName": "backstage monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "baset monorepo",
               "Group packages from baset monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/igmat/baset"],
             "groupName": "baset monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "brave monorepo",
               "Group packages from brave monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/openzipkin/brave"],
             "groupName": "brave monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "bugsnag-js monorepo",
               "Group packages from bugsnag-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/bugsnag/bugsnag-js"],
             "groupName": "bugsnag-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "cake monorepo",
               "Group packages from cake monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/cake-build/cake"],
             "groupName": "cake monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "capacitor monorepo",
               "Group packages from capacitor monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ionic-team/capacitor"],
             "groupName": "capacitor monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "chakra-ui monorepo",
               "Group packages from chakra-ui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/chakra-ui/chakra-ui"],
             "groupName": "chakra-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "chromely monorepo",
               "Group packages from chromely monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/chromelyapps/Chromely"],
             "groupName": "chromely monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@cds/", "^@clr/"],
             "description": ["Group packages from clarity monorepo together."],
             "groupName": "clarity monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "clearscript monorepo",
               "Group packages from clearscript monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/microsoft/ClearScript",
               "https://github.com/Microsoft/ClearScript"
             ],
             "groupName": "clearscript monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "commitlint monorepo",
               "Group packages from commitlint monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/conventional-changelog/commitlint"
             ],
             "groupName": "commitlint monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "contentful-rich-text monorepo",
               "Group packages from contentful-rich-text monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/contentful/rich-text"],
             "groupName": "contentful-rich-text monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datadog-browser-sdk monorepo",
               "Group packages from datadog-browser-sdk monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/DataDog/browser-sdk"],
             "groupName": "datadog-browser-sdk monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net monorepo",
               "Group packages from datatables-net monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Bulma",
               "https://github.com/DataTables/Dist-DataTables-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Foundation",
               "https://github.com/DataTables/Dist-DataTables-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-jQueryUI"
             ],
             "groupName": "datatables-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-autofill monorepo",
               "Group packages from datatables-net-autofill monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-AutoFill",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Bulma",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-DataTables",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Foundation",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-jQueryUI"
             ],
             "groupName": "datatables-net-autofill monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-buttons monorepo",
               "Group packages from datatables-net-buttons monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-Buttons",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Bulma",
               "https://github.com/DataTables/Dist-DataTables-Buttons-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Foundation",
               "https://github.com/DataTables/Dist-DataTables-Buttons-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-Buttons-jQueryUI"
             ],
             "groupName": "datatables-net-buttons monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-colreorder monorepo",
               "Group packages from datatables-net-colreorder monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-ColReorder",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Bulma",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-DataTables",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Foundation",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-jQueryUI"
             ],
             "groupName": "datatables-net-colreorder monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-fixedcolumns monorepo",
               "Group packages from datatables-net-fixedcolumns monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-FixedColumns",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Bulma",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-DataTables",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Foundation",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-jQueryUI"
             ],
             "groupName": "datatables-net-fixedcolumns monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-fixedheader monorepo",
               "Group packages from datatables-net-fixedheader monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-FixedHeader",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Bulma",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-DataTables",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Foundation",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-jQueryUI"
             ],
             "groupName": "datatables-net-fixedheader monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-keytable monorepo",
               "Group packages from datatables-net-keytable monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-KeyTable",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Bulma",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-DataTables",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Foundation",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-jQueryUI"
             ],
             "groupName": "datatables-net-keytable monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-responsive monorepo",
               "Group packages from datatables-net-responsive monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-Responsive",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Bulma",
               "https://github.com/DataTables/Dist-DataTables-Responsive-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Foundation",
               "https://github.com/DataTables/Dist-DataTables-Responsive-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-Responsive-jQueryUI"
             ],
             "groupName": "datatables-net-responsive monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-rowgroup monorepo",
               "Group packages from datatables-net-rowgroup monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-RowGroup",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Bulma",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-DataTables",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Foundation",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-jQueryUI"
             ],
             "groupName": "datatables-net-rowgroup monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-rowreorder monorepo",
               "Group packages from datatables-net-rowreorder monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-RowReorder",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Bulma",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-DataTables",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Foundation",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-jQueryUI"
             ],
             "groupName": "datatables-net-rowreorder monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-scroller monorepo",
               "Group packages from datatables-net-scroller monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-Scroller",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Bulma",
               "https://github.com/DataTables/Dist-DataTables-Scroller-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Foundation",
               "https://github.com/DataTables/Dist-DataTables-Scroller-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-Scroller-jQueryUI"
             ],
             "groupName": "datatables-net-scroller monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-searchbuilder monorepo",
               "Group packages from datatables-net-searchbuilder monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Bulma",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-DataTables",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Foundation",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-jQueryUI"
             ],
             "groupName": "datatables-net-searchbuilder monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-searchpanes monorepo",
               "Group packages from datatables-net-searchpanes monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-SearchPanes",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Bulma",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-DataTables",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Foundation",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-jQueryUI"
             ],
             "groupName": "datatables-net-searchpanes monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-select monorepo",
               "Group packages from datatables-net-select monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-Select",
               "https://github.com/DataTables/Dist-DataTables-Select-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Select-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Select-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Select-Bulma",
               "https://github.com/DataTables/Dist-DataTables-Select-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Select-Foundation",
               "https://github.com/DataTables/Dist-DataTables-Select-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-Select-jQueryUI"
             ],
             "groupName": "datatables-net-select monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-staterestore monorepo",
               "Group packages from datatables-net-staterestore monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-StateRestore",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Bulma",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-DataTables",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Foundation",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-jQueryUI"
             ],
             "groupName": "datatables-net-staterestore monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "date-io monorepo",
               "Group packages from date-io monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dmtrKovalenko/date-io"],
             "groupName": "date-io monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "deck-gl monorepo",
               "Group packages from deck-gl monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/visgl/deck.gl"],
             "groupName": "deck-gl monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "deno monorepo",
               "Group packages from deno monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/denoland/deno"],
             "groupName": "deno monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "devextreme-reactive monorepo",
               "Group packages from devextreme-reactive monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/DevExpress/devextreme-reactive"],
             "groupName": "devextreme-reactive monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dnd-kit monorepo",
               "Group packages from dnd-kit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/clauderic/dnd-kit"],
             "groupName": "dnd-kit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "docusaurus monorepo",
               "Group packages from docusaurus monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/facebook/docusaurus"],
             "groupName": "docusaurus monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dot-swashbuckle monorepo",
               "Group packages from dot-swashbuckle monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Havunen/DotSwashbuckle"],
             "groupName": "dot-swashbuckle monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dotnet monorepo",
               "Group packages from dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/dotnet/aspnetcore",
               "https://github.com/dotnet/efcore",
               "https://github.com/dotnet/extensions",
               "https://github.com/dotnet/maui",
               "https://github.com/dotnet/runtime",
               "https://github.com/dotnet/scaffolding",
               "https://github.com/dotnet/sdk"
             ],
             "groupName": "dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dotnet-azure-ad-identitymodel-extensions monorepo",
               "Group packages from dotnet-azure-ad-identitymodel-extensions monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/AzureAD/azure-activedirectory-identitymodel-extensions-for-dotnet"
             ],
             "groupName": "dotnet-azure-ad-identitymodel-extensions monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dotnet-azure-ad-microsoft-identity-web monorepo",
               "Group packages from dotnet-azure-ad-microsoft-identity-web monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/AzureAD/microsoft-identity-web"],
             "groupName": "dotnet-azure-ad-microsoft-identity-web monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dotnet-wcf monorepo",
               "Group packages from dotnet-wcf monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dotnet/wcf"],
             "groupName": "dotnet-wcf monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dropwizard monorepo",
               "Group packages from dropwizard monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dropwizard/dropwizard"],
             "groupName": "dropwizard monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "elastic-apm-agent-rum-js monorepo",
               "Group packages from elastic-apm-agent-rum-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/elastic/apm-agent-rum-js"],
             "groupName": "elastic-apm-agent-rum-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "electron-forge monorepo",
               "Group packages from electron-forge monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/electron-userland/electron-forge",
               "https://github.com/electron/forge"
             ],
             "groupName": "electron-forge monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ember-decorators monorepo",
               "Group packages from ember-decorators monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/ember-decorators/ember-decorators"
             ],
             "groupName": "ember-decorators monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "emojibase monorepo",
               "Group packages from emojibase monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/milesj/emojibase"],
             "groupName": "emojibase monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "emotion monorepo",
               "Group packages from emotion monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/emotion-js/emotion"],
             "groupName": "emotion monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "eslint-config-globex monorepo",
               "Group packages from eslint-config-globex monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/GlobexDesignsInc/eslint-config-globex"
             ],
             "groupName": "eslint-config-globex monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "expo monorepo",
               "Group packages from expo monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/expo/expo"],
             "groupName": "expo monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fabric-chaincode-node monorepo",
               "Group packages from fabric-chaincode-node monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/hyperledger/fabric-chaincode-node"
             ],
             "groupName": "fabric-chaincode-node monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fabric8-kubernetes-client monorepo",
               "Group packages from fabric8-kubernetes-client monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/fabric8io/kubernetes-client"],
             "groupName": "fabric8-kubernetes-client monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "feathers monorepo",
               "Group packages from feathers monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/feathersjs/feathers"],
             "groupName": "feathers monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "feign monorepo",
               "Group packages from feign monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/OpenFeign/feign"],
             "groupName": "feign monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fela monorepo",
               "Group packages from fela monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/robinweser/fela"],
             "groupName": "fela monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fimbullinter monorepo",
               "Group packages from fimbullinter monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/fimbullinter/wotan"],
             "groupName": "fimbullinter monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "flopflip monorepo",
               "Group packages from flopflip monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/tdeekens/flopflip"],
             "groupName": "flopflip monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fontsource monorepo",
               "Group packages from fontsource monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/fontsource/fontsource",
               "https://github.com/fontsource/font-files"
             ],
             "groupName": "fontsource monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "formatjs monorepo",
               "Group packages from formatjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/formatjs/formatjs"],
             "groupName": "formatjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "framework7 monorepo",
               "Group packages from framework7 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/framework7io/framework7"],
             "groupName": "framework7 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "gatsby monorepo",
               "Group packages from gatsby monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/gatsbyjs/gatsby"],
             "groupName": "gatsby monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "gitbeaker monorepo",
               "Group packages from gitbeaker monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/jdalrymple/gitbeaker"],
             "groupName": "gitbeaker monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "github-workflows-kt monorepo",
               "Group packages from github-workflows-kt monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/typesafegithub/github-workflows-kt"
             ],
             "groupName": "github-workflows-kt monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "go-cloud monorepo",
               "Group packages from go-cloud monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/google/go-cloud"],
             "groupName": "go-cloud monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "google-api-dotnet-client monorepo",
               "Group packages from google-api-dotnet-client monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/googleapis/google-api-dotnet-client"
             ],
             "groupName": "google-api-dotnet-client monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "grafana monorepo",
               "Group packages from grafana monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/grafana/grafana"],
             "groupName": "grafana monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "graphql-mesh monorepo",
               "Group packages from graphql-mesh monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Urigo/graphql-mesh"],
             "groupName": "graphql-mesh monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "graphql-modules monorepo",
               "Group packages from graphql-modules monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Urigo/graphql-modules"],
             "groupName": "graphql-modules monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "graphql-tools monorepo",
               "Group packages from graphql-tools monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ardatan/graphql-tools"],
             "groupName": "graphql-tools monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "graphqlcodegenerator monorepo",
               "Group packages from graphqlcodegenerator monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/dotansimha/graphql-code-generator-community",
               "https://github.com/dotansimha/graphql-code-generator",
               "https://github.com/dotansimha/graphql-codegen"
             ],
             "groupName": "graphqlcodegenerator monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "groovy monorepo",
               "Group packages from groovy monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apache/groovy"],
             "groupName": "groovy monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "grpc-dotnet monorepo",
               "Group packages from grpc-dotnet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/grpc/grpc-dotnet"],
             "groupName": "grpc-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "grpc-java monorepo",
               "Group packages from grpc-java monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/grpc/grpc-java"],
             "groupName": "grpc-java monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "guava monorepo",
               "Group packages from guava monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/google/guava"],
             "groupName": "guava monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "Hangfire monorepo",
               "Group packages from Hangfire monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/HangfireIO/Hangfire"],
             "groupName": "Hangfire monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "hickory-dns monorepo",
               "Group packages from hickory-dns monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/hickory-dns/hickory-dns"],
             "groupName": "hickory-dns monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "infrastructure-ui monorepo",
               "Group packages from infrastructure-ui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/instructure/instructure-ui"],
             "groupName": "infrastructure-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ionic-native monorepo",
               "Group packages from ionic-native monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ionic-team/ionic-native"],
             "groupName": "ionic-native monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "istanbuljs monorepo",
               "Group packages from istanbuljs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/istanbuljs/istanbuljs"],
             "groupName": "istanbuljs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jackson monorepo",
               "Group packages from jackson monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/FasterXML/jackson",
               "https://github.com/FasterXML/jackson-dataformats-binary",
               "https://github.com/FasterXML/jackson-dataformats-text"
             ],
             "groupName": "jackson monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jasmine monorepo",
               "Group packages from jasmine monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/jasmine/jasmine"],
             "groupName": "jasmine monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "javahamcrest monorepo",
               "Group packages from javahamcrest monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/hamcrest/JavaHamcrest"],
             "groupName": "javahamcrest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "javascriptengineswitcher monorepo",
               "Group packages from javascriptengineswitcher monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/Taritsyn/JavaScriptEngineSwitcher"
             ],
             "groupName": "javascriptengineswitcher monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jersey monorepo",
               "Group packages from jersey monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/eclipse-ee4j/jersey"],
             "groupName": "jersey monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jest monorepo",
               "Group packages from jest monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/facebook/jest",
               "https://github.com/jestjs/jest"
             ],
             "groupName": "jest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jna monorepo",
               "Group packages from jna monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/java-native-access/jna"],
             "groupName": "jna monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "json-smart-v2 monorepo",
               "Group packages from json-smart-v2 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/netplex/json-smart-v2"],
             "groupName": "json-smart-v2 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jsplumb monorepo",
               "Group packages from jsplumb monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/jsplumb/jsplumb"],
             "groupName": "jsplumb monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "junit5 monorepo",
               "Group packages from junit5 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/junit-team/junit5"],
             "groupName": "junit5 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "kotlin monorepo",
               "Group packages from kotlin monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/JetBrains/kotlin"],
             "groupName": "kotlin monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "kroki monorepo",
               "Group packages from kroki monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/yuzutech/kroki"],
             "groupName": "kroki monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lamar monorepo",
               "Group packages from lamar monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/JasperFx/lamar"],
             "groupName": "lamar monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lerna monorepo",
               "Group packages from lerna monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/lerna/lerna"],
             "groupName": "lerna monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lexical monorepo",
               "Group packages from lexical monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/facebook/lexical"],
             "groupName": "lexical monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "linguijs monorepo",
               "Group packages from linguijs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/lingui/js-lingui"],
             "groupName": "linguijs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "log4j2 monorepo",
               "Group packages from log4j2 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apache/logging-log4j2"],
             "groupName": "log4j2 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "loopback monorepo",
               "Group packages from loopback monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/strongloop/loopback-next",
               "https://github.com/loopbackio/loopback-next"
             ],
             "groupName": "loopback monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lrnwebcomponents monorepo",
               "Group packages from lrnwebcomponents monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/elmsln/lrnwebcomponents"],
             "groupName": "lrnwebcomponents monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mailing monorepo",
               "Group packages from mailing monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/sofn-xyz/mailing"],
             "groupName": "mailing monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mantine monorepo",
               "Group packages from mantine monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mantinedev/mantine"],
             "groupName": "mantine monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mapstruct monorepo",
               "Group packages from mapstruct monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mapstruct/mapstruct"],
             "groupName": "mapstruct monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "marten monorepo",
               "Group packages from marten monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/JasperFx/marten"],
             "groupName": "marten monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "masstransit monorepo",
               "Group packages from masstransit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/MassTransit/MassTransit"],
             "groupName": "masstransit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "material-components-web monorepo",
               "Group packages from material-components-web monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/material-components/material-components-web"
             ],
             "groupName": "material-components-web monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "material-ui monorepo",
               "Group packages from material-ui monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/mui-org/material-ui",
               "https://github.com/mui/material-ui",
               "https://github.com/mui/mui-x"
             ],
             "groupName": "material-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mdc-react monorepo",
               "Group packages from mdc-react monorepo together."
             ],
             "matchSourceUrls": ["material-components/material-components-web-react"],
             "groupName": "mdc-react monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mdx monorepo",
               "Group packages from mdx monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mdx-js/mdx"],
             "groupName": "mdx monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "middy-js monorepo",
               "Group packages from middy-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/middyjs/middy"],
             "groupName": "middy-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mikro-orm monorepo",
               "Group packages from mikro-orm monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mikro-orm/mikro-orm"],
             "groupName": "mikro-orm monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ml-dotnet monorepo",
               "Group packages from ml-dotnet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dotnet/machinelearning"],
             "groupName": "ml-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mockito monorepo",
               "Group packages from mockito monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mockito/mockito"],
             "groupName": "mockito monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mongo-csharp-driver monorepo",
               "Group packages from mongo-csharp-driver monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mongodb/mongo-csharp-driver"],
             "groupName": "mongo-csharp-driver monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mstest monorepo",
               "Group packages from mstest monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/microsoft/testfx"],
             "groupName": "mstest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mutation-testing-elements monorepo",
               "Group packages from mutation-testing-elements monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/stryker-mutator/mutation-testing-elements"
             ],
             "groupName": "mutation-testing-elements monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nest monorepo",
               "Group packages from nest monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/nestjs/nest",
               "https://github.com/nestjs/passport",
               "https://github.com/nestjs/schematics",
               "https://github.com/nestjs/terminus"
             ],
             "groupName": "nest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "netty monorepo",
               "Group packages from netty monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/netty/netty"],
             "groupName": "netty monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "neutrino monorepo",
               "Group packages from neutrino monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/neutrinojs/neutrino",
               "https://github.com/mozilla-neutrino/neutrino-dev"
             ],
             "groupName": "neutrino monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nexpect monorepo",
               "Group packages from nexpect monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/fluffynuts/NExpect"],
             "groupName": "nexpect monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nextjs monorepo",
               "Group packages from nextjs monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/zeit/next.js",
               "https://github.com/vercel/next.js"
             ],
             "groupName": "nextjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nextra monorepo",
               "Group packages from nextra monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/shuding/nextra"],
             "groupName": "nextra monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ngx-formly monorepo",
               "Group packages from ngx-formly monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ngx-formly/ngx-formly"],
             "groupName": "ngx-formly monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ngxs-store monorepo",
               "Group packages from ngxs-store monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ngxs/store"],
             "groupName": "ngxs-store monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nivo monorepo",
               "Group packages from nivo monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/plouc/nivo"],
             "groupName": "nivo monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nswag monorepo",
               "Group packages from nswag monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/RicoSuter/NSwag"],
             "groupName": "nswag monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nuget monorepo",
               "Group packages from nuget monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/NuGet/NuGet.Client"],
             "groupName": "nuget monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nuxtjs monorepo",
               "Group packages from nuxtjs monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/nuxt/nuxt.js",
               "https://github.com/nuxt/nuxt"
             ],
             "groupName": "nuxtjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "okhttp monorepo",
               "Group packages from okhttp monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/square/okhttp"],
             "groupName": "okhttp monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opencost monorepo",
               "Group packages from opencost monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/opencost/opencost"],
             "groupName": "opencost monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "openiddict monorepo",
               "Group packages from openiddict monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/openiddict/openiddict-core"],
             "groupName": "openiddict monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-dotnet monorepo",
               "Group packages from opentelemetry-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-dotnet"
             ],
             "groupName": "opentelemetry-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-dotnet-contrib monorepo",
               "Group packages from opentelemetry-dotnet-contrib monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-dotnet-contrib"
             ],
             "groupName": "opentelemetry-dotnet-contrib monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-erlang monorepo",
               "Group packages from opentelemetry-erlang monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-erlang"
             ],
             "groupName": "opentelemetry-erlang monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-erlang-contrib monorepo",
               "Group packages from opentelemetry-erlang-contrib monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-erlang-contrib"
             ],
             "groupName": "opentelemetry-erlang-contrib monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-go monorepo",
               "Group packages from opentelemetry-go monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/open-telemetry/opentelemetry-go"],
             "groupName": "opentelemetry-go monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-java monorepo",
               "Group packages from opentelemetry-java monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-java"
             ],
             "groupName": "opentelemetry-java monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-js monorepo",
               "Group packages from opentelemetry-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/open-telemetry/opentelemetry-js"],
             "groupName": "opentelemetry-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "orleans monorepo",
               "Group packages from orleans monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dotnet/orleans"],
             "groupName": "orleans monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "panda-css monorepo",
               "Group packages from panda-css monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/chakra-ui/panda"],
             "groupName": "panda-css monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "parcel monorepo",
               "Group packages from parcel monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/parcel-bundler/parcel"],
             "groupName": "parcel monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "percy-cli monorepo",
               "Group packages from percy-cli monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/percy/cli"],
             "groupName": "percy-cli monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "picassojs monorepo",
               "Group packages from picassojs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/qlik-oss/picasso.js"],
             "groupName": "picassojs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "pixijs monorepo",
               "Group packages from pixijs monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/pixijs/pixi.js",
               "https://github.com/pixijs/pixijs"
             ],
             "groupName": "pixijs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "playwright monorepo",
               "Group packages from playwright monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/microsoft/playwright"],
             "groupName": "playwright monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "playwright-dotnet monorepo",
               "Group packages from playwright-dotnet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/microsoft/playwright-dotnet"],
             "groupName": "playwright-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "pnpjs monorepo",
               "Group packages from pnpjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/pnp/pnpjs"],
             "groupName": "pnpjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "pollyjs monorepo",
               "Group packages from pollyjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Netflix/pollyjs"],
             "groupName": "pollyjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "pouchdb monorepo",
               "Group packages from pouchdb monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/pouchdb/pouchdb"],
             "groupName": "pouchdb monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "prisma monorepo",
               "Group packages from prisma monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/prisma/prisma"],
             "groupName": "prisma monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "prometheus-net monorepo",
               "Group packages from prometheus-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/prometheus-net/prometheus-net"],
             "groupName": "prometheus-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "promster monorepo",
               "Group packages from promster monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/tdeekens/promster"],
             "groupName": "promster monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "quartznet monorepo",
               "Group packages from quartznet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/quartznet/quartznet"],
             "groupName": "quartznet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "reach-ui monorepo",
               "Group packages from reach-ui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reach/reach-ui"],
             "groupName": "reach-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react monorepo",
               "Group packages from react monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/facebook/react"],
             "groupName": "react monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-admin monorepo",
               "Group packages from react-admin monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/marmelab/react-admin"],
             "groupName": "react-admin monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-apollo monorepo",
               "Group packages from react-apollo monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apollographql/react-apollo"],
             "groupName": "react-apollo monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-dnd monorepo",
               "Group packages from react-dnd monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/react-dnd/react-dnd"],
             "groupName": "react-dnd monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-navigation monorepo",
               "Group packages from react-navigation monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/react-navigation/react-navigation"
             ],
             "groupName": "react-navigation monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-page monorepo",
               "Group packages from react-page monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/react-page/react-page"],
             "groupName": "react-page monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-router monorepo",
               "Group packages from react-router monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/ReactTraining/react-router",
               "https://github.com/remix-run/react-router"
             ],
             "groupName": "react-router monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "reactivestack-cookies monorepo",
               "Group packages from reactivestack-cookies monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reactivestack/cookies"],
             "groupName": "reactivestack-cookies monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "reakit monorepo",
               "Group packages from reakit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reakit/reakit"],
             "groupName": "reakit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "redwood monorepo",
               "Group packages from redwood monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/redwoodjs/redwood"],
             "groupName": "redwood monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "refit monorepo",
               "Group packages from refit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reactiveui/refit"],
             "groupName": "refit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "reg-suit monorepo",
               "Group packages from reg-suit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reg-viz/reg-suit"],
             "groupName": "reg-suit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "remark monorepo",
               "Group packages from remark monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/remarkjs/remark"],
             "groupName": "remark monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "remix monorepo",
               "Group packages from remix monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/remix-run/remix"],
             "groupName": "remix monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "rjsf monorepo",
               "Group packages from rjsf monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/rjsf-team/react-jsonschema-form"],
             "groupName": "rjsf monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "router5 monorepo",
               "Group packages from router5 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/router5/router5"],
             "groupName": "router5 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "rust-futures monorepo",
               "Group packages from rust-futures monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/rust-lang/futures-rs"],
             "groupName": "rust-futures monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "rust-wasm-bindgen monorepo",
               "Group packages from rust-wasm-bindgen monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/rustwasm/wasm-bindgen"],
             "groupName": "rust-wasm-bindgen monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sanity monorepo",
               "Group packages from sanity monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/sanity-io/sanity"],
             "groupName": "sanity monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "scaffdog monorepo",
               "Group packages from scaffdog monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/scaffdog/scaffdog"],
             "groupName": "scaffdog monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "secretlint monorepo",
               "Group packages from secretlint monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/secretlint/secretlint"],
             "groupName": "secretlint monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sendgrid-nodejs monorepo",
               "Group packages from sendgrid-nodejs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/sendgrid/sendgrid-nodejs"],
             "groupName": "sendgrid-nodejs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sentry-dotnet monorepo",
               "Group packages from sentry-dotnet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/getsentry/sentry-dotnet"],
             "groupName": "sentry-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sentry-javascript monorepo",
               "Group packages from sentry-javascript monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/getsentry/sentry-javascript"],
             "groupName": "sentry-javascript monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sentry-ruby monorepo",
               "Group packages from sentry-ruby monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/getsentry/sentry-ruby"],
             "groupName": "sentry-ruby monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sentry-rust monorepo",
               "Group packages from sentry-rust monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/getsentry/sentry-rust"],
             "groupName": "sentry-rust monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "serde monorepo",
               "Group packages from serde monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/serde-rs/serde"],
             "groupName": "serde monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "serenity-js monorepo",
               "Group packages from serenity-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/serenity-js/serenity-js"],
             "groupName": "serenity-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "shedlock monorepo",
               "Group packages from shedlock monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/lukas-krecan/ShedLock"],
             "groupName": "shedlock monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "shopify-app-bridge monorepo",
               "Group packages from shopify-app-bridge monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Shopify/app-bridge"],
             "groupName": "shopify-app-bridge monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sitecore-jss monorepo",
               "Group packages from sitecore-jss monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Sitecore/jss"],
             "groupName": "sitecore-jss monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "skiasharp monorepo",
               "Group packages from skiasharp monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mono/SkiaSharp"],
             "groupName": "skiasharp monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "slf4j monorepo",
               "Group packages from slf4j monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/qos-ch/slf4j"],
             "groupName": "slf4j monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "spectre-console monorepo",
               "Group packages from spectre-console monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/spectreconsole/spectre.console"],
             "groupName": "spectre-console monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "springfox monorepo",
               "Group packages from springfox monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/springfox/springfox"],
             "groupName": "springfox monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "steeltoe monorepo",
               "Group packages from steeltoe monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/SteeltoeOSS/steeltoe"],
             "groupName": "steeltoe monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "storybook monorepo",
               "Group packages from storybook monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/storybookjs/storybook"],
             "groupName": "storybook monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "storybook-react-native monorepo",
               "Group packages from storybook-react-native monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/storybookjs/react-native"],
             "groupName": "storybook-react-native monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "strapi monorepo",
               "Group packages from strapi monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/strapi/strapi"],
             "groupName": "strapi monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "stryker-js monorepo",
               "Group packages from stryker-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/stryker-mutator/stryker-js"],
             "groupName": "stryker-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "surveyjs monorepo",
               "Group packages from surveyjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/surveyjs/surveyjs"],
             "groupName": "surveyjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "swashbuckle-aspnetcore monorepo",
               "Group packages from swashbuckle-aspnetcore monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/domaindrivendev/Swashbuckle.AspNetCore"
             ],
             "groupName": "swashbuckle-aspnetcore monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "system.io.abstractions monorepo",
               "Group packages from system.io.abstractions monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/System-IO-Abstractions/System.IO.Abstractions/"
             ],
             "groupName": "system.io.abstractions monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tamagui monorepo",
               "Group packages from tamagui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/tamagui/tamagui"],
             "groupName": "tamagui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tanstack-query monorepo",
               "Group packages from tanstack-query monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/TanStack/query"],
             "groupName": "tanstack-query monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tanstack-router monorepo",
               "Group packages from tanstack-router monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/TanStack/router"],
             "groupName": "tanstack-router monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tauri monorepo",
               "Group packages from tauri monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/tauri-apps/tauri"],
             "groupName": "tauri monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "telus-tds monorepo",
               "Group packages from telus-tds monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/telusdigital/tds"],
             "groupName": "telus-tds monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "telus-tds-core monorepo",
               "Group packages from telus-tds-core monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/telus/tds-core"],
             "groupName": "telus-tds-core monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "temporalio-ts monorepo",
               "Group packages from temporalio-ts monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/temporalio/sdk-typescript"],
             "groupName": "temporalio-ts monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "testcontainers-dotnet monorepo",
               "Group packages from testcontainers-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/testcontainers/testcontainers-dotnet"
             ],
             "groupName": "testcontainers-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "testcontainers-go monorepo",
               "Group packages from testcontainers-go monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/testcontainers/testcontainers-go"
             ],
             "groupName": "testcontainers-go monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "testcontainers-java monorepo",
               "Group packages from testcontainers-java monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/testcontainers/testcontainers-java"
             ],
             "groupName": "testcontainers-java monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "testcontainers-node monorepo",
               "Group packages from testcontainers-node monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/testcontainers/testcontainers-node"
             ],
             "groupName": "testcontainers-node monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "theme-ui monorepo",
               "Group packages from theme-ui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/system-ui/theme-ui"],
             "groupName": "theme-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tika monorepo",
               "Group packages from tika monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apache/tika"],
             "groupName": "tika monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tiptap monorepo",
               "Group packages from tiptap monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ueberdosis/tiptap"],
             "groupName": "tiptap monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "treat monorepo",
               "Group packages from treat monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/seek-oss/treat"],
             "groupName": "treat monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "trpc monorepo",
               "Group packages from trpc monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/trpc/trpc"],
             "groupName": "trpc monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "trust-dns monorepo",
               "Group packages from trust-dns monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/bluejekyll/trust-dns"],
             "groupName": "trust-dns monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tsoa monorepo",
               "Group packages from tsoa monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/lukeautry/tsoa"],
             "groupName": "tsoa monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "turbo monorepo",
               "Group packages from turbo monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vercel/turbo"],
             "groupName": "turbo monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "typed-signalr monorepo",
               "Group packages from typed-signalr monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/nenoNaninu/TypedSignalR.Client.TypeScript"
             ],
             "groupName": "typed-signalr monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "typefaces monorepo",
               "Group packages from typefaces monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/KyleAMathews/typefaces"],
             "groupName": "typefaces monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "typescript-eslint monorepo",
               "Group packages from typescript-eslint monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/typescript-eslint/typescript-eslint"
             ],
             "groupName": "typescript-eslint monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "typography-js monorepo",
               "Group packages from typography-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/KyleAMathews/typography.js"],
             "groupName": "typography-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "unocss monorepo",
               "Group packages from unocss monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/unocss/unocss"],
             "groupName": "unocss monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "uppy monorepo",
               "Group packages from uppy monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/transloadit/uppy"],
             "groupName": "uppy monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vaadinWebComponents monorepo",
               "Group packages from vaadinWebComponents monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vaadin/web-components"],
             "groupName": "vaadinWebComponents monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "visx monorepo",
               "Group packages from visx monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/airbnb/visx"],
             "groupName": "visx monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vitest monorepo",
               "Group packages from vitest monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vitest-dev/vitest"],
             "groupName": "vitest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vstest monorepo",
               "Group packages from vstest monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/microsoft/vstest"],
             "groupName": "vstest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vue monorepo",
               "Group packages from vue monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/vuejs/vue",
               "https://github.com/vuejs/core"
             ],
             "groupName": "vue monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vue-cli monorepo",
               "Group packages from vue-cli monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vuejs/vue-cli"],
             "groupName": "vue-cli monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vuepress monorepo",
               "Group packages from vuepress monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vuejs/vuepress"],
             "groupName": "vuepress monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "web3-react monorepo",
               "Group packages from web3-react monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Uniswap/web3-react"],
             "groupName": "web3-react monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "webdriverio monorepo",
               "Group packages from webdriverio monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/webdriverio/webdriverio"],
             "groupName": "webdriverio monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "wolverine monorepo",
               "Group packages from wolverine monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/jasperfx/wolverine"],
             "groupName": "wolverine monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "workbox monorepo",
               "Group packages from workbox monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/googlechrome/workbox"],
             "groupName": "workbox monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "xstate monorepo",
               "Group packages from xstate monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/statelyai/xstate"],
             "groupName": "xstate monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "xterm monorepo",
               "Group packages from xterm monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/xtermjs/xterm.js"],
             "groupName": "xterm monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "xunit-dotnet monorepo",
               "Group packages from xunit-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/xunit/assert.xunit",
               "https://github.com/xunit/visualstudio.xunit",
               "https://github.com/xunit/xunit",
               "https://github.com/xunit/xunit.analyzers"
             ],
             "groupName": "xunit-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "yarn monorepo",
               "Group packages from yarn monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/yarnpkg/berry"],
             "groupName": "yarn monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "zag-js monorepo",
               "Group packages from zag-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/chakra-ui/zag"],
             "groupName": "zag-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "zxing-net monorepo",
               "Group packages from zxing-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/micjahn/ZXing.Net"],
             "groupName": "zxing-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "hapijs monorepo",
               "Group packages from hapijs monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/hapijs/"],
             "groupName": "hapijs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lodash monorepo",
               "Group packages from lodash monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/lodash/"],
             "groupName": "lodash monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ngrx monorepo",
               "Group packages from ngrx monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/ngrx/"],
             "groupName": "ngrx monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nrwl monorepo",
               "Group packages from nrwl monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/nrwl/"],
             "groupName": "nrwl monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "octokit monorepo",
               "Group packages from octokit monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/octokit/"],
             "groupName": "octokit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "semantic-release monorepo",
               "Group packages from semantic-release monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/semantic-release/"],
             "groupName": "semantic-release monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "swc monorepo",
               "Group packages from swc monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/swc-project/"],
             "groupName": "swc monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@angular/material", "^@angular/cdk"],
             "description": ["Group packages from angularmaterial monorepo together."],
             "groupName": "angularmaterial monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^org.apache.camel:"],
             "description": ["Group packages from apache-camel monorepo together."],
             "groupName": "apache-camel monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^com.amazonaws:aws-java-sdk-"],
             "description": ["Group packages from aws-java-sdk monorepo together."],
             "groupName": "aws-java-sdk monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^software.amazon.awssdk:"],
             "description": ["Group packages from aws-java-sdk-v2 monorepo together."],
             "groupName": "aws-java-sdk-v2 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^babel6$"],
             "description": ["Group packages from babel6 monorepo together."],
             "groupName": "babel6 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@embroider/"],
             "description": ["Group packages from embroider monorepo together."],
             "groupName": "embroider monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@forge/"],
             "description": ["Group packages from forge monorepo together."],
             "groupName": "forge monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@fullcalendar/"],
             "description": ["Group packages from fullcalendar monorepo together."],
             "groupName": "fullcalendar monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^HotChocolate\\."],
             "description": ["Group packages from hotchocolate monorepo together."],
             "groupName": "hotchocolate monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^io.prometheus:simpleclient"],
             "description": [
               "Group packages from prometheus-simpleclient monorepo together."
             ],
             "groupName": "prometheus-simpleclient monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^russh$", "^russh-keys$"],
             "description": ["Group packages from russh monorepo together."],
             "groupName": "russh monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": [
               "^@microsoft/sp-",
               "^@microsoft/eslint-.+-spfx$"
             ],
             "description": ["Group packages from spfx monorepo together."],
             "groupName": "spfx monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^org\\.spockframework:spock-"],
             "description": ["Group packages from spock monorepo together."],
             "groupName": "spock monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^Syncfusion\\."],
             "description": [
               "Group packages from syncfusion-dotnet monorepo together."
             ],
             "groupName": "syncfusion-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@wordpress/"],
             "description": ["Group packages from wordpress monorepo together."],
             "groupName": "wordpress monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "commitMessageTopic": "Node.js",
             "excludePackageNames": [
               "calico/node",
               "docker.io/calico/node",
               "kindest/node"
             ],
             "matchDatasources": ["docker"],
             "matchDepNames": ["node"],
             "matchPackagePatterns": ["/node$"]
           },
           {
             "description": ["All packages published by Apollo GraphQL."],
             "matchSourceUrlPrefixes": ["https://github.com/apollographql/"],
             "groupName": "Apollo GraphQL packages"
           },
           {"groupName": "CodeMirror", "matchPackagePrefixes": ["@codemirror/"]},
           {"groupName": "Font Awesome", "matchPackagePrefixes": ["@fortawesome/"]},
           {
             "groupName": "GitHub Artifact Actions",
             "matchManagers": ["github-actions"],
             "matchPackageNames": [
               "actions/download-artifact",
               "actions/upload-artifact"
             ],
             "matchUpdateTypes": ["major"]
           },
           {
             "groupName": "Glimmer.js packages",
             "groupSlug": "glimmer",
             "matchPackageNames": ["@glimmer/component", "@glimmer/tracking"]
           },
           {
             "groupName": "go-openapi packages",
             "groupSlug": "go-openapi",
             "matchDatasources": ["go"],
             "matchPackagePrefixes": ["github.com/go-openapi/"]
           },
           {"groupName": "hibernate core", "matchPackagePrefixes": ["org.hibernate:"]},
           {
             "groupName": "hibernate validator",
             "matchPackagePrefixes": ["org.hibernate.validator:"]
           },
           {
             "groupName": "hibernate ogm",
             "matchPackagePrefixes": ["org.hibernate.ogm:"]
           },
           {
             "groupName": "hibernate commons",
             "matchPackagePrefixes": ["org.hibernate.common:"]
           },
           {
             "groupName": "illuminate packages",
             "groupSlug": "illuminate",
             "matchPackagePrefixes": ["illuminate/"]
           },
           {
             "groupName": "jekyll ecosystem packages",
             "matchSourceUrlPrefixes": [
               "https://github.com/jekyll/",
               "https://github.com/github/pages-gem"
             ]
           },
           {
             "groupName": "jest monorepo",
             "matchSourceUrls": ["https://github.com/kulshekhar/ts-jest"],
             "matchUpdateTypes": ["major"]
           },
           {
             "groupName": "jest monorepo",
             "matchPackageNames": ["@types/jest"],
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "groupName": "JWT Framework packages",
             "matchDatasources": ["packagist"],
             "matchPackagePrefixes": ["web-token/"]
           },
           {
             "groupName": "kubernetes packages",
             "groupSlug": "kubernetes-go",
             "matchDatasources": ["go"],
             "matchPackagePrefixes": [
               "k8s.io/api",
               "k8s.io/apiextensions-apiserver",
               "k8s.io/apimachinery",
               "k8s.io/apiserver",
               "k8s.io/cli-runtime",
               "k8s.io/client-go",
               "k8s.io/cloud-provider",
               "k8s.io/cluster-bootstrap",
               "k8s.io/code-generator",
               "k8s.io/component-base",
               "k8s.io/controller-manager",
               "k8s.io/cri-api",
               "k8s.io/csi-translation-lib",
               "k8s.io/kube-aggregator",
               "k8s.io/kube-controller-manager",
               "k8s.io/kube-proxy",
               "k8s.io/kube-scheduler",
               "k8s.io/kubectl",
               "k8s.io/kubelet",
               "k8s.io/legacy-cloud-providers",
               "k8s.io/metrics",
               "k8s.io/mount-utils",
               "k8s.io/pod-security-admission",
               "k8s.io/sample-apiserver",
               "k8s.io/sample-cli-plugin",
               "k8s.io/sample-controller"
             ]
           },
           {
             "groupName": "PHPStan packages",
             "matchDatasources": ["packagist"],
             "matchPackagePatterns": ["^phpstan/phpstan$", "/phpstan-", "/larastan"]
           },
           {"groupName": "polymer packages", "matchPackagePrefixes": ["@polymer/"]},
           {
             "groupName": "react monorepo",
             "matchPackageNames": ["@types/react", "@types/react-dom"]
           },
           {
             "groupName": "remark",
             "matchDatasources": ["npm"],
             "matchSourceUrlPrefixes": ["https://github.com/remarkjs/"]
           },
           {
             "groupName": "resilience4j",
             "matchPackagePrefixes": ["io.github.resilience4j:"]
           },
           {
             "groupName": "Ruby on Rails packages",
             "matchDatasources": ["rubygems"],
             "matchPackageNames": [
               "actioncable",
               "actionmailbox",
               "actionmailer",
               "actionpack",
               "actiontext",
               "actionview",
               "activejob",
               "activemodel",
               "activerecord",
               "activestorage",
               "activesupport",
               "railties",
               "rails"
             ]
           },
           {
             "groupName": "omniauth packages",
             "matchDatasources": ["rubygems"],
             "matchPackagePrefixes": ["omniauth"]
           },
           {"groupName": "socket.io packages", "matchPackagePrefixes": ["socket.io"]},
           {
             "groupName": "spring amqp",
             "matchPackagePrefixes": ["org.springframework.amqp:"]
           },
           {
             "groupName": "spring android",
             "matchPackagePrefixes": ["org.springframework.android:"]
           },
           {
             "groupName": "spring batch",
             "matchPackagePrefixes": ["org.springframework.batch:"]
           },
           {
             "groupName": "spring boot",
             "matchDepNames": ["org.springframework.boot"],
             "matchPackagePrefixes": ["org.springframework.boot:"]
           },
           {
             "groupName": "spring cloud",
             "matchPackagePrefixes": ["org.springframework.cloud:"]
           },
           {
             "groupName": "spring core",
             "matchPackagePrefixes": ["org.springframework:"]
           },
           {
             "groupName": "spring data",
             "matchPackagePrefixes": ["org.springframework.data:"]
           },
           {
             "groupName": "spring hateoas",
             "matchPackagePrefixes": ["org.springframework.hateoas:"]
           },
           {
             "groupName": "spring integration",
             "matchPackagePrefixes": ["org.springframework.integration:"]
           },
           {
             "groupName": "spring kafka",
             "matchPackagePrefixes": ["org.springframework.kafka:"]
           },
           {
             "groupName": "spring ldap",
             "matchPackagePrefixes": ["org.springframework.ldap:"]
           },
           {
             "groupName": "spring mobile",
             "matchPackagePrefixes": ["org.springframework.mobile:"]
           },
           {
             "groupName": "spring osgi",
             "matchPackagePrefixes": ["org.springframework.osgi:"]
           },
           {
             "groupName": "spring restdocs",
             "matchPackagePrefixes": ["org.springframework.restdocs:"]
           },
           {
             "groupName": "spring roo",
             "matchPackagePrefixes": ["org.springframework.roo:"]
           },
           {
             "groupName": "spring scala",
             "matchPackagePrefixes": ["org.springframework.scala:"]
           },
           {
             "groupName": "spring security",
             "matchPackagePrefixes": ["org.springframework.security:"]
           },
           {
             "groupName": "spring session",
             "matchPackagePrefixes": ["org.springframework.session:"]
           },
           {
             "groupName": "spring shell",
             "matchPackagePrefixes": ["org.springframework.shell:"]
           },
           {
             "groupName": "spring social",
             "matchPackagePrefixes": ["org.springframework.social:"]
           },
           {
             "groupName": "spring statemachine",
             "matchPackagePrefixes": ["org.springframework.statemachine:"]
           },
           {
             "groupName": "spring webflow",
             "matchPackagePrefixes": ["org.springframework.webflow:"]
           },
           {
             "groupName": "spring ws",
             "matchPackagePrefixes": ["org.springframework.ws:"]
           },
           {
             "groupName": "symfony packages",
             "groupSlug": "symfony",
             "matchPackagePrefixes": ["symfony/"]
           },
           {
             "matchCurrentVersion": ">=3.10.3",
             "matchDatasources": ["npm"],
             "matchPackageNames": [
               "apollo-server",
               "apollo-server-core",
               "apollo-server-express"
             ],
             "replacementName": "@apollo/server",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.3.1",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-server-errors"],
             "replacementName": "@apollo/server",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.6.3",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-server-types", "apollo-server-plugin-base"],
             "replacementName": "@apollo/server",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.7.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-datasource-rest"],
             "replacementName": "@apollo/datasource-rest",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.7.1",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-server-plugin-response-cache"],
             "replacementName": "@apollo/server-plugin-response-cache",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.5.1",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-server-plugin-operation-registry"],
             "replacementName": "@apollo/server-plugin-operation-registry",
             "replacementVersion": "3.5.6"
           },
           {
             "matchCurrentVersion": ">=3.3.3",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-reporting-protobuf"],
             "replacementName": "@apollo/usage-reporting-protobuf",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=7.11.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["babel-eslint"],
             "replacementName": "@babel/eslint-parser",
             "replacementVersion": "7.11.0"
           },
           {
             "description": [
               "Replace `containerbase/(buildpack|base)` and `renovate/buildpack` with `ghcr.io/containerbase/base`."
             ],
             "matchDatasources": ["docker"],
             "matchPackagePatterns": [
               "^(?:docker\\.io/)?containerbase/(?:buildpack|base)$",
               "^ghcr\\.io/containerbase/buildpack$",
               "^(?:docker\\.io/)?renovate/buildpack$"
             ],
             "replacementName": "ghcr.io/containerbase/base"
           },
           {
             "description": [
               "Replace `containerbase/node` and `renovate/node` with `ghcr.io/containerbase/node`."
             ],
             "matchDatasources": ["docker"],
             "matchPackagePatterns": [
               "^(?:docker\\.io/)?(?:containerbase|renovate)/node$"
             ],
             "replacementName": "ghcr.io/containerbase/node"
           },
           {
             "description": [
               "Replace `containerbase/sidecar` and `renovate/sidecar` with `ghcr.io/containerbase/sidecar`."
             ],
             "matchDatasources": ["docker"],
             "matchPackagePatterns": [
               "^(?:docker\\.io/)?(?:containerbase|renovate)/sidecar$"
             ],
             "replacementName": "ghcr.io/containerbase/sidecar"
           },
           {
             "description": [
               "Replace `renovatebot/internal-tools` with `containerbase/internal-tools`."
             ],
             "matchDatasources": ["github-tags"],
             "matchPackageNames": ["renovatebot/internal-tools"],
             "replacementName": "containerbase/internal-tools"
           },
           {
             "description": ["Replace `renovate` `slim` docker tag with `latest`."],
             "matchCurrentValue": "/^slim$/",
             "matchDatasources": ["docker"],
             "matchPackageNames": ["ghcr.io/renovatebot/renovate"],
             "matchPackagePatterns": ["^(?:docker\\.io/)?renovate/renovate$"],
             "replacementVersion": "latest"
           },
           {
             "description": ["Remove `renovate` `-slim` docker tag suffix."],
             "extractVersion": "^(?<version>.+)-slim$",
             "matchCurrentValue": "/-slim$/",
             "matchDatasources": ["docker"],
             "matchPackageNames": ["ghcr.io/renovatebot/renovate"],
             "matchPackagePatterns": ["^(?:docker\\.io/)?renovate/renovate$"],
             "versioning": "semver"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["cpx"],
             "replacementName": "cpx2",
             "replacementVersion": "2.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["cucumber"],
             "replacementName": "@cucumber/cucumber",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": "^11.1.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["eslint-plugin-node"],
             "replacementName": "eslint-plugin-n",
             "replacementVersion": "14.0.0"
           },
           {
             "matchCurrentVersion": ">=5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "5.5.3"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "4.1.0"
           },
           {
             "matchCurrentVersion": ">=3.0.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "3.1.0"
           },
           {
             "matchCurrentVersion": ">=2.0.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "2.1.5"
           },
           {
             "matchCurrentVersion": "<2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "1.1.0"
           },
           {
             "matchCurrentVersion": ">=3.3.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-accepts-serializer"],
             "replacementName": "@fastify/accepts-serializer",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=2.3.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-accepts"],
             "replacementName": "@fastify/accepts",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=1.2.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-auth"],
             "replacementName": "@fastify/auth",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=3.13.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-autoload"],
             "replacementName": "@fastify/autoload",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=1.3.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-awilix"],
             "replacementName": "@fastify/awilix",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=2.3.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-basic-auth"],
             "replacementName": "@fastify/basic-auth",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=6.3.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-bearer-auth"],
             "replacementName": "@fastify/bearer-auth",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=6.3.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-caching"],
             "replacementName": "@fastify/caching",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=1.2.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-circuit-breaker"],
             "replacementName": "@fastify/circuit-breaker",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=4.1.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-compress"],
             "replacementName": "@fastify/compress",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=5.7.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-cookie"],
             "replacementName": "@fastify/cookie",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=6.1.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-cors"],
             "replacementName": "@fastify/cors",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=1.1.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-diagnostics-channel"],
             "replacementName": "@fastify/diagnostics-channel",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=1.2.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-elasticsearch"],
             "replacementName": "@fastify/elasticsearch",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=2.2.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-env"],
             "replacementName": "@fastify/env",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=1.2.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-error"],
             "replacementName": "@fastify/error",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=2.2.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-etag"],
             "replacementName": "@fastify/etag",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=0.4.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-express"],
             "replacementName": "@fastify/express",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=3.1.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-flash"],
             "replacementName": "@fastify/flash",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=5.3.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-formbody"],
             "replacementName": "@fastify/formbody",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=1.1.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-funky"],
             "replacementName": "@fastify/funky",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=7.1.0 <8.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-helmet"],
             "replacementName": "@fastify/helmet",
             "replacementVersion": "8.0.0"
           },
           {
             "matchCurrentVersion": ">=0.3.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-hotwire"],
             "replacementName": "@fastify/hotwire",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=6.3.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-http-proxy"],
             "replacementName": "@fastify/http-proxy",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=4.2.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-jwt"],
             "replacementName": "@fastify/jwt",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=0.3.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-kafka"],
             "replacementName": "@fastify/kafka",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=3.2.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-leveldb"],
             "replacementName": "@fastify/leveldb",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=4.2.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-mongodb"],
             "replacementName": "@fastify/mongodb",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=5.4.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-multipart"],
             "replacementName": "@fastify/multipart",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=2.2.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-mysql"],
             "replacementName": "@fastify/mysql",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=7.3.0 <8.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-nextjs"],
             "replacementName": "@fastify/nextjs",
             "replacementVersion": "8.0.0"
           },
           {
             "matchCurrentVersion": ">=4.6.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-oauth2"],
             "replacementName": "@fastify/oauth2",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=0.5.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-passport"],
             "replacementName": "@fastify/passport",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=3.7.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-postgres"],
             "replacementName": "@fastify/postgres",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=5.9.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-rate-limit"],
             "replacementName": "@fastify/rate-limit",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=4.4.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-redis"],
             "replacementName": "@fastify/redis",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=6.7.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-reply-from"],
             "replacementName": "@fastify/reply-from",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=2.3.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-request-context"],
             "replacementName": "@fastify/request-context",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=0.3.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-response-validation"],
             "replacementName": "@fastify/response-validation",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=2.1.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-routes-stats"],
             "replacementName": "@fastify/routes-stats",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=3.2.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-routes"],
             "replacementName": "@fastify/routes",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=1.1.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-schedule"],
             "replacementName": "@fastify/schedule",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=3.2.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-secure-session"],
             "replacementName": "@fastify/secure-session",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.2.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-sensible"],
             "replacementName": "@fastify/sensible",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=0.3.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-soap-client"],
             "replacementName": "@fastify/soap-client",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=4.7.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-static"],
             "replacementName": "@fastify/static",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=5.2.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-swagger"],
             "replacementName": "@fastify/swagger",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=3.1.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-url-data"],
             "replacementName": "@fastify/url-data",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=4.3.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-websocket"],
             "replacementName": "@fastify/websocket",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=2.1.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-zipkin"],
             "replacementName": "@fastify/zipkin",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=18.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["hapi"],
             "replacementName": "@hapi/hapi",
             "replacementVersion": "18.2.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["jade"],
             "replacementName": "pug",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=14.0.0 <14.4.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["joi"],
             "replacementName": "@hapi/joi",
             "replacementVersion": "14.4.0"
           },
           {
             "matchCurrentVersion": ">=17.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@hapi/joi"],
             "replacementName": "joi",
             "replacementVersion": "17.1.1"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackagePatterns": ["^k8s\\.gcr\\.io/.+$"],
             "replacementNameTemplate": "{{{replace 'k8s\\.gcr\\.io/' 'registry.k8s.io/' packageName}}}"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/codemod"],
             "replacementName": "@mui/codemod",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/core"],
             "replacementName": "@mui/material",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/icons"],
             "replacementName": "@mui/icons-material",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/lab"],
             "replacementName": "@mui/labs",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/private-theming"],
             "replacementName": "@mui/private-theming",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/styled-engine"],
             "replacementName": "@mui/styled-engine",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/styled-engine-sc"],
             "replacementName": "@mui/styled-engine-sc",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/styles"],
             "replacementName": "@mui/styles",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/system"],
             "replacementName": "@mui/system",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/types"],
             "replacementName": "@mui/types",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/unstyled"],
             "replacementName": "@mui/core",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": "^10.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["mem"],
             "replacementName": "memoize",
             "replacementVersion": "10.0.0"
           },
           {
             "matchCurrentVersion": ">=2.0.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["messageformat-cli"],
             "replacementName": "@messageformat/cli",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=2.0.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["messageformat"],
             "replacementName": "@messageformat/core",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=0.4.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["messageformat-convert"],
             "replacementName": "@messageformat/convert",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=0.4.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["react-message-context"],
             "replacementName": "@messageformat/react",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["messageformat-parser"],
             "replacementName": "@messageformat/parser",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=7.1.0 <8.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["middie"],
             "replacementName": "@fastify/middie",
             "replacementVersion": "8.0.0"
           },
           {
             "matchCurrentVersion": ">=21.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["now"],
             "replacementName": "vercel",
             "replacementVersion": "21.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["npm-run-all"],
             "replacementName": "npm-run-all2",
             "replacementVersion": "5.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@parcel/css"],
             "replacementName": "lightningcss",
             "replacementVersion": "1.14.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["passport-saml"],
             "replacementName": "@node-saml/passport-saml",
             "replacementVersion": "4.0.4"
           },
           {
             "matchCurrentVersion": ">=2.0.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["react-query/devtools"],
             "replacementName": "@tanstack/react-query-devtools",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.0.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["react-query"],
             "replacementName": "@tanstack/react-query",
             "replacementVersion": "4.0.5"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["react-scripts-ts"],
             "replacementName": "react-scripts",
             "replacementVersion": "2.1.8"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["read-pkg-up"],
             "replacementName": "read-package-up",
             "replacementVersion": "11.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["redux-devtools-extension"],
             "replacementName": "@redux-devtools/extension",
             "replacementVersion": "3.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@renovate/pep440"],
             "replacementName": "@renovatebot/pep440",
             "replacementVersion": "1.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rollup-plugin-babel"],
             "replacementName": "@rollup/plugin-babel",
             "replacementVersion": "5.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rollup-plugin-json"],
             "replacementName": "@rollup/plugin-json",
             "replacementVersion": "4.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rollup-plugin-node-resolve"],
             "replacementName": "@rollup/plugin-node-resolve",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rollup-plugin-terser"],
             "replacementName": "@rollup/plugin-terser",
             "replacementVersion": "0.1.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rome"],
             "replacementName": "@biomejs/biome",
             "replacementVersion": "1.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@google/semantic-release-replace-plugin"],
             "replacementName": "semantic-release-replace-plugin",
             "replacementVersion": "1.2.1"
           },
           {
             "matchDatasources": ["nuget"],
             "matchPackageNames": ["Spectre.Cli"],
             "replacementName": "Spectre.Console.Cli",
             "replacementVersion": "0.45.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["vso-task-lib"],
             "replacementName": "azure-pipelines-task-lib",
             "replacementVersion": "3.4.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["vsts-task-lib"],
             "replacementName": "azure-pipelines-task-lib",
             "replacementVersion": "3.4.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["xmldom", "xmldom-alpha"],
             "replacementName": "@xmldom/xmldom",
             "replacementVersion": "0.7.5"
           },
           {
             "allowedVersions": "!/^200\\d{5}(\\.\\d+)?/",
             "matchDatasources": ["maven", "sbt-package"],
             "matchPackagePrefixes": ["commons-"]
           },
           {
             "allowedVersions": "/^[A-Z]/",
             "matchDatasources": ["maven"],
             "matchPackageNames": [
               "org.springframework.cloud:spring-cloud-starter-parent"
             ]
           },
           {
             "allowedVersions": "!/^5\\.0\\.0/",
             "matchDatasources": ["maven"],
             "matchPackageNames": ["org.web3j:core"]
           },
           {
             "allowedVersions": "!/^1\\.0-\\d+-[a-fA-F0-9]{7}$/",
             "matchManagers": ["sbt"],
             "matchPackagePrefixes": ["org.http4s:"]
           },
           {
             "matchManagers": ["npm"],
             "matchPackageNames": ["@types/node"],
             "versioning": "node"
           },
           {
             "matchDatasources": ["docker"],
             "matchDepNames": ["node"],
             "versionCompatibility": "^(?<version>[^-]+)(?<compatibility>-.*)?$",
             "versioning": "node"
           },
           {
             "allowedVersions": "<20000000",
             "matchCurrentVersion": "!/^\\d{8}$/",
             "matchDatasources": ["docker"],
             "matchPackageNames": ["alpine"]
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": [
               "registry.access.redhat.com/rhel",
               "registry.access.redhat.com/rhel-atomic",
               "registry.access.redhat.com/rhel-init",
               "registry.access.redhat.com/rhel-minimal"
             ],
             "matchPackagePrefixes": [
               "registry.access.redhat.com/rhceph/",
               "registry.access.redhat.com/rhgs3/",
               "registry.access.redhat.com/rhel7",
               "registry.access.redhat.com/rhel8/",
               "registry.access.redhat.com/rhel9/",
               "registry.access.redhat.com/rhscl/",
               "registry.access.redhat.com/ubi7",
               "registry.access.redhat.com/ubi8",
               "registry.access.redhat.com/ubi9",
               "redhat/"
             ],
             "versioning": "redhat"
           },
           {
             "allowedVersions": "/^(?:8|11|17|21)(?:\\.|-|$)/",
             "description": [
               "Limit Java runtime versions to LTS releases. To receive all major releases add `workarounds:javaLTSVersions` to the `ignorePresets` array."
             ],
             "matchDatasources": ["docker", "java-version"],
             "matchPackageNames": [
               "eclipse-temurin",
               "amazoncorretto",
               "adoptopenjdk",
               "openjdk",
               "java",
               "java-jre",
               "sapmachine"
             ],
             "matchPackagePatterns": [
               "^azul/zulu-openjdk",
               "^bellsoft/liberica-openj(dk|re)-",
               "^cimg/openjdk"
             ],
             "versioning": "regex:^(?<major>\\d+)?(\\.(?<minor>\\d+))?(\\.(?<patch>\\d+))?([\\._+](?<build>\\d+))?(-(?<compatibility>.*))?$"
           },
           {
             "enabled": false,
             "matchDatasources": ["maven"],
             "matchPackageNames": ["org.eclipse.m2e:lifecycle-mapping"]
           },
           {
             "enabled": false,
             "matchDepTypes": ["parent-root"],
             "matchManagers": ["maven"]
           },
           {
             "description": [
               "Use node versioning for `(containerbase|renovate)/node` images"
             ],
             "matchDatasources": ["docker"],
             "matchPackagePatterns": [
               "^(?:(?:docker|ghcr)\\.io/)?(?:containerbase|renovate)/node$"
             ],
             "versioning": "node"
           },
           {"matchDatasources": ["docker"], "pinDigests": true},
           {"matchDepTypes": ["action"], "pinDigests": true},
           {"matchDepTypes": ["devDependencies"], "rangeStrategy": "pin"},
           {"matchPackagePatterns": ["*"], "semanticCommitType": "chore"},
           {"matchDepTypes": ["dependencies", "require"], "semanticCommitType": "fix"},
           {
             "matchDatasources": ["maven"],
             "matchDepTypes": [
               "compile",
               "provided",
               "runtime",
               "system",
               "import",
               "parent"
             ],
             "semanticCommitType": "fix"
           },
           {
             "description": [
               "accounts monorepo",
               "Group packages from accounts monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/accounts-js/accounts"],
             "groupName": "accounts monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "acot monorepo",
               "Group packages from acot monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/acot-a11y/acot"],
             "groupName": "acot monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ag-grid monorepo",
               "Group packages from ag-grid monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ag-grid/ag-grid"],
             "groupName": "ag-grid monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "algolia-instantsearch monorepo",
               "Group packages from algolia-instantsearch monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/algolia/instantsearch",
               "https://github.com/algolia/instantsearch.js"
             ],
             "groupName": "algolia-instantsearch monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "algolia-react-instantsearch monorepo",
               "Group packages from algolia-react-instantsearch monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/algolia/react-instantsearch"],
             "groupName": "algolia-react-instantsearch monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "algoliasearch-autocomplete monorepo",
               "Group packages from algoliasearch-autocomplete monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/algolia/autocomplete"],
             "groupName": "algoliasearch-autocomplete monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "algoliasearch-client-javascript monorepo",
               "Group packages from algoliasearch-client-javascript monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/algolia/algoliasearch-client-javascript"
             ],
             "groupName": "algoliasearch-client-javascript monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "analog monorepo",
               "Group packages from analog monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/analogjs/analog"],
             "groupName": "analog monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angular monorepo",
               "Group packages from angular monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular/angular"],
             "groupName": "angular monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angular-cli monorepo",
               "Group packages from angular-cli monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular/angular-cli"],
             "groupName": "angular-cli monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angular-eslint monorepo",
               "Group packages from angular-eslint monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular-eslint/angular-eslint"],
             "groupName": "angular-eslint monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angularfire monorepo",
               "Group packages from angularfire monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular/angularfire"],
             "groupName": "angularfire monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "angularjs monorepo",
               "Group packages from angularjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/angular/angular.js"],
             "groupName": "angularjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "apollo-server monorepo",
               "Group packages from apollo-server monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apollographql/apollo-server"],
             "groupName": "apollo-server monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "apolloclient monorepo",
               "Group packages from apolloclient monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apollographql/apollo-client"],
             "groupName": "apolloclient monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "applicationinsights-dotnet monorepo",
               "Group packages from applicationinsights-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/Microsoft/ApplicationInsights-dotnet"
             ],
             "groupName": "applicationinsights-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.background-jobs monorepo",
               "Group packages from arcus.background-jobs monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/arcus-azure/arcus.backgroundjobs"
             ],
             "groupName": "arcus.background-jobs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.event-grid monorepo",
               "Group packages from arcus.event-grid monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.eventgrid"],
             "groupName": "arcus.event-grid monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.messaging monorepo",
               "Group packages from arcus.messaging monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.messaging"],
             "groupName": "arcus.messaging monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.observability monorepo",
               "Group packages from arcus.observability monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.observability"],
             "groupName": "arcus.observability monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.security monorepo",
               "Group packages from arcus.security monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.security"],
             "groupName": "arcus.security monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "arcus.webapi monorepo",
               "Group packages from arcus.webapi monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/arcus-azure/arcus.webapi"],
             "groupName": "arcus.webapi monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aspnet aspnetwebstack monorepo",
               "Group packages from aspnet aspnetwebstack monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aspnet/AspNetWebStack"],
             "groupName": "aspnet aspnetwebstack monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aspnet extensions monorepo",
               "Group packages from aspnet extensions monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aspnet/Extensions"],
             "groupName": "aspnet extensions monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aspnet-api-versioning monorepo",
               "Group packages from aspnet-api-versioning monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Microsoft/aspnet-api-versioning"],
             "groupName": "aspnet-api-versioning monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aspnet-health-checks monorepo",
               "Group packages from aspnet-health-checks monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/xabaril/AspNetCore.Diagnostics.HealthChecks"
             ],
             "groupName": "aspnet-health-checks monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "automapper-dotnet monorepo",
               "Group packages from automapper-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/AutoMapper/AutoMapper",
               "https://github.com/AutoMapper/AutoMapper.Extensions.Microsoft.DependencyInjection"
             ],
             "groupName": "automapper-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-cdk monorepo",
               "Group packages from aws-cdk monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-cdk"],
             "groupName": "aws-cdk monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-lambda-powertools-typescript monorepo",
               "Group packages from aws-lambda-powertools-typescript monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/awslabs/aws-lambda-powertools-typescript",
               "https://github.com/aws-powertools/powertools-lambda-typescript"
             ],
             "groupName": "aws-lambda-powertools-typescript monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-client-mock monorepo",
               "Group packages from aws-sdk-client-mock monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/m-radzikowski/aws-sdk-client-mock"
             ],
             "groupName": "aws-sdk-client-mock monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-go monorepo",
               "Group packages from aws-sdk-go monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-sdk-go"],
             "groupName": "aws-sdk-go monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-go-v2 monorepo",
               "Group packages from aws-sdk-go-v2 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-sdk-go-v2"],
             "groupName": "aws-sdk-go-v2 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-js-v3 monorepo",
               "Group packages from aws-sdk-js-v3 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-sdk-js-v3"],
             "groupName": "aws-sdk-js-v3 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-net monorepo",
               "Group packages from aws-sdk-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/aws/aws-sdk-net"],
             "groupName": "aws-sdk-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "aws-sdk-rust monorepo",
               "Group packages from aws-sdk-rust monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/smithy-lang/smithy-rs",
               "https://github.com/awslabs/smithy-rs",
               "https://github.com/awslabs/aws-sdk-rust"
             ],
             "groupName": "aws-sdk-rust monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "awsappsync monorepo",
               "Group packages from awsappsync monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/awslabs/aws-mobile-appsync-sdk-js"
             ],
             "groupName": "awsappsync monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "azure azure-libraries-for-net monorepo",
               "Group packages from azure azure-libraries-for-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Azure/azure-libraries-for-net"],
             "groupName": "azure azure-libraries-for-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "azure azure-sdk-for-net monorepo",
               "Group packages from azure azure-sdk-for-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Azure/azure-sdk-for-net"],
             "groupName": "azure azure-sdk-for-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "azure azure-storage-net monorepo",
               "Group packages from azure azure-storage-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Azure/azure-storage-net"],
             "groupName": "azure azure-storage-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "babel monorepo",
               "Group packages from babel monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/babel/babel"],
             "groupName": "babel monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "backstage monorepo",
               "Group packages from backstage monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/backstage/backstage"],
             "groupName": "backstage monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "baset monorepo",
               "Group packages from baset monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/igmat/baset"],
             "groupName": "baset monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "brave monorepo",
               "Group packages from brave monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/openzipkin/brave"],
             "groupName": "brave monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "bugsnag-js monorepo",
               "Group packages from bugsnag-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/bugsnag/bugsnag-js"],
             "groupName": "bugsnag-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "cake monorepo",
               "Group packages from cake monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/cake-build/cake"],
             "groupName": "cake monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "capacitor monorepo",
               "Group packages from capacitor monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ionic-team/capacitor"],
             "groupName": "capacitor monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "chakra-ui monorepo",
               "Group packages from chakra-ui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/chakra-ui/chakra-ui"],
             "groupName": "chakra-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "chromely monorepo",
               "Group packages from chromely monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/chromelyapps/Chromely"],
             "groupName": "chromely monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@cds/", "^@clr/"],
             "description": ["Group packages from clarity monorepo together."],
             "groupName": "clarity monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "clearscript monorepo",
               "Group packages from clearscript monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/microsoft/ClearScript",
               "https://github.com/Microsoft/ClearScript"
             ],
             "groupName": "clearscript monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "commitlint monorepo",
               "Group packages from commitlint monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/conventional-changelog/commitlint"
             ],
             "groupName": "commitlint monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "contentful-rich-text monorepo",
               "Group packages from contentful-rich-text monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/contentful/rich-text"],
             "groupName": "contentful-rich-text monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datadog-browser-sdk monorepo",
               "Group packages from datadog-browser-sdk monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/DataDog/browser-sdk"],
             "groupName": "datadog-browser-sdk monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net monorepo",
               "Group packages from datatables-net monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Bulma",
               "https://github.com/DataTables/Dist-DataTables-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Foundation",
               "https://github.com/DataTables/Dist-DataTables-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-jQueryUI"
             ],
             "groupName": "datatables-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-autofill monorepo",
               "Group packages from datatables-net-autofill monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-AutoFill",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Bulma",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-DataTables",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-Foundation",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-AutoFill-jQueryUI"
             ],
             "groupName": "datatables-net-autofill monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-buttons monorepo",
               "Group packages from datatables-net-buttons monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-Buttons",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Bulma",
               "https://github.com/DataTables/Dist-DataTables-Buttons-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Buttons-Foundation",
               "https://github.com/DataTables/Dist-DataTables-Buttons-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-Buttons-jQueryUI"
             ],
             "groupName": "datatables-net-buttons monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-colreorder monorepo",
               "Group packages from datatables-net-colreorder monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-ColReorder",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Bulma",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-DataTables",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-Foundation",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-ColReorder-jQueryUI"
             ],
             "groupName": "datatables-net-colreorder monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-fixedcolumns monorepo",
               "Group packages from datatables-net-fixedcolumns monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-FixedColumns",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Bulma",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-DataTables",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-Foundation",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-FixedColumns-jQueryUI"
             ],
             "groupName": "datatables-net-fixedcolumns monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-fixedheader monorepo",
               "Group packages from datatables-net-fixedheader monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-FixedHeader",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Bulma",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-DataTables",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-Foundation",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-FixedHeader-jQueryUI"
             ],
             "groupName": "datatables-net-fixedheader monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-keytable monorepo",
               "Group packages from datatables-net-keytable monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-KeyTable",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Bulma",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-DataTables",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-Foundation",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-KeyTable-jQueryUI"
             ],
             "groupName": "datatables-net-keytable monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-responsive monorepo",
               "Group packages from datatables-net-responsive monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-Responsive",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Bulma",
               "https://github.com/DataTables/Dist-DataTables-Responsive-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Responsive-Foundation",
               "https://github.com/DataTables/Dist-DataTables-Responsive-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-Responsive-jQueryUI"
             ],
             "groupName": "datatables-net-responsive monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-rowgroup monorepo",
               "Group packages from datatables-net-rowgroup monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-RowGroup",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Bulma",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-DataTables",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-Foundation",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-RowGroup-jQueryUI"
             ],
             "groupName": "datatables-net-rowgroup monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-rowreorder monorepo",
               "Group packages from datatables-net-rowreorder monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-RowReorder",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Bulma",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-DataTables",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-Foundation",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-RowReorder-jQueryUI"
             ],
             "groupName": "datatables-net-rowreorder monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-scroller monorepo",
               "Group packages from datatables-net-scroller monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-Scroller",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Bulma",
               "https://github.com/DataTables/Dist-DataTables-Scroller-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Scroller-Foundation",
               "https://github.com/DataTables/Dist-DataTables-Scroller-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-Scroller-jQueryUI"
             ],
             "groupName": "datatables-net-scroller monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-searchbuilder monorepo",
               "Group packages from datatables-net-searchbuilder monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Bulma",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-DataTables",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-Foundation",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-SearchBuilder-jQueryUI"
             ],
             "groupName": "datatables-net-searchbuilder monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-searchpanes monorepo",
               "Group packages from datatables-net-searchpanes monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-SearchPanes",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Bulma",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-DataTables",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-Foundation",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-SearchPanes-jQueryUI"
             ],
             "groupName": "datatables-net-searchpanes monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-select monorepo",
               "Group packages from datatables-net-select monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-Select",
               "https://github.com/DataTables/Dist-DataTables-Select-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-Select-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-Select-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-Select-Bulma",
               "https://github.com/DataTables/Dist-DataTables-Select-DataTables",
               "https://github.com/DataTables/Dist-DataTables-Select-Foundation",
               "https://github.com/DataTables/Dist-DataTables-Select-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-Select-jQueryUI"
             ],
             "groupName": "datatables-net-select monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "datatables-net-staterestore monorepo",
               "Group packages from datatables-net-staterestore monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/DataTables/Dist-DataTables-StateRestore",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Bootstrap",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Bootstrap4",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Bootstrap5",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Bulma",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-DataTables",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-Foundation",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-SemanticUI",
               "https://github.com/DataTables/Dist-DataTables-StateRestore-jQueryUI"
             ],
             "groupName": "datatables-net-staterestore monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "date-io monorepo",
               "Group packages from date-io monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dmtrKovalenko/date-io"],
             "groupName": "date-io monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "deck-gl monorepo",
               "Group packages from deck-gl monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/visgl/deck.gl"],
             "groupName": "deck-gl monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "deno monorepo",
               "Group packages from deno monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/denoland/deno"],
             "groupName": "deno monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "devextreme-reactive monorepo",
               "Group packages from devextreme-reactive monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/DevExpress/devextreme-reactive"],
             "groupName": "devextreme-reactive monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dnd-kit monorepo",
               "Group packages from dnd-kit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/clauderic/dnd-kit"],
             "groupName": "dnd-kit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "docusaurus monorepo",
               "Group packages from docusaurus monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/facebook/docusaurus"],
             "groupName": "docusaurus monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dot-swashbuckle monorepo",
               "Group packages from dot-swashbuckle monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Havunen/DotSwashbuckle"],
             "groupName": "dot-swashbuckle monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dotnet monorepo",
               "Group packages from dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/dotnet/aspnetcore",
               "https://github.com/dotnet/efcore",
               "https://github.com/dotnet/extensions",
               "https://github.com/dotnet/maui",
               "https://github.com/dotnet/runtime",
               "https://github.com/dotnet/scaffolding",
               "https://github.com/dotnet/sdk"
             ],
             "groupName": "dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dotnet-azure-ad-identitymodel-extensions monorepo",
               "Group packages from dotnet-azure-ad-identitymodel-extensions monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/AzureAD/azure-activedirectory-identitymodel-extensions-for-dotnet"
             ],
             "groupName": "dotnet-azure-ad-identitymodel-extensions monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dotnet-azure-ad-microsoft-identity-web monorepo",
               "Group packages from dotnet-azure-ad-microsoft-identity-web monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/AzureAD/microsoft-identity-web"],
             "groupName": "dotnet-azure-ad-microsoft-identity-web monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dotnet-wcf monorepo",
               "Group packages from dotnet-wcf monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dotnet/wcf"],
             "groupName": "dotnet-wcf monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "dropwizard monorepo",
               "Group packages from dropwizard monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dropwizard/dropwizard"],
             "groupName": "dropwizard monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "elastic-apm-agent-rum-js monorepo",
               "Group packages from elastic-apm-agent-rum-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/elastic/apm-agent-rum-js"],
             "groupName": "elastic-apm-agent-rum-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "electron-forge monorepo",
               "Group packages from electron-forge monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/electron-userland/electron-forge",
               "https://github.com/electron/forge"
             ],
             "groupName": "electron-forge monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ember-decorators monorepo",
               "Group packages from ember-decorators monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/ember-decorators/ember-decorators"
             ],
             "groupName": "ember-decorators monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "emojibase monorepo",
               "Group packages from emojibase monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/milesj/emojibase"],
             "groupName": "emojibase monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "emotion monorepo",
               "Group packages from emotion monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/emotion-js/emotion"],
             "groupName": "emotion monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "eslint-config-globex monorepo",
               "Group packages from eslint-config-globex monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/GlobexDesignsInc/eslint-config-globex"
             ],
             "groupName": "eslint-config-globex monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "expo monorepo",
               "Group packages from expo monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/expo/expo"],
             "groupName": "expo monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fabric-chaincode-node monorepo",
               "Group packages from fabric-chaincode-node monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/hyperledger/fabric-chaincode-node"
             ],
             "groupName": "fabric-chaincode-node monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fabric8-kubernetes-client monorepo",
               "Group packages from fabric8-kubernetes-client monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/fabric8io/kubernetes-client"],
             "groupName": "fabric8-kubernetes-client monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "feathers monorepo",
               "Group packages from feathers monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/feathersjs/feathers"],
             "groupName": "feathers monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "feign monorepo",
               "Group packages from feign monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/OpenFeign/feign"],
             "groupName": "feign monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fela monorepo",
               "Group packages from fela monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/robinweser/fela"],
             "groupName": "fela monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fimbullinter monorepo",
               "Group packages from fimbullinter monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/fimbullinter/wotan"],
             "groupName": "fimbullinter monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "flopflip monorepo",
               "Group packages from flopflip monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/tdeekens/flopflip"],
             "groupName": "flopflip monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "fontsource monorepo",
               "Group packages from fontsource monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/fontsource/fontsource",
               "https://github.com/fontsource/font-files"
             ],
             "groupName": "fontsource monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "formatjs monorepo",
               "Group packages from formatjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/formatjs/formatjs"],
             "groupName": "formatjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "framework7 monorepo",
               "Group packages from framework7 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/framework7io/framework7"],
             "groupName": "framework7 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "gatsby monorepo",
               "Group packages from gatsby monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/gatsbyjs/gatsby"],
             "groupName": "gatsby monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "gitbeaker monorepo",
               "Group packages from gitbeaker monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/jdalrymple/gitbeaker"],
             "groupName": "gitbeaker monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "github-workflows-kt monorepo",
               "Group packages from github-workflows-kt monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/typesafegithub/github-workflows-kt"
             ],
             "groupName": "github-workflows-kt monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "go-cloud monorepo",
               "Group packages from go-cloud monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/google/go-cloud"],
             "groupName": "go-cloud monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "google-api-dotnet-client monorepo",
               "Group packages from google-api-dotnet-client monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/googleapis/google-api-dotnet-client"
             ],
             "groupName": "google-api-dotnet-client monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "grafana monorepo",
               "Group packages from grafana monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/grafana/grafana"],
             "groupName": "grafana monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "graphql-mesh monorepo",
               "Group packages from graphql-mesh monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Urigo/graphql-mesh"],
             "groupName": "graphql-mesh monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "graphql-modules monorepo",
               "Group packages from graphql-modules monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Urigo/graphql-modules"],
             "groupName": "graphql-modules monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "graphql-tools monorepo",
               "Group packages from graphql-tools monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ardatan/graphql-tools"],
             "groupName": "graphql-tools monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "graphqlcodegenerator monorepo",
               "Group packages from graphqlcodegenerator monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/dotansimha/graphql-code-generator-community",
               "https://github.com/dotansimha/graphql-code-generator",
               "https://github.com/dotansimha/graphql-codegen"
             ],
             "groupName": "graphqlcodegenerator monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "groovy monorepo",
               "Group packages from groovy monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apache/groovy"],
             "groupName": "groovy monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "grpc-dotnet monorepo",
               "Group packages from grpc-dotnet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/grpc/grpc-dotnet"],
             "groupName": "grpc-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "grpc-java monorepo",
               "Group packages from grpc-java monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/grpc/grpc-java"],
             "groupName": "grpc-java monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "guava monorepo",
               "Group packages from guava monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/google/guava"],
             "groupName": "guava monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "Hangfire monorepo",
               "Group packages from Hangfire monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/HangfireIO/Hangfire"],
             "groupName": "Hangfire monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "hickory-dns monorepo",
               "Group packages from hickory-dns monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/hickory-dns/hickory-dns"],
             "groupName": "hickory-dns monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "infrastructure-ui monorepo",
               "Group packages from infrastructure-ui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/instructure/instructure-ui"],
             "groupName": "infrastructure-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ionic-native monorepo",
               "Group packages from ionic-native monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ionic-team/ionic-native"],
             "groupName": "ionic-native monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "istanbuljs monorepo",
               "Group packages from istanbuljs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/istanbuljs/istanbuljs"],
             "groupName": "istanbuljs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jackson monorepo",
               "Group packages from jackson monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/FasterXML/jackson",
               "https://github.com/FasterXML/jackson-dataformats-binary",
               "https://github.com/FasterXML/jackson-dataformats-text"
             ],
             "groupName": "jackson monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jasmine monorepo",
               "Group packages from jasmine monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/jasmine/jasmine"],
             "groupName": "jasmine monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "javahamcrest monorepo",
               "Group packages from javahamcrest monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/hamcrest/JavaHamcrest"],
             "groupName": "javahamcrest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "javascriptengineswitcher monorepo",
               "Group packages from javascriptengineswitcher monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/Taritsyn/JavaScriptEngineSwitcher"
             ],
             "groupName": "javascriptengineswitcher monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jersey monorepo",
               "Group packages from jersey monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/eclipse-ee4j/jersey"],
             "groupName": "jersey monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jest monorepo",
               "Group packages from jest monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/facebook/jest",
               "https://github.com/jestjs/jest"
             ],
             "groupName": "jest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jna monorepo",
               "Group packages from jna monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/java-native-access/jna"],
             "groupName": "jna monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "json-smart-v2 monorepo",
               "Group packages from json-smart-v2 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/netplex/json-smart-v2"],
             "groupName": "json-smart-v2 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "jsplumb monorepo",
               "Group packages from jsplumb monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/jsplumb/jsplumb"],
             "groupName": "jsplumb monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "junit5 monorepo",
               "Group packages from junit5 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/junit-team/junit5"],
             "groupName": "junit5 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "kotlin monorepo",
               "Group packages from kotlin monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/JetBrains/kotlin"],
             "groupName": "kotlin monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "kroki monorepo",
               "Group packages from kroki monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/yuzutech/kroki"],
             "groupName": "kroki monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lamar monorepo",
               "Group packages from lamar monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/JasperFx/lamar"],
             "groupName": "lamar monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lerna monorepo",
               "Group packages from lerna monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/lerna/lerna"],
             "groupName": "lerna monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lexical monorepo",
               "Group packages from lexical monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/facebook/lexical"],
             "groupName": "lexical monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "linguijs monorepo",
               "Group packages from linguijs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/lingui/js-lingui"],
             "groupName": "linguijs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "log4j2 monorepo",
               "Group packages from log4j2 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apache/logging-log4j2"],
             "groupName": "log4j2 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "loopback monorepo",
               "Group packages from loopback monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/strongloop/loopback-next",
               "https://github.com/loopbackio/loopback-next"
             ],
             "groupName": "loopback monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lrnwebcomponents monorepo",
               "Group packages from lrnwebcomponents monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/elmsln/lrnwebcomponents"],
             "groupName": "lrnwebcomponents monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mailing monorepo",
               "Group packages from mailing monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/sofn-xyz/mailing"],
             "groupName": "mailing monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mantine monorepo",
               "Group packages from mantine monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mantinedev/mantine"],
             "groupName": "mantine monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mapstruct monorepo",
               "Group packages from mapstruct monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mapstruct/mapstruct"],
             "groupName": "mapstruct monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "marten monorepo",
               "Group packages from marten monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/JasperFx/marten"],
             "groupName": "marten monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "masstransit monorepo",
               "Group packages from masstransit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/MassTransit/MassTransit"],
             "groupName": "masstransit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "material-components-web monorepo",
               "Group packages from material-components-web monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/material-components/material-components-web"
             ],
             "groupName": "material-components-web monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "material-ui monorepo",
               "Group packages from material-ui monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/mui-org/material-ui",
               "https://github.com/mui/material-ui",
               "https://github.com/mui/mui-x"
             ],
             "groupName": "material-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mdc-react monorepo",
               "Group packages from mdc-react monorepo together."
             ],
             "matchSourceUrls": ["material-components/material-components-web-react"],
             "groupName": "mdc-react monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mdx monorepo",
               "Group packages from mdx monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mdx-js/mdx"],
             "groupName": "mdx monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "middy-js monorepo",
               "Group packages from middy-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/middyjs/middy"],
             "groupName": "middy-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mikro-orm monorepo",
               "Group packages from mikro-orm monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mikro-orm/mikro-orm"],
             "groupName": "mikro-orm monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ml-dotnet monorepo",
               "Group packages from ml-dotnet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dotnet/machinelearning"],
             "groupName": "ml-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mockito monorepo",
               "Group packages from mockito monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mockito/mockito"],
             "groupName": "mockito monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mongo-csharp-driver monorepo",
               "Group packages from mongo-csharp-driver monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mongodb/mongo-csharp-driver"],
             "groupName": "mongo-csharp-driver monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mstest monorepo",
               "Group packages from mstest monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/microsoft/testfx"],
             "groupName": "mstest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "mutation-testing-elements monorepo",
               "Group packages from mutation-testing-elements monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/stryker-mutator/mutation-testing-elements"
             ],
             "groupName": "mutation-testing-elements monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nest monorepo",
               "Group packages from nest monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/nestjs/nest",
               "https://github.com/nestjs/passport",
               "https://github.com/nestjs/schematics",
               "https://github.com/nestjs/terminus"
             ],
             "groupName": "nest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "netty monorepo",
               "Group packages from netty monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/netty/netty"],
             "groupName": "netty monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "neutrino monorepo",
               "Group packages from neutrino monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/neutrinojs/neutrino",
               "https://github.com/mozilla-neutrino/neutrino-dev"
             ],
             "groupName": "neutrino monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nexpect monorepo",
               "Group packages from nexpect monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/fluffynuts/NExpect"],
             "groupName": "nexpect monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nextjs monorepo",
               "Group packages from nextjs monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/zeit/next.js",
               "https://github.com/vercel/next.js"
             ],
             "groupName": "nextjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nextra monorepo",
               "Group packages from nextra monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/shuding/nextra"],
             "groupName": "nextra monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ngx-formly monorepo",
               "Group packages from ngx-formly monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ngx-formly/ngx-formly"],
             "groupName": "ngx-formly monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ngxs-store monorepo",
               "Group packages from ngxs-store monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ngxs/store"],
             "groupName": "ngxs-store monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nivo monorepo",
               "Group packages from nivo monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/plouc/nivo"],
             "groupName": "nivo monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nswag monorepo",
               "Group packages from nswag monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/RicoSuter/NSwag"],
             "groupName": "nswag monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nuget monorepo",
               "Group packages from nuget monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/NuGet/NuGet.Client"],
             "groupName": "nuget monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nuxtjs monorepo",
               "Group packages from nuxtjs monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/nuxt/nuxt.js",
               "https://github.com/nuxt/nuxt"
             ],
             "groupName": "nuxtjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "okhttp monorepo",
               "Group packages from okhttp monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/square/okhttp"],
             "groupName": "okhttp monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opencost monorepo",
               "Group packages from opencost monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/opencost/opencost"],
             "groupName": "opencost monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "openiddict monorepo",
               "Group packages from openiddict monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/openiddict/openiddict-core"],
             "groupName": "openiddict monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-dotnet monorepo",
               "Group packages from opentelemetry-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-dotnet"
             ],
             "groupName": "opentelemetry-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-dotnet-contrib monorepo",
               "Group packages from opentelemetry-dotnet-contrib monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-dotnet-contrib"
             ],
             "groupName": "opentelemetry-dotnet-contrib monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-erlang monorepo",
               "Group packages from opentelemetry-erlang monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-erlang"
             ],
             "groupName": "opentelemetry-erlang monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-erlang-contrib monorepo",
               "Group packages from opentelemetry-erlang-contrib monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-erlang-contrib"
             ],
             "groupName": "opentelemetry-erlang-contrib monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-go monorepo",
               "Group packages from opentelemetry-go monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/open-telemetry/opentelemetry-go"],
             "groupName": "opentelemetry-go monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-java monorepo",
               "Group packages from opentelemetry-java monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/open-telemetry/opentelemetry-java"
             ],
             "groupName": "opentelemetry-java monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "opentelemetry-js monorepo",
               "Group packages from opentelemetry-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/open-telemetry/opentelemetry-js"],
             "groupName": "opentelemetry-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "orleans monorepo",
               "Group packages from orleans monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/dotnet/orleans"],
             "groupName": "orleans monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "panda-css monorepo",
               "Group packages from panda-css monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/chakra-ui/panda"],
             "groupName": "panda-css monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "parcel monorepo",
               "Group packages from parcel monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/parcel-bundler/parcel"],
             "groupName": "parcel monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "percy-cli monorepo",
               "Group packages from percy-cli monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/percy/cli"],
             "groupName": "percy-cli monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "picassojs monorepo",
               "Group packages from picassojs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/qlik-oss/picasso.js"],
             "groupName": "picassojs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "pixijs monorepo",
               "Group packages from pixijs monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/pixijs/pixi.js",
               "https://github.com/pixijs/pixijs"
             ],
             "groupName": "pixijs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "playwright monorepo",
               "Group packages from playwright monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/microsoft/playwright"],
             "groupName": "playwright monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "playwright-dotnet monorepo",
               "Group packages from playwright-dotnet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/microsoft/playwright-dotnet"],
             "groupName": "playwright-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "pnpjs monorepo",
               "Group packages from pnpjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/pnp/pnpjs"],
             "groupName": "pnpjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "pollyjs monorepo",
               "Group packages from pollyjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Netflix/pollyjs"],
             "groupName": "pollyjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "pouchdb monorepo",
               "Group packages from pouchdb monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/pouchdb/pouchdb"],
             "groupName": "pouchdb monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "prisma monorepo",
               "Group packages from prisma monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/prisma/prisma"],
             "groupName": "prisma monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "prometheus-net monorepo",
               "Group packages from prometheus-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/prometheus-net/prometheus-net"],
             "groupName": "prometheus-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "promster monorepo",
               "Group packages from promster monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/tdeekens/promster"],
             "groupName": "promster monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "quartznet monorepo",
               "Group packages from quartznet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/quartznet/quartznet"],
             "groupName": "quartznet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "reach-ui monorepo",
               "Group packages from reach-ui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reach/reach-ui"],
             "groupName": "reach-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react monorepo",
               "Group packages from react monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/facebook/react"],
             "groupName": "react monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-admin monorepo",
               "Group packages from react-admin monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/marmelab/react-admin"],
             "groupName": "react-admin monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-apollo monorepo",
               "Group packages from react-apollo monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apollographql/react-apollo"],
             "groupName": "react-apollo monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-dnd monorepo",
               "Group packages from react-dnd monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/react-dnd/react-dnd"],
             "groupName": "react-dnd monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-navigation monorepo",
               "Group packages from react-navigation monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/react-navigation/react-navigation"
             ],
             "groupName": "react-navigation monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-page monorepo",
               "Group packages from react-page monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/react-page/react-page"],
             "groupName": "react-page monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "react-router monorepo",
               "Group packages from react-router monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/ReactTraining/react-router",
               "https://github.com/remix-run/react-router"
             ],
             "groupName": "react-router monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "reactivestack-cookies monorepo",
               "Group packages from reactivestack-cookies monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reactivestack/cookies"],
             "groupName": "reactivestack-cookies monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "reakit monorepo",
               "Group packages from reakit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reakit/reakit"],
             "groupName": "reakit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "redwood monorepo",
               "Group packages from redwood monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/redwoodjs/redwood"],
             "groupName": "redwood monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "refit monorepo",
               "Group packages from refit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reactiveui/refit"],
             "groupName": "refit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "reg-suit monorepo",
               "Group packages from reg-suit monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/reg-viz/reg-suit"],
             "groupName": "reg-suit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "remark monorepo",
               "Group packages from remark monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/remarkjs/remark"],
             "groupName": "remark monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "remix monorepo",
               "Group packages from remix monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/remix-run/remix"],
             "groupName": "remix monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "rjsf monorepo",
               "Group packages from rjsf monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/rjsf-team/react-jsonschema-form"],
             "groupName": "rjsf monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "router5 monorepo",
               "Group packages from router5 monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/router5/router5"],
             "groupName": "router5 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "rust-futures monorepo",
               "Group packages from rust-futures monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/rust-lang/futures-rs"],
             "groupName": "rust-futures monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "rust-wasm-bindgen monorepo",
               "Group packages from rust-wasm-bindgen monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/rustwasm/wasm-bindgen"],
             "groupName": "rust-wasm-bindgen monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sanity monorepo",
               "Group packages from sanity monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/sanity-io/sanity"],
             "groupName": "sanity monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "scaffdog monorepo",
               "Group packages from scaffdog monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/scaffdog/scaffdog"],
             "groupName": "scaffdog monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "secretlint monorepo",
               "Group packages from secretlint monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/secretlint/secretlint"],
             "groupName": "secretlint monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sendgrid-nodejs monorepo",
               "Group packages from sendgrid-nodejs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/sendgrid/sendgrid-nodejs"],
             "groupName": "sendgrid-nodejs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sentry-dotnet monorepo",
               "Group packages from sentry-dotnet monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/getsentry/sentry-dotnet"],
             "groupName": "sentry-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sentry-javascript monorepo",
               "Group packages from sentry-javascript monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/getsentry/sentry-javascript"],
             "groupName": "sentry-javascript monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sentry-ruby monorepo",
               "Group packages from sentry-ruby monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/getsentry/sentry-ruby"],
             "groupName": "sentry-ruby monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sentry-rust monorepo",
               "Group packages from sentry-rust monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/getsentry/sentry-rust"],
             "groupName": "sentry-rust monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "serde monorepo",
               "Group packages from serde monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/serde-rs/serde"],
             "groupName": "serde monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "serenity-js monorepo",
               "Group packages from serenity-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/serenity-js/serenity-js"],
             "groupName": "serenity-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "shedlock monorepo",
               "Group packages from shedlock monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/lukas-krecan/ShedLock"],
             "groupName": "shedlock monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "shopify-app-bridge monorepo",
               "Group packages from shopify-app-bridge monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Shopify/app-bridge"],
             "groupName": "shopify-app-bridge monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "sitecore-jss monorepo",
               "Group packages from sitecore-jss monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Sitecore/jss"],
             "groupName": "sitecore-jss monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "skiasharp monorepo",
               "Group packages from skiasharp monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/mono/SkiaSharp"],
             "groupName": "skiasharp monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "slf4j monorepo",
               "Group packages from slf4j monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/qos-ch/slf4j"],
             "groupName": "slf4j monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "spectre-console monorepo",
               "Group packages from spectre-console monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/spectreconsole/spectre.console"],
             "groupName": "spectre-console monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "springfox monorepo",
               "Group packages from springfox monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/springfox/springfox"],
             "groupName": "springfox monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "steeltoe monorepo",
               "Group packages from steeltoe monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/SteeltoeOSS/steeltoe"],
             "groupName": "steeltoe monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "storybook monorepo",
               "Group packages from storybook monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/storybookjs/storybook"],
             "groupName": "storybook monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "storybook-react-native monorepo",
               "Group packages from storybook-react-native monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/storybookjs/react-native"],
             "groupName": "storybook-react-native monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "strapi monorepo",
               "Group packages from strapi monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/strapi/strapi"],
             "groupName": "strapi monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "stryker-js monorepo",
               "Group packages from stryker-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/stryker-mutator/stryker-js"],
             "groupName": "stryker-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "surveyjs monorepo",
               "Group packages from surveyjs monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/surveyjs/surveyjs"],
             "groupName": "surveyjs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "swashbuckle-aspnetcore monorepo",
               "Group packages from swashbuckle-aspnetcore monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/domaindrivendev/Swashbuckle.AspNetCore"
             ],
             "groupName": "swashbuckle-aspnetcore monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "system.io.abstractions monorepo",
               "Group packages from system.io.abstractions monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/System-IO-Abstractions/System.IO.Abstractions/"
             ],
             "groupName": "system.io.abstractions monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tamagui monorepo",
               "Group packages from tamagui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/tamagui/tamagui"],
             "groupName": "tamagui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tanstack-query monorepo",
               "Group packages from tanstack-query monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/TanStack/query"],
             "groupName": "tanstack-query monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tanstack-router monorepo",
               "Group packages from tanstack-router monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/TanStack/router"],
             "groupName": "tanstack-router monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tauri monorepo",
               "Group packages from tauri monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/tauri-apps/tauri"],
             "groupName": "tauri monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "telus-tds monorepo",
               "Group packages from telus-tds monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/telusdigital/tds"],
             "groupName": "telus-tds monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "telus-tds-core monorepo",
               "Group packages from telus-tds-core monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/telus/tds-core"],
             "groupName": "telus-tds-core monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "temporalio-ts monorepo",
               "Group packages from temporalio-ts monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/temporalio/sdk-typescript"],
             "groupName": "temporalio-ts monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "testcontainers-dotnet monorepo",
               "Group packages from testcontainers-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/testcontainers/testcontainers-dotnet"
             ],
             "groupName": "testcontainers-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "testcontainers-go monorepo",
               "Group packages from testcontainers-go monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/testcontainers/testcontainers-go"
             ],
             "groupName": "testcontainers-go monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "testcontainers-java monorepo",
               "Group packages from testcontainers-java monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/testcontainers/testcontainers-java"
             ],
             "groupName": "testcontainers-java monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "testcontainers-node monorepo",
               "Group packages from testcontainers-node monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/testcontainers/testcontainers-node"
             ],
             "groupName": "testcontainers-node monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "theme-ui monorepo",
               "Group packages from theme-ui monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/system-ui/theme-ui"],
             "groupName": "theme-ui monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tika monorepo",
               "Group packages from tika monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/apache/tika"],
             "groupName": "tika monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tiptap monorepo",
               "Group packages from tiptap monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/ueberdosis/tiptap"],
             "groupName": "tiptap monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "treat monorepo",
               "Group packages from treat monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/seek-oss/treat"],
             "groupName": "treat monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "trpc monorepo",
               "Group packages from trpc monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/trpc/trpc"],
             "groupName": "trpc monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "trust-dns monorepo",
               "Group packages from trust-dns monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/bluejekyll/trust-dns"],
             "groupName": "trust-dns monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "tsoa monorepo",
               "Group packages from tsoa monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/lukeautry/tsoa"],
             "groupName": "tsoa monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "turbo monorepo",
               "Group packages from turbo monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vercel/turbo"],
             "groupName": "turbo monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "typed-signalr monorepo",
               "Group packages from typed-signalr monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/nenoNaninu/TypedSignalR.Client.TypeScript"
             ],
             "groupName": "typed-signalr monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "typefaces monorepo",
               "Group packages from typefaces monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/KyleAMathews/typefaces"],
             "groupName": "typefaces monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "typescript-eslint monorepo",
               "Group packages from typescript-eslint monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/typescript-eslint/typescript-eslint"
             ],
             "groupName": "typescript-eslint monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "typography-js monorepo",
               "Group packages from typography-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/KyleAMathews/typography.js"],
             "groupName": "typography-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "unocss monorepo",
               "Group packages from unocss monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/unocss/unocss"],
             "groupName": "unocss monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "uppy monorepo",
               "Group packages from uppy monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/transloadit/uppy"],
             "groupName": "uppy monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vaadinWebComponents monorepo",
               "Group packages from vaadinWebComponents monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vaadin/web-components"],
             "groupName": "vaadinWebComponents monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "visx monorepo",
               "Group packages from visx monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/airbnb/visx"],
             "groupName": "visx monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vitest monorepo",
               "Group packages from vitest monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vitest-dev/vitest"],
             "groupName": "vitest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vstest monorepo",
               "Group packages from vstest monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/microsoft/vstest"],
             "groupName": "vstest monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vue monorepo",
               "Group packages from vue monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/vuejs/vue",
               "https://github.com/vuejs/core"
             ],
             "groupName": "vue monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vue-cli monorepo",
               "Group packages from vue-cli monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vuejs/vue-cli"],
             "groupName": "vue-cli monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "vuepress monorepo",
               "Group packages from vuepress monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/vuejs/vuepress"],
             "groupName": "vuepress monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "web3-react monorepo",
               "Group packages from web3-react monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/Uniswap/web3-react"],
             "groupName": "web3-react monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "webdriverio monorepo",
               "Group packages from webdriverio monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/webdriverio/webdriverio"],
             "groupName": "webdriverio monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "wolverine monorepo",
               "Group packages from wolverine monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/jasperfx/wolverine"],
             "groupName": "wolverine monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "workbox monorepo",
               "Group packages from workbox monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/googlechrome/workbox"],
             "groupName": "workbox monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "xstate monorepo",
               "Group packages from xstate monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/statelyai/xstate"],
             "groupName": "xstate monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "xterm monorepo",
               "Group packages from xterm monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/xtermjs/xterm.js"],
             "groupName": "xterm monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "xunit-dotnet monorepo",
               "Group packages from xunit-dotnet monorepo together."
             ],
             "matchSourceUrls": [
               "https://github.com/xunit/assert.xunit",
               "https://github.com/xunit/visualstudio.xunit",
               "https://github.com/xunit/xunit",
               "https://github.com/xunit/xunit.analyzers"
             ],
             "groupName": "xunit-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "yarn monorepo",
               "Group packages from yarn monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/yarnpkg/berry"],
             "groupName": "yarn monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "zag-js monorepo",
               "Group packages from zag-js monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/chakra-ui/zag"],
             "groupName": "zag-js monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "zxing-net monorepo",
               "Group packages from zxing-net monorepo together."
             ],
             "matchSourceUrls": ["https://github.com/micjahn/ZXing.Net"],
             "groupName": "zxing-net monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "hapijs monorepo",
               "Group packages from hapijs monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/hapijs/"],
             "groupName": "hapijs monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "lodash monorepo",
               "Group packages from lodash monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/lodash/"],
             "groupName": "lodash monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "ngrx monorepo",
               "Group packages from ngrx monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/ngrx/"],
             "groupName": "ngrx monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "nrwl monorepo",
               "Group packages from nrwl monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/nrwl/"],
             "groupName": "nrwl monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "octokit monorepo",
               "Group packages from octokit monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/octokit/"],
             "groupName": "octokit monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "semantic-release monorepo",
               "Group packages from semantic-release monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/semantic-release/"],
             "groupName": "semantic-release monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "description": [
               "swc monorepo",
               "Group packages from swc monorepo together."
             ],
             "matchSourceUrlPrefixes": ["https://github.com/swc-project/"],
             "groupName": "swc monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@angular/material", "^@angular/cdk"],
             "description": ["Group packages from angularmaterial monorepo together."],
             "groupName": "angularmaterial monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^org.apache.camel:"],
             "description": ["Group packages from apache-camel monorepo together."],
             "groupName": "apache-camel monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^com.amazonaws:aws-java-sdk-"],
             "description": ["Group packages from aws-java-sdk monorepo together."],
             "groupName": "aws-java-sdk monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^software.amazon.awssdk:"],
             "description": ["Group packages from aws-java-sdk-v2 monorepo together."],
             "groupName": "aws-java-sdk-v2 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^babel6$"],
             "description": ["Group packages from babel6 monorepo together."],
             "groupName": "babel6 monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@embroider/"],
             "description": ["Group packages from embroider monorepo together."],
             "groupName": "embroider monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@forge/"],
             "description": ["Group packages from forge monorepo together."],
             "groupName": "forge monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@fullcalendar/"],
             "description": ["Group packages from fullcalendar monorepo together."],
             "groupName": "fullcalendar monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^HotChocolate\\."],
             "description": ["Group packages from hotchocolate monorepo together."],
             "groupName": "hotchocolate monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^io.prometheus:simpleclient"],
             "description": [
               "Group packages from prometheus-simpleclient monorepo together."
             ],
             "groupName": "prometheus-simpleclient monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^russh$", "^russh-keys$"],
             "description": ["Group packages from russh monorepo together."],
             "groupName": "russh monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": [
               "^@microsoft/sp-",
               "^@microsoft/eslint-.+-spfx$"
             ],
             "description": ["Group packages from spfx monorepo together."],
             "groupName": "spfx monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^org\\.spockframework:spock-"],
             "description": ["Group packages from spock monorepo together."],
             "groupName": "spock monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^Syncfusion\\."],
             "description": [
               "Group packages from syncfusion-dotnet monorepo together."
             ],
             "groupName": "syncfusion-dotnet monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "matchPackagePatterns": ["^@wordpress/"],
             "description": ["Group packages from wordpress monorepo together."],
             "groupName": "wordpress monorepo",
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "commitMessageTopic": "Node.js",
             "excludePackageNames": [
               "calico/node",
               "docker.io/calico/node",
               "kindest/node"
             ],
             "matchDatasources": ["docker"],
             "matchDepNames": ["node"],
             "matchPackagePatterns": ["/node$"]
           },
           {
             "description": ["All packages published by Apollo GraphQL."],
             "matchSourceUrlPrefixes": ["https://github.com/apollographql/"],
             "groupName": "Apollo GraphQL packages"
           },
           {"groupName": "CodeMirror", "matchPackagePrefixes": ["@codemirror/"]},
           {"groupName": "Font Awesome", "matchPackagePrefixes": ["@fortawesome/"]},
           {
             "groupName": "GitHub Artifact Actions",
             "matchManagers": ["github-actions"],
             "matchPackageNames": [
               "actions/download-artifact",
               "actions/upload-artifact"
             ],
             "matchUpdateTypes": ["major"]
           },
           {
             "groupName": "Glimmer.js packages",
             "groupSlug": "glimmer",
             "matchPackageNames": ["@glimmer/component", "@glimmer/tracking"]
           },
           {
             "groupName": "go-openapi packages",
             "groupSlug": "go-openapi",
             "matchDatasources": ["go"],
             "matchPackagePrefixes": ["github.com/go-openapi/"]
           },
           {"groupName": "hibernate core", "matchPackagePrefixes": ["org.hibernate:"]},
           {
             "groupName": "hibernate validator",
             "matchPackagePrefixes": ["org.hibernate.validator:"]
           },
           {
             "groupName": "hibernate ogm",
             "matchPackagePrefixes": ["org.hibernate.ogm:"]
           },
           {
             "groupName": "hibernate commons",
             "matchPackagePrefixes": ["org.hibernate.common:"]
           },
           {
             "groupName": "illuminate packages",
             "groupSlug": "illuminate",
             "matchPackagePrefixes": ["illuminate/"]
           },
           {
             "groupName": "jekyll ecosystem packages",
             "matchSourceUrlPrefixes": [
               "https://github.com/jekyll/",
               "https://github.com/github/pages-gem"
             ]
           },
           {
             "groupName": "jest monorepo",
             "matchSourceUrls": ["https://github.com/kulshekhar/ts-jest"],
             "matchUpdateTypes": ["major"]
           },
           {
             "groupName": "jest monorepo",
             "matchPackageNames": ["@types/jest"],
             "matchUpdateTypes": ["digest", "patch", "minor", "major"]
           },
           {
             "groupName": "JWT Framework packages",
             "matchDatasources": ["packagist"],
             "matchPackagePrefixes": ["web-token/"]
           },
           {
             "groupName": "kubernetes packages",
             "groupSlug": "kubernetes-go",
             "matchDatasources": ["go"],
             "matchPackagePrefixes": [
               "k8s.io/api",
               "k8s.io/apiextensions-apiserver",
               "k8s.io/apimachinery",
               "k8s.io/apiserver",
               "k8s.io/cli-runtime",
               "k8s.io/client-go",
               "k8s.io/cloud-provider",
               "k8s.io/cluster-bootstrap",
               "k8s.io/code-generator",
               "k8s.io/component-base",
               "k8s.io/controller-manager",
               "k8s.io/cri-api",
               "k8s.io/csi-translation-lib",
               "k8s.io/kube-aggregator",
               "k8s.io/kube-controller-manager",
               "k8s.io/kube-proxy",
               "k8s.io/kube-scheduler",
               "k8s.io/kubectl",
               "k8s.io/kubelet",
               "k8s.io/legacy-cloud-providers",
               "k8s.io/metrics",
               "k8s.io/mount-utils",
               "k8s.io/pod-security-admission",
               "k8s.io/sample-apiserver",
               "k8s.io/sample-cli-plugin",
               "k8s.io/sample-controller"
             ]
           },
           {
             "groupName": "PHPStan packages",
             "matchDatasources": ["packagist"],
             "matchPackagePatterns": ["^phpstan/phpstan$", "/phpstan-", "/larastan"]
           },
           {"groupName": "polymer packages", "matchPackagePrefixes": ["@polymer/"]},
           {
             "groupName": "react monorepo",
             "matchPackageNames": ["@types/react", "@types/react-dom"]
           },
           {
             "groupName": "remark",
             "matchDatasources": ["npm"],
             "matchSourceUrlPrefixes": ["https://github.com/remarkjs/"]
           },
           {
             "groupName": "resilience4j",
             "matchPackagePrefixes": ["io.github.resilience4j:"]
           },
           {
             "groupName": "Ruby on Rails packages",
             "matchDatasources": ["rubygems"],
             "matchPackageNames": [
               "actioncable",
               "actionmailbox",
               "actionmailer",
               "actionpack",
               "actiontext",
               "actionview",
               "activejob",
               "activemodel",
               "activerecord",
               "activestorage",
               "activesupport",
               "railties",
               "rails"
             ]
           },
           {
             "groupName": "omniauth packages",
             "matchDatasources": ["rubygems"],
             "matchPackagePrefixes": ["omniauth"]
           },
           {"groupName": "socket.io packages", "matchPackagePrefixes": ["socket.io"]},
           {
             "groupName": "spring amqp",
             "matchPackagePrefixes": ["org.springframework.amqp:"]
           },
           {
             "groupName": "spring android",
             "matchPackagePrefixes": ["org.springframework.android:"]
           },
           {
             "groupName": "spring batch",
             "matchPackagePrefixes": ["org.springframework.batch:"]
           },
           {
             "groupName": "spring boot",
             "matchDepNames": ["org.springframework.boot"],
             "matchPackagePrefixes": ["org.springframework.boot:"]
           },
           {
             "groupName": "spring cloud",
             "matchPackagePrefixes": ["org.springframework.cloud:"]
           },
           {
             "groupName": "spring core",
             "matchPackagePrefixes": ["org.springframework:"]
           },
           {
             "groupName": "spring data",
             "matchPackagePrefixes": ["org.springframework.data:"]
           },
           {
             "groupName": "spring hateoas",
             "matchPackagePrefixes": ["org.springframework.hateoas:"]
           },
           {
             "groupName": "spring integration",
             "matchPackagePrefixes": ["org.springframework.integration:"]
           },
           {
             "groupName": "spring kafka",
             "matchPackagePrefixes": ["org.springframework.kafka:"]
           },
           {
             "groupName": "spring ldap",
             "matchPackagePrefixes": ["org.springframework.ldap:"]
           },
           {
             "groupName": "spring mobile",
             "matchPackagePrefixes": ["org.springframework.mobile:"]
           },
           {
             "groupName": "spring osgi",
             "matchPackagePrefixes": ["org.springframework.osgi:"]
           },
           {
             "groupName": "spring restdocs",
             "matchPackagePrefixes": ["org.springframework.restdocs:"]
           },
           {
             "groupName": "spring roo",
             "matchPackagePrefixes": ["org.springframework.roo:"]
           },
           {
             "groupName": "spring scala",
             "matchPackagePrefixes": ["org.springframework.scala:"]
           },
           {
             "groupName": "spring security",
             "matchPackagePrefixes": ["org.springframework.security:"]
           },
           {
             "groupName": "spring session",
             "matchPackagePrefixes": ["org.springframework.session:"]
           },
           {
             "groupName": "spring shell",
             "matchPackagePrefixes": ["org.springframework.shell:"]
           },
           {
             "groupName": "spring social",
             "matchPackagePrefixes": ["org.springframework.social:"]
           },
           {
             "groupName": "spring statemachine",
             "matchPackagePrefixes": ["org.springframework.statemachine:"]
           },
           {
             "groupName": "spring webflow",
             "matchPackagePrefixes": ["org.springframework.webflow:"]
           },
           {
             "groupName": "spring ws",
             "matchPackagePrefixes": ["org.springframework.ws:"]
           },
           {
             "groupName": "symfony packages",
             "groupSlug": "symfony",
             "matchPackagePrefixes": ["symfony/"]
           },
           {
             "matchCurrentVersion": ">=3.10.3",
             "matchDatasources": ["npm"],
             "matchPackageNames": [
               "apollo-server",
               "apollo-server-core",
               "apollo-server-express"
             ],
             "replacementName": "@apollo/server",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.3.1",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-server-errors"],
             "replacementName": "@apollo/server",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.6.3",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-server-types", "apollo-server-plugin-base"],
             "replacementName": "@apollo/server",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.7.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-datasource-rest"],
             "replacementName": "@apollo/datasource-rest",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.7.1",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-server-plugin-response-cache"],
             "replacementName": "@apollo/server-plugin-response-cache",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.5.1",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-server-plugin-operation-registry"],
             "replacementName": "@apollo/server-plugin-operation-registry",
             "replacementVersion": "3.5.6"
           },
           {
             "matchCurrentVersion": ">=3.3.3",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["apollo-reporting-protobuf"],
             "replacementName": "@apollo/usage-reporting-protobuf",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=7.11.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["babel-eslint"],
             "replacementName": "@babel/eslint-parser",
             "replacementVersion": "7.11.0"
           },
           {
             "description": [
               "Replace `containerbase/(buildpack|base)` and `renovate/buildpack` with `ghcr.io/containerbase/base`."
             ],
             "matchDatasources": ["docker"],
             "matchPackagePatterns": [
               "^(?:docker\\.io/)?containerbase/(?:buildpack|base)$",
               "^ghcr\\.io/containerbase/buildpack$",
               "^(?:docker\\.io/)?renovate/buildpack$"
             ],
             "replacementName": "ghcr.io/containerbase/base"
           },
           {
             "description": [
               "Replace `containerbase/node` and `renovate/node` with `ghcr.io/containerbase/node`."
             ],
             "matchDatasources": ["docker"],
             "matchPackagePatterns": [
               "^(?:docker\\.io/)?(?:containerbase|renovate)/node$"
             ],
             "replacementName": "ghcr.io/containerbase/node"
           },
           {
             "description": [
               "Replace `containerbase/sidecar` and `renovate/sidecar` with `ghcr.io/containerbase/sidecar`."
             ],
             "matchDatasources": ["docker"],
             "matchPackagePatterns": [
               "^(?:docker\\.io/)?(?:containerbase|renovate)/sidecar$"
             ],
             "replacementName": "ghcr.io/containerbase/sidecar"
           },
           {
             "description": [
               "Replace `renovatebot/internal-tools` with `containerbase/internal-tools`."
             ],
             "matchDatasources": ["github-tags"],
             "matchPackageNames": ["renovatebot/internal-tools"],
             "replacementName": "containerbase/internal-tools"
           },
           {
             "description": ["Replace `renovate` `slim` docker tag with `latest`."],
             "matchCurrentValue": "/^slim$/",
             "matchDatasources": ["docker"],
             "matchPackageNames": ["ghcr.io/renovatebot/renovate"],
             "matchPackagePatterns": ["^(?:docker\\.io/)?renovate/renovate$"],
             "replacementVersion": "latest"
           },
           {
             "description": ["Remove `renovate` `-slim` docker tag suffix."],
             "extractVersion": "^(?<version>.+)-slim$",
             "matchCurrentValue": "/-slim$/",
             "matchDatasources": ["docker"],
             "matchPackageNames": ["ghcr.io/renovatebot/renovate"],
             "matchPackagePatterns": ["^(?:docker\\.io/)?renovate/renovate$"],
             "versioning": "semver"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["cpx"],
             "replacementName": "cpx2",
             "replacementVersion": "2.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["cucumber"],
             "replacementName": "@cucumber/cucumber",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": "^11.1.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["eslint-plugin-node"],
             "replacementName": "eslint-plugin-n",
             "replacementVersion": "14.0.0"
           },
           {
             "matchCurrentVersion": ">=5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "5.5.3"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "4.1.0"
           },
           {
             "matchCurrentVersion": ">=3.0.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "3.1.0"
           },
           {
             "matchCurrentVersion": ">=2.0.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "2.1.5"
           },
           {
             "matchCurrentVersion": "<2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["faker"],
             "replacementName": "@faker-js/faker",
             "replacementVersion": "1.1.0"
           },
           {
             "matchCurrentVersion": ">=3.3.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-accepts-serializer"],
             "replacementName": "@fastify/accepts-serializer",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=2.3.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-accepts"],
             "replacementName": "@fastify/accepts",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=1.2.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-auth"],
             "replacementName": "@fastify/auth",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=3.13.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-autoload"],
             "replacementName": "@fastify/autoload",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=1.3.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-awilix"],
             "replacementName": "@fastify/awilix",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=2.3.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-basic-auth"],
             "replacementName": "@fastify/basic-auth",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=6.3.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-bearer-auth"],
             "replacementName": "@fastify/bearer-auth",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=6.3.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-caching"],
             "replacementName": "@fastify/caching",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=1.2.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-circuit-breaker"],
             "replacementName": "@fastify/circuit-breaker",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=4.1.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-compress"],
             "replacementName": "@fastify/compress",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=5.7.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-cookie"],
             "replacementName": "@fastify/cookie",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=6.1.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-cors"],
             "replacementName": "@fastify/cors",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=1.1.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-diagnostics-channel"],
             "replacementName": "@fastify/diagnostics-channel",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=1.2.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-elasticsearch"],
             "replacementName": "@fastify/elasticsearch",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=2.2.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-env"],
             "replacementName": "@fastify/env",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=1.2.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-error"],
             "replacementName": "@fastify/error",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=2.2.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-etag"],
             "replacementName": "@fastify/etag",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=0.4.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-express"],
             "replacementName": "@fastify/express",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=3.1.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-flash"],
             "replacementName": "@fastify/flash",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=5.3.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-formbody"],
             "replacementName": "@fastify/formbody",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=1.1.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-funky"],
             "replacementName": "@fastify/funky",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=7.1.0 <8.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-helmet"],
             "replacementName": "@fastify/helmet",
             "replacementVersion": "8.0.0"
           },
           {
             "matchCurrentVersion": ">=0.3.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-hotwire"],
             "replacementName": "@fastify/hotwire",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=6.3.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-http-proxy"],
             "replacementName": "@fastify/http-proxy",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=4.2.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-jwt"],
             "replacementName": "@fastify/jwt",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=0.3.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-kafka"],
             "replacementName": "@fastify/kafka",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=3.2.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-leveldb"],
             "replacementName": "@fastify/leveldb",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=4.2.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-mongodb"],
             "replacementName": "@fastify/mongodb",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=5.4.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-multipart"],
             "replacementName": "@fastify/multipart",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=2.2.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-mysql"],
             "replacementName": "@fastify/mysql",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=7.3.0 <8.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-nextjs"],
             "replacementName": "@fastify/nextjs",
             "replacementVersion": "8.0.0"
           },
           {
             "matchCurrentVersion": ">=4.6.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-oauth2"],
             "replacementName": "@fastify/oauth2",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=0.5.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-passport"],
             "replacementName": "@fastify/passport",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=3.7.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-postgres"],
             "replacementName": "@fastify/postgres",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=5.9.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-rate-limit"],
             "replacementName": "@fastify/rate-limit",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=4.4.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-redis"],
             "replacementName": "@fastify/redis",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=6.7.0 <7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-reply-from"],
             "replacementName": "@fastify/reply-from",
             "replacementVersion": "7.0.0"
           },
           {
             "matchCurrentVersion": ">=2.3.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-request-context"],
             "replacementName": "@fastify/request-context",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=0.3.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-response-validation"],
             "replacementName": "@fastify/response-validation",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=2.1.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-routes-stats"],
             "replacementName": "@fastify/routes-stats",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=3.2.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-routes"],
             "replacementName": "@fastify/routes",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=1.1.0 <2.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-schedule"],
             "replacementName": "@fastify/schedule",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=3.2.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-secure-session"],
             "replacementName": "@fastify/secure-session",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.2.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-sensible"],
             "replacementName": "@fastify/sensible",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=0.3.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-soap-client"],
             "replacementName": "@fastify/soap-client",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=4.7.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-static"],
             "replacementName": "@fastify/static",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=5.2.0 <6.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-swagger"],
             "replacementName": "@fastify/swagger",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=3.1.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-url-data"],
             "replacementName": "@fastify/url-data",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=4.3.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-websocket"],
             "replacementName": "@fastify/websocket",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=2.1.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["fastify-zipkin"],
             "replacementName": "@fastify/zipkin",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=18.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["hapi"],
             "replacementName": "@hapi/hapi",
             "replacementVersion": "18.2.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["jade"],
             "replacementName": "pug",
             "replacementVersion": "2.0.0"
           },
           {
             "matchCurrentVersion": ">=14.0.0 <14.4.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["joi"],
             "replacementName": "@hapi/joi",
             "replacementVersion": "14.4.0"
           },
           {
             "matchCurrentVersion": ">=17.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@hapi/joi"],
             "replacementName": "joi",
             "replacementVersion": "17.1.1"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackagePatterns": ["^k8s\\.gcr\\.io/.+$"],
             "replacementNameTemplate": "{{{replace 'k8s\\.gcr\\.io/' 'registry.k8s.io/' packageName}}}"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/codemod"],
             "replacementName": "@mui/codemod",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/core"],
             "replacementName": "@mui/material",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/icons"],
             "replacementName": "@mui/icons-material",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/lab"],
             "replacementName": "@mui/labs",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/private-theming"],
             "replacementName": "@mui/private-theming",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/styled-engine"],
             "replacementName": "@mui/styled-engine",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/styled-engine-sc"],
             "replacementName": "@mui/styled-engine-sc",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/styles"],
             "replacementName": "@mui/styles",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/system"],
             "replacementName": "@mui/system",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/types"],
             "replacementName": "@mui/types",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@material-ui/unstyled"],
             "replacementName": "@mui/core",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": "^10.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["mem"],
             "replacementName": "memoize",
             "replacementVersion": "10.0.0"
           },
           {
             "matchCurrentVersion": ">=2.0.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["messageformat-cli"],
             "replacementName": "@messageformat/cli",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=2.0.0 <3.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["messageformat"],
             "replacementName": "@messageformat/core",
             "replacementVersion": "3.0.0"
           },
           {
             "matchCurrentVersion": ">=0.4.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["messageformat-convert"],
             "replacementName": "@messageformat/convert",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=0.4.0 <1.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["react-message-context"],
             "replacementName": "@messageformat/react",
             "replacementVersion": "1.0.0"
           },
           {
             "matchCurrentVersion": ">=4.0.0 <5.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["messageformat-parser"],
             "replacementName": "@messageformat/parser",
             "replacementVersion": "5.0.0"
           },
           {
             "matchCurrentVersion": ">=7.1.0 <8.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["middie"],
             "replacementName": "@fastify/middie",
             "replacementVersion": "8.0.0"
           },
           {
             "matchCurrentVersion": ">=21.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["now"],
             "replacementName": "vercel",
             "replacementVersion": "21.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["npm-run-all"],
             "replacementName": "npm-run-all2",
             "replacementVersion": "5.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@parcel/css"],
             "replacementName": "lightningcss",
             "replacementVersion": "1.14.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["passport-saml"],
             "replacementName": "@node-saml/passport-saml",
             "replacementVersion": "4.0.4"
           },
           {
             "matchCurrentVersion": ">=2.0.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["react-query/devtools"],
             "replacementName": "@tanstack/react-query-devtools",
             "replacementVersion": "4.0.0"
           },
           {
             "matchCurrentVersion": ">=3.0.0 <4.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["react-query"],
             "replacementName": "@tanstack/react-query",
             "replacementVersion": "4.0.5"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["react-scripts-ts"],
             "replacementName": "react-scripts",
             "replacementVersion": "2.1.8"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["read-pkg-up"],
             "replacementName": "read-package-up",
             "replacementVersion": "11.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["redux-devtools-extension"],
             "replacementName": "@redux-devtools/extension",
             "replacementVersion": "3.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@renovate/pep440"],
             "replacementName": "@renovatebot/pep440",
             "replacementVersion": "1.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rollup-plugin-babel"],
             "replacementName": "@rollup/plugin-babel",
             "replacementVersion": "5.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rollup-plugin-json"],
             "replacementName": "@rollup/plugin-json",
             "replacementVersion": "4.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rollup-plugin-node-resolve"],
             "replacementName": "@rollup/plugin-node-resolve",
             "replacementVersion": "6.0.0"
           },
           {
             "matchCurrentVersion": ">=7.0.0",
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rollup-plugin-terser"],
             "replacementName": "@rollup/plugin-terser",
             "replacementVersion": "0.1.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["rome"],
             "replacementName": "@biomejs/biome",
             "replacementVersion": "1.0.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["@google/semantic-release-replace-plugin"],
             "replacementName": "semantic-release-replace-plugin",
             "replacementVersion": "1.2.1"
           },
           {
             "matchDatasources": ["nuget"],
             "matchPackageNames": ["Spectre.Cli"],
             "replacementName": "Spectre.Console.Cli",
             "replacementVersion": "0.45.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["vso-task-lib"],
             "replacementName": "azure-pipelines-task-lib",
             "replacementVersion": "3.4.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["vsts-task-lib"],
             "replacementName": "azure-pipelines-task-lib",
             "replacementVersion": "3.4.0"
           },
           {
             "matchDatasources": ["npm"],
             "matchPackageNames": ["xmldom", "xmldom-alpha"],
             "replacementName": "@xmldom/xmldom",
             "replacementVersion": "0.7.5"
           },
           {
             "allowedVersions": "!/^200\\d{5}(\\.\\d+)?/",
             "matchDatasources": ["maven", "sbt-package"],
             "matchPackagePrefixes": ["commons-"]
           },
           {
             "allowedVersions": "/^[A-Z]/",
             "matchDatasources": ["maven"],
             "matchPackageNames": [
               "org.springframework.cloud:spring-cloud-starter-parent"
             ]
           },
           {
             "allowedVersions": "!/^5\\.0\\.0/",
             "matchDatasources": ["maven"],
             "matchPackageNames": ["org.web3j:core"]
           },
           {
             "allowedVersions": "!/^1\\.0-\\d+-[a-fA-F0-9]{7}$/",
             "matchManagers": ["sbt"],
             "matchPackagePrefixes": ["org.http4s:"]
           },
           {
             "matchManagers": ["npm"],
             "matchPackageNames": ["@types/node"],
             "versioning": "node"
           },
           {
             "matchDatasources": ["docker"],
             "matchDepNames": ["node"],
             "versionCompatibility": "^(?<version>[^-]+)(?<compatibility>-.*)?$",
             "versioning": "node"
           },
           {
             "allowedVersions": "<20000000",
             "matchCurrentVersion": "!/^\\d{8}$/",
             "matchDatasources": ["docker"],
             "matchPackageNames": ["alpine"]
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": [
               "registry.access.redhat.com/rhel",
               "registry.access.redhat.com/rhel-atomic",
               "registry.access.redhat.com/rhel-init",
               "registry.access.redhat.com/rhel-minimal"
             ],
             "matchPackagePrefixes": [
               "registry.access.redhat.com/rhceph/",
               "registry.access.redhat.com/rhgs3/",
               "registry.access.redhat.com/rhel7",
               "registry.access.redhat.com/rhel8/",
               "registry.access.redhat.com/rhel9/",
               "registry.access.redhat.com/rhscl/",
               "registry.access.redhat.com/ubi7",
               "registry.access.redhat.com/ubi8",
               "registry.access.redhat.com/ubi9",
               "redhat/"
             ],
             "versioning": "redhat"
           },
           {
             "allowedVersions": "/^(?:8|11|17|21)(?:\\.|-|$)/",
             "description": [
               "Limit Java runtime versions to LTS releases. To receive all major releases add `workarounds:javaLTSVersions` to the `ignorePresets` array."
             ],
             "matchDatasources": ["docker", "java-version"],
             "matchPackageNames": [
               "eclipse-temurin",
               "amazoncorretto",
               "adoptopenjdk",
               "openjdk",
               "java",
               "java-jre",
               "sapmachine"
             ],
             "matchPackagePatterns": [
               "^azul/zulu-openjdk",
               "^bellsoft/liberica-openj(dk|re)-",
               "^cimg/openjdk"
             ],
             "versioning": "regex:^(?<major>\\d+)?(\\.(?<minor>\\d+))?(\\.(?<patch>\\d+))?([\\._+](?<build>\\d+))?(-(?<compatibility>.*))?$"
           },
           {
             "enabled": false,
             "matchDatasources": ["maven"],
             "matchPackageNames": ["org.eclipse.m2e:lifecycle-mapping"]
           },
           {
             "enabled": false,
             "matchDepTypes": ["parent-root"],
             "matchManagers": ["maven"]
           },
           {
             "description": [
               "Use node versioning for `(containerbase|renovate)/node` images"
             ],
             "matchDatasources": ["docker"],
             "matchPackagePatterns": [
               "^(?:(?:docker|ghcr)\\.io/)?(?:containerbase|renovate)/node$"
             ],
             "versioning": "node"
           },
           {"matchDatasources": ["docker"], "pinDigests": true},
           {"matchDepTypes": ["action"], "pinDigests": true},
           {"matchDepTypes": ["devDependencies"], "rangeStrategy": "pin"},
           {
             "matchDatasources": ["docker"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["ghcr.io/esphome/esphome"],
             "enabled": false
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": [
               "spx01/blocky",
               "saspus/duplicacy-web",
               "b4bz/homer"
             ],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           },
           {
             "matchDatasources": ["docker"],
             "matchPackageNames": ["nodered/node-red"],
             "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)-18-minimal$"
           },
           {
             "matchDatasources": ["github-releases"],
             "matchDepNames": ["tjhorner/upsy-desky"],
             "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
           }
         ],
         "autoReplaceGlobalMatch": true,
         "pinDigests": false,
         "separateMajorMinor": true,
         "separateMultipleMajor": false,
         "separateMultipleMinor": false,
         "separateMinorPatch": false,
         "ignoreUnstable": true,
         "ignoreDeprecated": true,
         "followTag": null,
         "respectLatest": true,
         "rangeStrategy": "auto",
         "branchPrefix": "renovate/",
         "branchPrefixOld": "renovate/",
         "bumpVersion": null,
         "major": {},
         "minor": {},
         "patch": {},
         "pin": {
           "rebaseWhen": "behind-base-branch",
           "groupName": "Pin Dependencies",
           "groupSlug": "pin-dependencies",
           "commitMessageAction": "Pin",
           "group": {"commitMessageTopic": "dependencies", "commitMessageExtra": ""}
         },
         "digest": {
           "branchTopic": "{{{depNameSanitized}}}-digest",
           "commitMessageExtra": "to {{newDigestShort}}",
           "commitMessageTopic": "{{{depName}}} digest"
         },
         "pinDigest": {
           "groupName": "Pin Dependencies",
           "groupSlug": "pin-dependencies",
           "commitMessageAction": "Pin",
           "group": {"commitMessageTopic": "dependencies", "commitMessageExtra": ""}
         },
         "rollback": {
           "branchTopic": "{{{depNameSanitized}}}-rollback",
           "commitMessageAction": "Roll back",
           "semanticCommitType": "fix"
         },
         "replacement": {
           "branchTopic": "{{{depNameSanitized}}}-replacement",
           "commitMessageAction": "Replace",
           "commitMessageExtra": "with {{newName}} {{#if isMajor}}{{{prettyNewMajor}}}{{else}}{{#if isSingleVersion}}{{{prettyNewVersion}}}{{else}}{{{newValue}}}{{/if}}{{/if}}",
           "prBodyNotes": [
             "This is a special PR that replaces `{{{depName}}}` with the community suggested minimal stable replacement version."
           ]
         },
         "semanticCommits": "auto",
         "semanticCommitType": "chore",
         "semanticCommitScope": "deps",
         "commitMessageLowerCase": "auto",
         "keepUpdatedLabel": null,
         "rollbackPrs": false,
         "recreateWhen": "auto",
         "rebaseWhen": "auto",
         "rebaseLabel": "rebase",
         "stopUpdatingLabel": "stop-updating",
         "minimumReleaseAge": null,
         "internalChecksAsSuccess": false,
         "internalChecksFilter": "strict",
         "prCreation": "immediate",
         "prNotPendingHours": 25,
         "prHourlyLimit": 2,
         "prConcurrentLimit": 10,
         "branchConcurrentLimit": null,
         "prPriority": 0,
         "bbUseDefaultReviewers": true,
         "bbUseDevelopmentBranch": false,
         "automerge": false,
         "automergeType": "pr",
         "automergeStrategy": "auto",
         "automergeComment": "automergeComment",
         "ignoreTests": false,
         "transitiveRemediation": false,
         "vulnerabilityAlerts": {
           "groupName": null,
           "schedule": [],
           "dependencyDashboardApproval": false,
           "minimumReleaseAge": null,
           "rangeStrategy": "update-lockfile",
           "commitMessageSuffix": "[SECURITY]",
           "branchTopic": "{{{datasource}}}-{{{depName}}}-vulnerability",
           "prCreation": "immediate"
         },
         "osvVulnerabilityAlerts": false,
         "pruneBranchAfterAutomerge": true,
         "branchName": "{{{branchPrefix}}}{{{additionalBranchPrefix}}}{{{branchTopic}}}",
         "additionalBranchPrefix": "",
         "branchTopic": "{{{depNameSanitized}}}-{{{newMajor}}}{{#if separateMinorPatch}}{{#if isPatch}}.{{{newMinor}}}{{/if}}{{/if}}.x{{#if isLockfileUpdate}}-lockfile{{/if}}",
         "commitMessage": "{{{commitMessagePrefix}}} {{{commitMessageAction}}} {{{commitMessageTopic}}} {{{commitMessageExtra}}} {{{commitMessageSuffix}}}",
         "commitBody": null,
         "commitBodyTable": false,
         "commitMessagePrefix": null,
         "commitMessageAction": "Update",
         "commitMessageTopic": "dependency {{depName}}",
         "commitMessageExtra": "to {{#if isPinDigest}}{{{newDigestShort}}}{{else}}{{#if isMajor}}{{prettyNewMajor}}{{else}}{{#if isSingleVersion}}{{prettyNewVersion}}{{else}}{{#if newValue}}{{{newValue}}}{{else}}{{{newDigestShort}}}{{/if}}{{/if}}{{/if}}{{/if}}",
         "commitMessageSuffix": null,
         "prBodyTemplate": "{{{header}}}{{{table}}}{{{warnings}}}{{{notes}}}{{{changelogs}}}{{{configDescription}}}{{{controls}}}{{{footer}}}",
         "prTitle": null,
         "prTitleStrict": false,
         "prHeader": null,
         "prFooter": "This PR has been generated by [Renovate Bot](https://github.com/renovatebot/renovate).",
         "customizeDashboard": {},
         "lockFileMaintenance": {
           "enabled": false,
           "recreateWhen": "always",
           "rebaseStalePrs": true,
           "branchTopic": "lock-file-maintenance",
           "commitMessageAction": "Lock file maintenance",
           "commitMessageTopic": null,
           "commitMessageExtra": null,
           "schedule": ["before 4am on monday"],
           "groupName": null,
           "prBodyDefinitions": {"Change": "All locks refreshed"}
         },
         "hashedBranchLength": null,
         "groupName": null,
         "groupSlug": null,
         "group": {
           "branchTopic": "{{{groupSlug}}}",
           "commitMessageTopic": "{{{groupName}}}"
         },
         "labels": ["dependencies", "bot"],
         "addLabels": [],
         "assignees": [],
         "assigneesFromCodeOwners": false,
         "expandCodeOwnersGroups": false,
         "assigneesSampleSize": null,
         "assignAutomerge": false,
         "ignoreReviewers": [],
         "reviewers": [],
         "reviewersFromCodeOwners": false,
         "filterUnavailableUsers": false,
         "forkModeDisallowMaintainerEdits": false,
         "confidential": false,
         "reviewersSampleSize": null,
         "additionalReviewers": [],
         "fileMatch": [],
         "postUpdateOptions": [],
         "constraints": {},
         "hostRules": [],
         "prBodyDefinitions": {
           "Package": "{{{depNameLinked}}}",
           "Type": "{{{depType}}}",
           "Update": "{{{updateType}}}",
           "Current value": "{{{currentValue}}}",
           "New value": "{{{newValue}}}",
           "Change": "`{{{displayFrom}}}` -> `{{{displayTo}}}`",
           "Pending": "{{{displayPending}}}",
           "References": "{{{references}}}",
           "Package file": "{{{packageFile}}}",
           "Age": "{{#if newVersion}}[![age](https://developer.mend.io/api/mc/badges/age/{{datasource}}/{{replace '/' '%2f' depName}}/{{{newVersion}}}?slim=true)](https://docs.renovatebot.com/merge-confidence/){{/if}}",
           "Adoption": "{{#if newVersion}}[![adoption](https://developer.mend.io/api/mc/badges/adoption/{{datasource}}/{{replace '/' '%2f' depName}}/{{{newVersion}}}?slim=true)](https://docs.renovatebot.com/merge-confidence/){{/if}}",
           "Passing": "{{#if newVersion}}[![passing](https://developer.mend.io/api/mc/badges/compatibility/{{datasource}}/{{replace '/' '%2f' depName}}/{{{currentVersion}}}/{{{newVersion}}}?slim=true)](https://docs.renovatebot.com/merge-confidence/){{/if}}",
           "Confidence": "{{#if newVersion}}[![confidence](https://developer.mend.io/api/mc/badges/confidence/{{datasource}}/{{replace '/' '%2f' depName}}/{{{currentVersion}}}/{{{newVersion}}}?slim=true)](https://docs.renovatebot.com/merge-confidence/){{/if}}"
         },
         "prBodyColumns": ["Package", "Type", "Update", "Change", "Pending"],
         "prBodyNotes": [],
         "suppressNotifications": ["deprecationWarningIssues"],
         "pruneStaleBranches": true,
         "unicodeEmoji": true,
         "gitLabIgnoreApprovals": false,
         "customManagers": [
           {
             "customType": "regex",
             "fileMatch": ["^README\\.md$"],
             "matchStrings": [
               "[^_]github.com\\/(?<packageName>.*) \\| (?<currentValue>v?\\d+\\.\\d+\\.\\d+) \\|"
             ],
             "depNameTemplate": "{{packageName}}-{{newVersion}}",
             "datasourceTemplate": "github-releases"
           },
           {
             "customType": "regex",
             "fileMatch": ["^README\\.md$"],
             "matchStrings": [
               "[^_]github.com\\/(?<packageName>.*) \\| (?<currentValue>v?\\d+\\.\\d+\\.\\d+) \\|"
             ],
             "depNameTemplate": "{{packageName}}-{{newVersion}}",
             "datasourceTemplate": "github-releases"
           }
         ],
         "fetchChangeLogs": "pr",
         "cloneSubmodules": false,
         "ignorePrAuthor": false,
         "updatePinnedDependencies": true,
         "gitUrl": "default",
         "writeDiscoveredRepos": null,
         "platformAutomerge": true,
         "userStrings": {
           "ignoreTopic": "Renovate Ignore Notification",
           "ignoreMajor": "Because you closed this PR without merging, Renovate will ignore this update. You will not get PRs for *any* future `{{{newMajor}}}.x` releases. But if you manually upgrade to `{{{newMajor}}}.x` then Renovate will re-enable `minor` and `patch` updates automatically.",
           "ignoreDigest": "Because you closed this PR without merging, Renovate will ignore this update. You will not get PRs for the `{{{depName}}}` `{{{newDigestShort}}}` update again.",
           "ignoreOther": "Because you closed this PR without merging, Renovate will ignore this update (`{{{newValue}}}`). You will get a PR once a newer version is released. To ignore this dependency forever, add it to the `ignoreDeps` array of your Renovate config."
         },
         "platformCommit": false,
         "branchNameStrict": false,
         "checkedBranches": [],
         "logLevelRemap": [],
         "milestone": null,
         "ansible": {"fileMatch": ["(^|/)tasks/[^/]+\\.ya?ml$"]},
         "ansible-galaxy": {
           "fileMatch": ["(^|/)(galaxy|requirements)(\\.ansible)?\\.ya?ml$"]
         },
         "argocd": {"fileMatch": []},
         "asdf": {"fileMatch": ["(^|/)\\.tool-versions$"]},
         "azure-pipelines": {
           "fileMatch": ["azure.*pipelines?.*\\.ya?ml$"],
           "enabled": false
         },
         "batect": {"fileMatch": ["(^|/)batect(-bundle)?\\.ya?ml$"]},
         "batect-wrapper": {"fileMatch": ["(^|/)batect$"], "versioning": "semver"},
         "bazel": {"fileMatch": ["(^|/)WORKSPACE(|\\.bazel)$", "\\.bzl$"]},
         "bazel-module": {"fileMatch": ["(^|/)MODULE\\.bazel$"]},
         "bazelisk": {
           "fileMatch": ["(^|/)\\.bazelversion$"],
           "pinDigests": false,
           "versioning": "semver"
         },
         "bicep": {"fileMatch": ["\\.bicep$"]},
         "bitbucket-pipelines": {
           "fileMatch": ["(^|/)\\.?bitbucket-pipelines\\.ya?ml$"]
         },
         "buildkite": {
           "fileMatch": ["buildkite\\.ya?ml", "\\.buildkite/.+\\.ya?ml$"],
           "commitMessageTopic": "buildkite plugin {{depName}}",
           "commitMessageExtra": "to {{#if isMajor}}{{{prettyNewMajor}}}{{else}}{{{newValue}}}{{/if}}"
         },
         "bun": {
           "fileMatch": ["(^|/)bun\\.lockb$"],
           "digest": {
             "prBodyDefinitions": {
               "Change": "{{#if displayFrom}}`{{{displayFrom}}}` -> {{else}}{{#if currentValue}}`{{{currentValue}}}` -> {{/if}}{{/if}}{{#if displayTo}}`{{{displayTo}}}`{{else}}`{{{newValue}}}`{{/if}}"
             }
           },
           "prBodyDefinitions": {
             "Change": "[{{#if displayFrom}}`{{{displayFrom}}}` -> {{else}}{{#if currentValue}}`{{{currentValue}}}` -> {{/if}}{{/if}}{{#if displayTo}}`{{{displayTo}}}`{{else}}`{{{newValue}}}`{{/if}}]({{#if depName}}https://renovatebot.com/diffs/npm/{{replace '/' '%2f' depName}}/{{{currentVersion}}}/{{{newVersion}}}{{/if}})"
           }
         },
         "bundler": {"fileMatch": ["(^|/)Gemfile$"], "versioning": "ruby"},
         "cake": {"fileMatch": ["\\.cake$"]},
         "cargo": {
           "commitMessageTopic": "Rust crate {{depName}}",
           "fileMatch": ["(^|/)Cargo\\.toml$"],
           "versioning": "cargo"
         },
         "cdnurl": {"fileMatch": [], "versioning": "semver"},
         "circleci": {"fileMatch": ["(^|/)\\.circleci/.+\\.ya?ml$"]},
         "cloudbuild": {"fileMatch": ["(^|/)cloudbuild\\.ya?ml"]},
         "cocoapods": {"fileMatch": ["(^|/)Podfile$"], "versioning": "ruby"},
         "composer": {
           "fileMatch": ["(^|/)([\\w-]*)composer\\.json$"],
           "versioning": "composer"
         },
         "conan": {
           "fileMatch": ["(^|/)conanfile\\.(txt|py)$"],
           "datasource": "conan",
           "versioning": "conan",
           "enabled": false
         },
         "cpanfile": {"fileMatch": ["(^|/)cpanfile$"]},
         "crossplane": {"fileMatch": []},
         "deps-edn": {"fileMatch": ["(^|/)(?:deps|bb)\\.edn$"], "versioning": "maven"},
         "docker-compose": {"fileMatch": ["(^|/)(?:docker-)?compose[^/]*\\.ya?ml$"]},
         "dockerfile": {
           "fileMatch": [
             "(^|/|\\.)([Dd]ocker|[Cc]ontainer)file$",
             "(^|/)([Dd]ocker|[Cc]ontainer)file[^/]*$"
           ]
         },
         "droneci": {"fileMatch": ["(^|/)\\.drone\\.yml$"]},
         "fleet": {"fileMatch": ["(^|/)fleet\\.ya?ml"]},
         "flux": {"fileMatch": ["(?:^|/)gotk-components\\.ya?ml$"]},
         "fvm": {
           "fileMatch": ["(^|/)\\.fvm/fvm_config\\.json$"],
           "versioning": "semver"
         },
         "git-submodules": {
           "enabled": false,
           "versioning": "git",
           "fileMatch": ["(^|/)\\.gitmodules$"]
         },
         "github-actions": {
           "fileMatch": [
             "(^|/)(workflow-templates|\\.(?:github|gitea|forgejo)/(?:workflows|actions))/.+\\.ya?ml$",
             "(^|/)action\\.ya?ml$"
           ]
         },
         "gitlabci": {"fileMatch": ["\\.gitlab-ci\\.ya?ml$"]},
         "gitlabci-include": {"fileMatch": ["\\.gitlab-ci\\.ya?ml$"]},
         "gomod": {"fileMatch": ["(^|/)go\\.mod$"], "pinDigests": false},
         "gradle": {
           "fileMatch": [
             "\\.gradle(\\.kts)?$",
             "(^|/)gradle\\.properties$",
             "(^|/)gradle/.+\\.toml$",
             "(^|/)buildSrc/.+\\.kt$",
             "\\.versions\\.toml$",
             "(^|/)versions.props$",
             "(^|/)versions.lock$"
           ],
           "timeout": 600,
           "versioning": "gradle"
         },
         "gradle-wrapper": {
           "fileMatch": ["(^|/)gradle/wrapper/gradle-wrapper\\.properties$"],
           "versioning": "gradle"
         },
         "helm-requirements": {
           "registryAliases": {"stable": "https://charts.helm.sh/stable"},
           "commitMessageTopic": "helm chart {{depName}}",
           "fileMatch": ["(^|/)requirements\\.ya?ml$"]
         },
         "helm-values": {
           "commitMessageTopic": "helm values {{depName}}",
           "fileMatch": ["(^|/)values\\.ya?ml$"],
           "pinDigests": false
         },
         "helmfile": {
           "registryAliases": {"stable": "https://charts.helm.sh/stable"},
           "commitMessageTopic": "helm chart {{depName}}",
           "fileMatch": ["(^|/)helmfile\\.ya?ml(?:\\.gotmpl)?$"]
         },
         "helmsman": {"fileMatch": []},
         "helmv3": {
           "registryAliases": {"stable": "https://charts.helm.sh/stable"},
           "commitMessageTopic": "helm chart {{depName}}",
           "fileMatch": ["(^|/)Chart\\.ya?ml$"]
         },
         "hermit": {
           "fileMatch": ["(^|/)bin/hermit$"],
           "excludeCommitPaths": ["**/bin/hermit"],
           "versioning": "hermit"
         },
         "homebrew": {
           "commitMessageTopic": "Homebrew Formula {{depName}}",
           "fileMatch": ["^Formula/[^/]+[.]rb$"]
         },
         "html": {
           "fileMatch": ["\\.html?$"],
           "versioning": "semver",
           "digest": {"enabled": false},
           "pinDigests": false
         },
         "jenkins": {"fileMatch": ["(^|/)plugins\\.(txt|ya?ml)$"]},
         "jsonnet-bundler": {
           "fileMatch": ["(^|/)jsonnetfile\\.json$"],
           "datasource": "git-tags"
         },
         "kotlin-script": {"fileMatch": ["^.+\\.main\\.kts$"]},
         "kubernetes": {"fileMatch": []},
         "kustomize": {
           "fileMatch": ["(^|/)kustomization\\.ya?ml$"],
           "pinDigests": false
         },
         "leiningen": {"fileMatch": ["(^|/)project\\.clj$"], "versioning": "maven"},
         "maven": {
           "fileMatch": [
             "(^|/|\\.)pom\\.xml$",
             "^(((\\.mvn)|(\\.m2))/)?settings\\.xml$"
           ],
           "versioning": "maven"
         },
         "maven-wrapper": {
           "fileMatch": ["(^|\\/).mvn/wrapper/maven-wrapper.properties$"],
           "versioning": "maven"
         },
         "meteor": {"fileMatch": ["(^|/)package\\.js$"]},
         "mint": {"fileMatch": ["(^|/)Mintfile$"]},
         "mix": {"fileMatch": ["(^|/)mix\\.exs$"], "versioning": "hex"},
         "nix": {
           "fileMatch": ["(^|/)flake\\.nix$"],
           "commitMessageTopic": "nixpkgs",
           "commitMessageExtra": "to {{newValue}}",
           "enabled": false
         },
         "nodenv": {"fileMatch": ["(^|/)\\.node-version$"], "versioning": "node"},
         "npm": {
           "fileMatch": ["(^|/)package\\.json$"],
           "digest": {
             "prBodyDefinitions": {
               "Change": "{{#if displayFrom}}`{{{displayFrom}}}` -> {{else}}{{#if currentValue}}`{{{currentValue}}}` -> {{/if}}{{/if}}{{#if displayTo}}`{{{displayTo}}}`{{else}}`{{{newValue}}}`{{/if}}"
             }
           },
           "prBodyDefinitions": {
             "Change": "[{{#if displayFrom}}`{{{displayFrom}}}` -> {{else}}{{#if currentValue}}`{{{currentValue}}}` -> {{/if}}{{/if}}{{#if displayTo}}`{{{displayTo}}}`{{else}}`{{{newValue}}}`{{/if}}]({{#if depName}}https://renovatebot.com/diffs/npm/{{replace '/' '%2f' depName}}/{{{currentVersion}}}/{{{newVersion}}}{{/if}})"
           }
         },
         "nuget": {
           "fileMatch": [
             "\\.(?:cs|fs|vb)proj$",
             "\\.(?:props|targets)$",
             "(^|/)dotnet-tools\\.json$",
             "(^|/)global\\.json$"
           ]
         },
         "nvm": {
           "fileMatch": ["(^|/)\\.nvmrc$"],
           "versioning": "node",
           "pinDigests": false
         },
         "ocb": {"fileMatch": []},
         "osgi": {"fileMatch": ["(^|/)src/main/features/.+\\.json$"]},
         "pep621": {"fileMatch": ["(^|/)pyproject\\.toml$"]},
         "pip-compile": {
           "fileMatch": [],
           "lockFileMaintenance": {
             "enabled": true,
             "branchTopic": "pip-compile-refresh",
             "commitMessageAction": "Refresh pip-compile outputs"
           }
         },
         "pip_requirements": {
           "fileMatch": ["(^|/)[\\w-]*requirements(-\\w+)?\\.(txt|pip)$"]
         },
         "pip_setup": {"fileMatch": ["(^|/)setup\\.py$"]},
         "pipenv": {"fileMatch": ["(^|/)Pipfile$"]},
         "poetry": {"fileMatch": ["(^|/)pyproject\\.toml$"]},
         "pre-commit": {
           "commitMessageTopic": "pre-commit hook {{depName}}",
           "enabled": false,
           "fileMatch": ["(^|/)\\.pre-commit-config\\.ya?ml$"],
           "prBodyNotes": [
             "Note: The `pre-commit` manager in Renovate is not supported by the `pre-commit` maintainers or community. Please do not report any problems there, instead [create a Discussion in the Renovate repository](https://github.com/renovatebot/renovate/discussions/new) if you have any questions."
           ]
         },
         "pub": {"fileMatch": ["(^|/)pubspec\\.ya?ml$"], "versioning": "npm"},
         "puppet": {"fileMatch": ["(^|/)Puppetfile$"]},
         "pyenv": {
           "fileMatch": ["(^|/)\\.python-version$"],
           "versioning": "docker",
           "pinDigests": false
         },
         "ruby-version": {
           "fileMatch": ["(^|/)\\.ruby-version$"],
           "versioning": "ruby"
         },
         "sbt": {
           "fileMatch": [
             "\\.sbt$",
             "project/[^/]*\\.scala$",
             "project/build\\.properties$",
             "(^|/)repositories$"
           ],
           "versioning": "ivy"
         },
         "setup-cfg": {"fileMatch": ["(^|/)setup\\.cfg$"], "versioning": "pep440"},
         "swift": {
           "fileMatch": ["(^|/)Package\\.swift"],
           "versioning": "swift",
           "pinDigests": false
         },
         "tekton": {"fileMatch": []},
         "terraform": {
           "commitMessageTopic": "Terraform {{depName}}",
           "fileMatch": ["\\.tf$"],
           "pinDigests": false
         },
         "terraform-version": {
           "fileMatch": ["(^|/)\\.terraform-version$"],
           "versioning": "hashicorp",
           "extractVersion": "^v(?<version>.*)$"
         },
         "terragrunt": {
           "commitMessageTopic": "Terragrunt dependency {{depName}}",
           "fileMatch": ["(^|/)terragrunt\\.hcl$"]
         },
         "terragrunt-version": {
           "fileMatch": ["(^|/)\\.terragrunt-version$"],
           "versioning": "hashicorp",
           "extractVersion": "^v(?<version>.+)$"
         },
         "tflint-plugin": {
           "commitMessageTopic": "TFLint plugin {{depName}}",
           "fileMatch": ["\\.tflint\\.hcl$"],
           "extractVersion": "^v(?<version>.*)$"
         },
         "travis": {
           "fileMatch": ["^\\.travis\\.ya?ml$"],
           "major": {"enabled": false},
           "versioning": "node"
         },
         "velaci": {"fileMatch": ["(^|/)\\.vela\\.ya?ml$"]},
         "vendir": {
           "commitMessageTopic": "vendir {{depName}}",
           "fileMatch": ["(^|/)vendir\\.yml$"]
         },
         "woodpecker": {"fileMatch": ["^\\.woodpecker(?:/[^/]+)?\\.ya?ml$"]},
         "regex": {"pinDigests": false},
         "repository": "local",
         "parentOrg": "",
         "errors": [],
         "warnings": [],
         "branchList": [],
         "defaultBranch": "",
         "isFork": false,
         "repoFingerprint": "",
         "baseBranch": "",
         "repoIsOnboarded": true,
         "matchPackageNames": [
           "fusion-cli",
           "fusion-core",
           "fusion-test-utils",
           "fusion-tokens",
           "fusion-cli",
           "fusion-core",
           "fusion-test-utils",
           "fusion-tokens"
         ],
         "matchPackagePrefixes": [
           "fusion-plugin-",
           "fusion-react",
           "^usion-apollo",
           "fusion-plugin-",
           "fusion-react",
           "^usion-apollo"
         ],
         "dryRun": "full",
         "platform": "local",
         "renovateJsonPresent": true
       },
       "hostRules": [
         {"matchHost": null, "token": "***********", "hostType": "local"},
         {
           "concurrentRequestLimit": 1,
           "matchHost": "repology.org",
           "maxRequestsPerSecond": 0.5,
           "resolvedHost": "repology.org"
         },
         {
           "concurrentRequestLimit": 1,
           "matchHost": "repology.org",
           "maxRequestsPerSecond": 0.5,
           "resolvedHost": "repology.org"
         }
       ]
DEBUG: No baseBranches (repository=local)
DEBUG: extract() (repository=local)
DEBUG: Could not get file list using git, using glob instead (repository=local)
DEBUG: Using file match: (^|/)(?:docker-)?compose[^/]*\.ya?ml$ for manager docker-compose (repository=local)
DEBUG: Using file match: (^|/)(workflow-templates|\.(?:github|gitea|forgejo)/(?:workflows|actions))/.+\.ya?ml$ for manager github-actions (repository=local)
DEBUG: Using file match: (^|/)action\.ya?ml$ for manager github-actions (repository=local)
DEBUG: Using file match: ^README\.md$ for manager regex (repository=local)
DEBUG: Using file match: ^README\.md$ for manager regex (repository=local)
DEBUG: Matched 1 file(s) for manager docker-compose: homeassistant/docker-compose.yml (repository=local)
DEBUG: Matched 1 file(s) for manager github-actions: .github/workflows/renovatebot.yml (repository=local)
DEBUG: Matched 1 file(s) for manager regex: README.md (repository=local)
DEBUG: Matched 1 file(s) for manager regex: README.md (repository=local)
DEBUG: docker-compose.extractPackageFile(homeassistant/docker-compose.yml) (repository=local)
DEBUG: manager extract durations (ms) (repository=local)
       "managers": {"docker-compose": 31, "regex": 41, "github-actions": 45}
DEBUG: Found docker-compose package files (repository=local)
DEBUG: Found github-actions package files (repository=local)
DEBUG: Found regex package files (repository=local)
DEBUG: Found regex package files (repository=local)
DEBUG: Found 4 package file(s) (repository=local)
 INFO: Dependency extraction complete (repository=local)
       "stats": {
         "managers": {
           "docker-compose": {"fileCount": 1, "depCount": 15},
           "github-actions": {"fileCount": 1, "depCount": 3},
           "regex": {"fileCount": 2, "depCount": 2}
         },
         "total": {"fileCount": 4, "depCount": 20}
       }
 WARN: GitHub token is required for some dependencies (repository=local)
       "githubDeps": ["actions/checkout", "renovatebot/github-action", "tjhorner/upsy-desky-"]
DEBUG: Dependency spx01/blocky has unsupported/unversioned value v0.22 (versioning=regex:^v(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)$) (repository=local)
DEBUG: getDigest(https://index.docker.io, spx01/blocky, v0.22) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, spx01/blocky, sha256:ba17812054a15b58ac80772afe404e7caa1da8c972f0c9ff7754eb3924fd5f57, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, spx01/blocky, v0.22, head) (repository=local)
DEBUG: getLabels(https://index.docker.io, authelia/authelia, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, authelia/authelia, latest, get) (repository=local)
DEBUG: getLabels(https://index.docker.io, tecnativa/docker-socket-proxy, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, tecnativa/docker-socket-proxy, latest, get) (repository=local)
DEBUG: getLabels(https://index.docker.io, library/traefik, latest) (repository=local)
DEBUG: Docker Hub library image - skipping label lookup (repository=local)
DEBUG: getDigest(https://index.docker.io, library/traefik, 2.11.2) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, library/traefik, sha256:c6f6001dd1fc09fb0ae47ad2198102c40a8d9586c02d6040d561fd4fb7e91f45, head) (repository=local)
DEBUG: getLabels(https://index.docker.io, homeassistant/home-assistant, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, homeassistant/home-assistant, latest, get) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, tecnativa/docker-socket-proxy, sha256:7be95df49f3f07dc6b0840ed97162816ae0631a76048fa6960a99ba598bf6810, get) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, authelia/authelia, sha256:e45167e3090551a0cab66f015b9332aedc9386f970ac20ba41da676d4d0242a6, get) (repository=local)
DEBUG: Got docker digest sha256:ba17812054a15b58ac80772afe404e7caa1da8c972f0c9ff7754eb3924fd5f57 (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, library/traefik, 2.11.2, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, homeassistant/home-assistant, sha256:9769542a11b1500a7ff2289a8c891795c4c7238b9aa37618f6e152270e94be82, get) (repository=local)
DEBUG: Got docker digest sha256:c6f6001dd1fc09fb0ae47ad2198102c40a8d9586c02d6040d561fd4fb7e91f45 (repository=local)
DEBUG: getDigest(https://index.docker.io, authelia/authelia, 4.38.8) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, authelia/authelia, sha256:19375b10024caeef4e0b119a6247beae84cbaa02c846cfd750e92dea910d4b6a, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, authelia/authelia, 4.38.8, head) (repository=local)
DEBUG: found labels in manifest (repository=local)
       "labels": {
         "org.opencontainers.image.created": "2024-04-05T19:10:22.929Z",
         "org.opencontainers.image.description": "Proxy over your Docker socket to restrict which requests it accepts",
         "org.opencontainers.image.licenses": "Apache-2.0",
         "org.opencontainers.image.revision": "45f7fb01df827c1072c9e9b8f6a307dc6eb0de8a",
         "org.opencontainers.image.source": "https://github.com/Tecnativa/docker-socket-proxy",
         "org.opencontainers.image.title": "docker-socket-proxy",
         "org.opencontainers.image.url": "https://github.com/Tecnativa/docker-socket-proxy",
         "org.opencontainers.image.version": "0.1.2"
       }
DEBUG: getDigest(https://index.docker.io, tecnativa/docker-socket-proxy, 0.1.2) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, tecnativa/docker-socket-proxy, sha256:dc8ec925b1360c54e6bf350602d6faac4e33c5d8d809118e4c000c0b14a4529a, head) (repository=local)
DEBUG: getLabels(https://index.docker.io, portainer/portainer-ce, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, portainer/portainer-ce, latest, get) (repository=local)
DEBUG: found labels in manifest (repository=local)
       "labels": {
         "io.hass.arch": "aarch64",
         "io.hass.base.arch": "aarch64",
         "io.hass.base.image": "ghcr.io/home-assistant/aarch64-base:3.19",
         "io.hass.base.name": "python",
         "io.hass.base.version": "2024.03.0",
         "io.hass.type": "core",
         "io.hass.version": "2024.4.3",
         "org.opencontainers.image.authors": "The Home Assistant Authors",
         "org.opencontainers.image.created": "2024-04-12 11:26:39+00:00",
         "org.opencontainers.image.description": "Open-source home automation platform running on Python 3",
         "org.opencontainers.image.documentation": "https://www.home-assistant.io/docs/",
         "org.opencontainers.image.licenses": "Apache License 2.0",
         "org.opencontainers.image.source": "https://github.com/home-assistant/core",
         "org.opencontainers.image.title": "Home Assistant",
         "org.opencontainers.image.url": "https://www.home-assistant.io/",
         "org.opencontainers.image.version": "2024.4.3"
       }
DEBUG: getDigest(https://index.docker.io, homeassistant/home-assistant, 2024.4.3) (repository=local)
DEBUG: Got docker digest sha256:19375b10024caeef4e0b119a6247beae84cbaa02c846cfd750e92dea910d4b6a (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, homeassistant/home-assistant, sha256:4f86df601650c74b8689f1be033054ff09567db5dba5bf227ccc406ca4fa88d0, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, tecnativa/docker-socket-proxy, 0.1.2, head) (repository=local)
DEBUG: getLabels(https://index.docker.io, joseluisq/static-web-server, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, joseluisq/static-web-server, latest, get) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, portainer/portainer-ce, sha256:a5c79597ada24d6e9c4520d1b0bf7b5aa11ef48b362988828465373f256e4c84, get) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, homeassistant/home-assistant, 2024.4.3, head) (repository=local)
DEBUG: Got docker digest sha256:dc8ec925b1360c54e6bf350602d6faac4e33c5d8d809118e4c000c0b14a4529a (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, joseluisq/static-web-server, sha256:4490c3bf1d985395670d1aacdd896599e45417ea4eaac25e6d1457170326b47d, get) (repository=local)
DEBUG: Got docker digest sha256:4f86df601650c74b8689f1be033054ff09567db5dba5bf227ccc406ca4fa88d0 (repository=local)
DEBUG: getLabels(https://index.docker.io, saspus/duplicacy-web, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, saspus/duplicacy-web, latest, get) (repository=local)
DEBUG: found labels in manifest (repository=local)
       "labels": {
         "com.docker.desktop.extension.api.version": ">= 0.2.2",
         "com.docker.desktop.extension.icon": "https://portainer-io-assets.sfo2.cdn.digitaloceanspaces.com/logos/portainer.png",
         "com.docker.extension.additional-urls": "[{\"title\":\"Website\",\"url\":\"https://www.portainer.io?utm_campaign=DockerCon&utm_source=DockerDesktop\"},{\"title\":\"Documentation\",\"url\":\"https://docs.portainer.io\"},{\"title\":\"Support\",\"url\":\"https://join.slack.com/t/portainer/shared_invite/zt-txh3ljab-52QHTyjCqbe5RibC2lcjKA\"}]",
         "com.docker.extension.detailed-description": "<p data-renderer-start-pos=\"226\">Portainer&rsquo;s Docker Desktop extension gives you access to all of Portainer&rsquo;s rich management functionality within your docker desktop experience.</p><h2 data-renderer-start-pos=\"374\">With Portainer you can:</h2><ul><li>See all your running containers</li><li>Easily view all of your container logs</li><li>Console into containers</li><li>Easily deploy your code into containers using a simple form</li><li>Turn your YAML into custom templates for easy reuse</li></ul><h2 data-renderer-start-pos=\"660\">About Portainer&nbsp;</h2><p data-renderer-start-pos=\"680\">Portainer is the worlds&rsquo; most popular universal container management platform with more than 650,000 active monthly users. Portainer can be used to manage Docker Standalone, Kubernetes, Docker Swarm and Nomad environments through a single common interface. It includes a simple GitOps automation engine and a Kube API.&nbsp;</p><p data-renderer-start-pos=\"1006\">Portainer Business Edition is our fully supported commercial grade product for business-wide use. It includes all the functionality that businesses need to manage containers at scale. Visit <a class=\"sc-jKJlTe dPfAtb\" href=\"http://portainer.io/\" title=\"http://Portainer.io\" data-renderer-mark=\"true\">Portainer.io</a> to learn more about Portainer Business and <a class=\"sc-jKJlTe dPfAtb\" href=\"http://portainer.io/take-3?utm_campaign=DockerCon&amp;utm_source=Docker%20Desktop\" title=\"http://portainer.io/take-3?utm_campaign=DockerCon&amp;utm_source=Docker%20Desktop\" data-renderer-mark=\"true\">get 3 free nodes.</a></p>",
         "com.docker.extension.publisher-url": "https://www.portainer.io",
         "com.docker.extension.screenshots": "[{\"alt\": \"screenshot one\", \"url\": \"https://portainer-io-assets.sfo2.digitaloceanspaces.com/screenshots/docker-extension-1.png\"},{\"alt\": \"screenshot two\", \"url\": \"https://portainer-io-assets.sfo2.digitaloceanspaces.com/screenshots/docker-extension-2.png\"},{\"alt\": \"screenshot three\", \"url\": \"https://portainer-io-assets.sfo2.digitaloceanspaces.com/screenshots/docker-extension-3.png\"},{\"alt\": \"screenshot four\", \"url\": \"https://portainer-io-assets.sfo2.digitaloceanspaces.com/screenshots/docker-extension-4.png\"},{\"alt\": \"screenshot five\", \"url\": \"https://portainer-io-assets.sfo2.digitaloceanspaces.com/screenshots/docker-extension-5.png\"},{\"alt\": \"screenshot six\", \"url\": \"https://portainer-io-assets.sfo2.digitaloceanspaces.com/screenshots/docker-extension-6.png\"},{\"alt\": \"screenshot seven\", \"url\": \"https://portainer-io-assets.sfo2.digitaloceanspaces.com/screenshots/docker-extension-7.png\"},{\"alt\": \"screenshot eight\", \"url\": \"https://portainer-io-assets.sfo2.digitaloceanspaces.com/screenshots/docker-extension-8.png\"},{\"alt\": \"screenshot nine\", \"url\": \"https://portainer-io-assets.sfo2.digitaloceanspaces.com/screenshots/docker-extension-9.png\"}]",
         "io.portainer.server": "true",
         "org.opencontainers.image.description": "Docker container management made simple, with the world’s most popular GUI-based container management platform.",
         "org.opencontainers.image.title": "Portainer",
         "org.opencontainers.image.vendor": "Portainer.io"
       }
DEBUG: getDigest(https://index.docker.io, portainer/portainer-ce, 2.20.1) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, portainer/portainer-ce, sha256:052939c971eb602a56665a6c6e2538dddb3ecdc6f0d0a5f324a4967a74d9c72c, head) (repository=local)
DEBUG: found labels in manifest (repository=local)
       "labels": {
         "description": "A cross-platform, high-performance and asynchronous web server for static files-serving.",
         "maintainer": "Jose Quintana <joseluisq.net>",
         "org.opencontainers.image.description": "A cross-platform, high-performance and asynchronous web server for static files-serving.",
         "org.opencontainers.image.documentation": "https://github.com/static-web-server/static-web-server",
         "org.opencontainers.image.title": "Static Web Server",
         "org.opencontainers.image.url": "https://github.com/static-web-server/static-web-server",
         "org.opencontainers.image.vendor": "Jose Quintana",
         "org.opencontainers.image.version": "2.28.0",
         "version": "2.28.0"
       }
DEBUG: getLabels(https://index.docker.io, library/influxdb, latest) (repository=local)
DEBUG: Docker Hub library image - skipping label lookup (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, portainer/portainer-ce, 2.20.1, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, saspus/duplicacy-web, sha256:9ff7a9fcbae9e63b2df45e6c43d92c88dc948c0cf79dbacfdb63d553e9da3485, get) (repository=local)
DEBUG: getDigest(https://index.docker.io, joseluisq/static-web-server, 2.28.0) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, joseluisq/static-web-server, sha256:542265a74fb2b492d8c869d373950a5528ab2ae78982da63f547619480fa839c, head) (repository=local)
DEBUG: getDigest(https://index.docker.io, library/influxdb, 2.7.6) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, library/influxdb, sha256:edb7c3b48eee5858282f1412d973ea8ed8dea7866dcc8ddfe97de6edb0edf801, head) (repository=local)
DEBUG: getLabels(https://index.docker.io, library/eclipse-mosquitto, latest) (repository=local)
DEBUG: Docker Hub library image - skipping label lookup (repository=local)
DEBUG: Got docker digest sha256:052939c971eb602a56665a6c6e2538dddb3ecdc6f0d0a5f324a4967a74d9c72c (repository=local)
DEBUG: getDigest(https://index.docker.io, library/eclipse-mosquitto, 2.0.18) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, library/eclipse-mosquitto, sha256:cb3afd02611b0c58b328196ab00de0158322b4c1e014841fb182d2a0ea3a79b9, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, joseluisq/static-web-server, 2.28.0, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, library/influxdb, 2.7.6, head) (repository=local)
DEBUG: Got docker digest sha256:edb7c3b48eee5858282f1412d973ea8ed8dea7866dcc8ddfe97de6edb0edf801 (repository=local)
DEBUG: Got docker digest sha256:542265a74fb2b492d8c869d373950a5528ab2ae78982da63f547619480fa839c (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, library/eclipse-mosquitto, 2.0.18, head) (repository=local)
DEBUG: found labels in manifest (repository=local)
       "labels": {}
DEBUG: getDigest(https://index.docker.io, saspus/duplicacy-web, v1.8.0) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, saspus/duplicacy-web, sha256:da97a4cc8d4d8209023313a26731ca9fab1d408bd2f0f878d5db9c87d213230d, head) (repository=local)
DEBUG: Got docker digest sha256:cb3afd02611b0c58b328196ab00de0158322b4c1e014841fb182d2a0ea3a79b9 (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, saspus/duplicacy-web, v1.8.0, head) (repository=local)
DEBUG: getLabels(https://index.docker.io, koenkk/zigbee2mqtt, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, koenkk/zigbee2mqtt, latest, get) (repository=local)
DEBUG: Got docker digest sha256:da97a4cc8d4d8209023313a26731ca9fab1d408bd2f0f878d5db9c87d213230d (repository=local)
DEBUG: Dependency: ghcr.io/esphome/esphome, is disabled (repository=local)
DEBUG: getLabels(https://index.docker.io, b4bz/homer, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, b4bz/homer, latest, get) (repository=local)
DEBUG: getLabels(https://index.docker.io, nodered/node-red, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, nodered/node-red, latest, get) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, koenkk/zigbee2mqtt, sha256:0d2135b7f85483bee940a7de43f69cc181e17fa93ade074cf4bcc386729b671c, get) (repository=local)
DEBUG: getLabels(https://index.docker.io, fmartinou/whats-up-docker, latest) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, fmartinou/whats-up-docker, latest, get) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, b4bz/homer, sha256:a2d39d4605705272da4e3834a40a45fbace4031e73154cc3f6b584d341724a88, get) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, nodered/node-red, sha256:4f7f84b8e8b8ad67cab30ce1283affe2b3f7cd6ccfb6fc260ad6290202430218, get) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, fmartinou/whats-up-docker, sha256:65babe494ff97a9243de0d730b3914783d22c7abee890566c510bc63ec0a6ae6, get) (repository=local)
DEBUG: found labels in manifest (repository=local)
       "labels": {}
DEBUG: getDigest(https://index.docker.io, koenkk/zigbee2mqtt, 1.36.1) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, koenkk/zigbee2mqtt, sha256:32901c8b100ee4d04123eb714523a023ca4aba7946e504209c7d773d07f697b5, head) (repository=local)
DEBUG: found labels in manifest (repository=local)
       "labels": {}
DEBUG: found labels in manifest (repository=local)
       "labels": {
         "authors": "Dave Conway-Jones, Nick O'Leary, James Thomas, Raymond Mouthaan",
         "org.label-schema.arch": "",
         "org.label-schema.build-date": "2024-04-11T18:33:30Z",
         "org.label-schema.description": "Low-code programming for event-driven applications.",
         "org.label-schema.docker.dockerfile": ".docker/Dockerfile.alpine",
         "org.label-schema.license": "Apache-2.0",
         "org.label-schema.name": "Node-RED",
         "org.label-schema.url": "https://nodered.org",
         "org.label-schema.vcs-ref": "",
         "org.label-schema.vcs-type": "Git",
         "org.label-schema.vcs-url": "https://github.com/node-red/node-red-docker",
         "org.label-schema.version": "3.1.9"
       }
DEBUG: getDigest(https://index.docker.io, b4bz/homer, v23.10.1) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, b4bz/homer, sha256:f6dcbdd3e9c7d05262128b07aa4138bd4df09837f9a98632111913e9a5eb2283, head) (repository=local)
DEBUG: getDigest(https://index.docker.io, nodered/node-red, 3.1.9-18-minimal) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, nodered/node-red, sha256:e17a5f2655cb3da9766f03e5a339a23034bd72450e21c0da5e0b36cf4d040f5f, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, koenkk/zigbee2mqtt, 1.36.1, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, b4bz/homer, v23.10.1, head) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, nodered/node-red, 3.1.9-18-minimal, head) (repository=local)
DEBUG: Got docker digest sha256:32901c8b100ee4d04123eb714523a023ca4aba7946e504209c7d773d07f697b5 (repository=local)
DEBUG: found labels in manifest (repository=local)
       "labels": {"maintainer": "fmartinou"}
DEBUG: getDigest(https://index.docker.io, fmartinou/whats-up-docker, 6.3.0) (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, fmartinou/whats-up-docker, sha256:dd2f99b06963a1d25f68ce8a7fab1d23a0fb4dbda691118a7dcb662fd7f0b395, head) (repository=local)
DEBUG: Got docker digest sha256:e17a5f2655cb3da9766f03e5a339a23034bd72450e21c0da5e0b36cf4d040f5f (repository=local)
DEBUG: Got docker digest sha256:f6dcbdd3e9c7d05262128b07aa4138bd4df09837f9a98632111913e9a5eb2283 (repository=local)
DEBUG: getManifestResponse(https://index.docker.io, fmartinou/whats-up-docker, 6.3.0, head) (repository=local)
DEBUG: Got docker digest sha256:dd2f99b06963a1d25f68ce8a7fab1d23a0fb4dbda691118a7dcb662fd7f0b395 (repository=local)
DEBUG: PackageFiles.add() - Package file saved for base branch (repository=local)
DEBUG: Package releases lookups complete (repository=local)
DEBUG: branchifyUpgrades (repository=local)
DEBUG: detectSemanticCommits() (repository=local)
DEBUG: getCommitMessages (repository=local)
DEBUG: semanticCommits: detected "unknown" (repository=local)
DEBUG: semanticCommits: disabled (repository=local)
DEBUG: 0 flattened updates found:  (repository=local)
DEBUG: Returning 0 branch(es) (repository=local)
DEBUG: config.repoIsOnboarded=true (repository=local)
DEBUG: packageFiles with updates (repository=local)
       "config": {
         "docker-compose": [
           {
             "deps": [
               {
                 "depName": "traefik",
                 "currentValue": "2.11.2",
                 "currentDigest": "sha256:c6f6001dd1fc09fb0ae47ad2198102c40a8d9586c02d6040d561fd4fb7e91f45",
                 "replaceString": "traefik:2.11.2@sha256:c6f6001dd1fc09fb0ae47ad2198102c40a8d9586c02d6040d561fd4fb7e91f45",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "traefik",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "sourceUrl": "https://github.com/containous/traefik",
                 "registryUrl": "https://index.docker.io",
                 "lookupName": "library/traefik",
                 "currentVersion": "2.11.2",
                 "fixedVersion": "2.11.2"
               },
               {
                 "depName": "tecnativa/docker-socket-proxy",
                 "currentValue": "0.1.2",
                 "currentDigest": "sha256:dc8ec925b1360c54e6bf350602d6faac4e33c5d8d809118e4c000c0b14a4529a",
                 "replaceString": "tecnativa/docker-socket-proxy:0.1.2@sha256:dc8ec925b1360c54e6bf350602d6faac4e33c5d8d809118e4c000c0b14a4529a",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "tecnativa/docker-socket-proxy",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "sourceUrl": "https://github.com/Tecnativa/docker-socket-proxy",
                 "registryUrl": "https://index.docker.io",
                 "currentVersion": "0.1.2",
                 "fixedVersion": "0.1.2"
               },
               {
                 "depName": "spx01/blocky",
                 "currentValue": "v0.22",
                 "currentDigest": "sha256:ba17812054a15b58ac80772afe404e7caa1da8c972f0c9ff7754eb3924fd5f57",
                 "replaceString": "spx01/blocky:v0.22@sha256:ba17812054a15b58ac80772afe404e7caa1da8c972f0c9ff7754eb3924fd5f57",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "spx01/blocky",
                 "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": []
               },
               {
                 "depName": "authelia/authelia",
                 "currentValue": "4.38.8",
                 "currentDigest": "sha256:19375b10024caeef4e0b119a6247beae84cbaa02c846cfd750e92dea910d4b6a",
                 "replaceString": "authelia/authelia:4.38.8@sha256:19375b10024caeef4e0b119a6247beae84cbaa02c846cfd750e92dea910d4b6a",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "authelia/authelia",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "sourceUrl": "https://github.com/authelia/authelia",
                 "registryUrl": "https://index.docker.io",
                 "homepage": "https://github.com/authelia/authelia/pkgs/container/authelia",
                 "currentVersion": "4.38.8",
                 "fixedVersion": "4.38.8"
               },
               {
                 "depName": "homeassistant/home-assistant",
                 "currentValue": "2024.4.3",
                 "currentDigest": "sha256:4f86df601650c74b8689f1be033054ff09567db5dba5bf227ccc406ca4fa88d0",
                 "replaceString": "homeassistant/home-assistant:2024.4.3@sha256:4f86df601650c74b8689f1be033054ff09567db5dba5bf227ccc406ca4fa88d0",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "homeassistant/home-assistant",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "sourceUrl": "https://github.com/home-assistant/core",
                 "registryUrl": "https://index.docker.io",
                 "homepage": "https://www.home-assistant.io/",
                 "currentVersion": "2024.4.3",
                 "fixedVersion": "2024.4.3"
               },
               {
                 "depName": "portainer/portainer-ce",
                 "currentValue": "2.20.1",
                 "currentDigest": "sha256:052939c971eb602a56665a6c6e2538dddb3ecdc6f0d0a5f324a4967a74d9c72c",
                 "replaceString": "portainer/portainer-ce:2.20.1@sha256:052939c971eb602a56665a6c6e2538dddb3ecdc6f0d0a5f324a4967a74d9c72c",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "portainer/portainer-ce",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "registryUrl": "https://index.docker.io",
                 "currentVersion": "2.20.1",
                 "fixedVersion": "2.20.1"
               },
               {
                 "depName": "joseluisq/static-web-server",
                 "currentValue": "2.28.0",
                 "currentDigest": "sha256:542265a74fb2b492d8c869d373950a5528ab2ae78982da63f547619480fa839c",
                 "replaceString": "joseluisq/static-web-server:2.28.0@sha256:542265a74fb2b492d8c869d373950a5528ab2ae78982da63f547619480fa839c",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "joseluisq/static-web-server",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "sourceUrl": "https://github.com/static-web-server/static-web-server",
                 "registryUrl": "https://index.docker.io",
                 "currentVersion": "2.28.0",
                 "fixedVersion": "2.28.0"
               },
               {
                 "depName": "saspus/duplicacy-web",
                 "currentValue": "v1.8.0",
                 "currentDigest": "sha256:da97a4cc8d4d8209023313a26731ca9fab1d408bd2f0f878d5db9c87d213230d",
                 "replaceString": "saspus/duplicacy-web:v1.8.0@sha256:da97a4cc8d4d8209023313a26731ca9fab1d408bd2f0f878d5db9c87d213230d",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "saspus/duplicacy-web",
                 "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "registryUrl": "https://index.docker.io",
                 "currentVersion": "v1.8.0",
                 "fixedVersion": "v1.8.0"
               },
               {
                 "depName": "influxdb",
                 "currentValue": "2.7.6",
                 "currentDigest": "sha256:edb7c3b48eee5858282f1412d973ea8ed8dea7866dcc8ddfe97de6edb0edf801",
                 "replaceString": "influxdb:2.7.6@sha256:edb7c3b48eee5858282f1412d973ea8ed8dea7866dcc8ddfe97de6edb0edf801",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "influxdb",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "registryUrl": "https://index.docker.io",
                 "lookupName": "library/influxdb",
                 "currentVersion": "2.7.6",
                 "fixedVersion": "2.7.6"
               },
               {
                 "depName": "eclipse-mosquitto",
                 "currentValue": "2.0.18",
                 "currentDigest": "sha256:cb3afd02611b0c58b328196ab00de0158322b4c1e014841fb182d2a0ea3a79b9",
                 "replaceString": "eclipse-mosquitto:2.0.18@sha256:cb3afd02611b0c58b328196ab00de0158322b4c1e014841fb182d2a0ea3a79b9",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "eclipse-mosquitto",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "registryUrl": "https://index.docker.io",
                 "lookupName": "library/eclipse-mosquitto",
                 "currentVersion": "2.0.18",
                 "fixedVersion": "2.0.18"
               },
               {
                 "depName": "koenkk/zigbee2mqtt",
                 "currentValue": "1.36.1",
                 "currentDigest": "sha256:32901c8b100ee4d04123eb714523a023ca4aba7946e504209c7d773d07f697b5",
                 "replaceString": "koenkk/zigbee2mqtt:1.36.1@sha256:32901c8b100ee4d04123eb714523a023ca4aba7946e504209c7d773d07f697b5",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "koenkk/zigbee2mqtt",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "registryUrl": "https://index.docker.io",
                 "currentVersion": "1.36.1",
                 "fixedVersion": "1.36.1"
               },
               {
                 "depName": "nodered/node-red",
                 "currentValue": "3.1.9-18-minimal",
                 "currentDigest": "sha256:e17a5f2655cb3da9766f03e5a339a23034bd72450e21c0da5e0b36cf4d040f5f",
                 "replaceString": "nodered/node-red:3.1.9-18-minimal@sha256:e17a5f2655cb3da9766f03e5a339a23034bd72450e21c0da5e0b36cf4d040f5f",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "nodered/node-red",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)-18-minimal$",
                 "warnings": [],
                 "sourceUrl": "https://github.com/node-red/node-red-docker",
                 "registryUrl": "https://index.docker.io",
                 "currentVersion": "3.1.9-18-minimal",
                 "fixedVersion": "3.1.9-18-minimal"
               },
               {
                 "depName": "b4bz/homer",
                 "currentValue": "v23.10.1",
                 "currentDigest": "sha256:f6dcbdd3e9c7d05262128b07aa4138bd4df09837f9a98632111913e9a5eb2283",
                 "replaceString": "b4bz/homer:v23.10.1@sha256:f6dcbdd3e9c7d05262128b07aa4138bd4df09837f9a98632111913e9a5eb2283",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "b4bz/homer",
                 "versioning": "regex:^v(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "registryUrl": "https://index.docker.io",
                 "currentVersion": "v23.10.1",
                 "fixedVersion": "v23.10.1"
               },
               {
                 "depName": "fmartinou/whats-up-docker",
                 "currentValue": "6.3.0",
                 "currentDigest": "sha256:dd2f99b06963a1d25f68ce8a7fab1d23a0fb4dbda691118a7dcb662fd7f0b395",
                 "replaceString": "fmartinou/whats-up-docker:6.3.0@sha256:dd2f99b06963a1d25f68ce8a7fab1d23a0fb4dbda691118a7dcb662fd7f0b395",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "fmartinou/whats-up-docker",
                 "versioning": "regex:^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$",
                 "warnings": [],
                 "registryUrl": "https://index.docker.io",
                 "currentVersion": "6.3.0",
                 "fixedVersion": "6.3.0"
               },
               {
                 "depName": "ghcr.io/esphome/esphome",
                 "currentValue": "2023.12.9",
                 "currentDigest": "sha256:310919056ef06f35aa815efce8b2c7c160b6adc1bfb7285afccabc432de38d86",
                 "replaceString": "ghcr.io/esphome/esphome:2023.12.9@sha256:310919056ef06f35aa815efce8b2c7c160b6adc1bfb7285afccabc432de38d86",
                 "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
                 "datasource": "docker",
                 "updates": [],
                 "packageName": "ghcr.io/esphome/esphome",
                 "skipReason": "disabled"
               }
             ],
             "packageFile": "homeassistant/docker-compose.yml"
           }
         ],
         "github-actions": [
           {
             "deps": [
               {
                 "depName": "actions/checkout",
                 "commitMessageTopic": "{{{depName}}} action",
                 "datasource": "github-tags",
                 "versioning": "docker",
                 "depType": "action",
                 "replaceString": "actions/checkout@b4ffde65f46336ab88eb53be808477a3936bae11 # tag=v4.1.1",
                 "autoReplaceStringTemplate": "{{depName}}@{{#if newDigest}}{{newDigest}}{{#if newValue}} # {{newValue}}{{/if}}{{/if}}{{#unless newDigest}}{{newValue}}{{/unless}}",
                 "currentValue": "v4.1.1",
                 "currentDigest": "b4ffde65f46336ab88eb53be808477a3936bae11",
                 "skipReason": "github-token-required",
                 "updates": [],
                 "packageName": "actions/checkout"
               },
               {
                 "depName": "renovatebot/github-action",
                 "commitMessageTopic": "{{{depName}}} action",
                 "datasource": "github-tags",
                 "versioning": "docker",
                 "depType": "action",
                 "replaceString": "renovatebot/github-action@74811c93da74bf38cb37f41489065619930fba44 # v40.1.9",
                 "autoReplaceStringTemplate": "{{depName}}@{{#if newDigest}}{{newDigest}}{{#if newValue}} # {{newValue}}{{/if}}{{/if}}{{#unless newDigest}}{{newValue}}{{/unless}}",
                 "currentValue": "v40.1.9",
                 "currentDigest": "74811c93da74bf38cb37f41489065619930fba44",
                 "skipReason": "github-token-required",
                 "updates": [],
                 "packageName": "renovatebot/github-action"
               },
               {
                 "depName": "ubuntu",
                 "currentValue": "latest",
                 "replaceString": "ubuntu-latest",
                 "depType": "github-runner",
                 "datasource": "github-runners",
                 "autoReplaceStringTemplate": "{{depName}}-{{newValue}}",
                 "skipReason": "invalid-version",
                 "updates": [],
                 "packageName": "ubuntu"
               }
             ],
             "packageFile": ".github/workflows/renovatebot.yml"
           }
         ],
         "regex": [
           {
             "deps": [
               {
                 "depName": "tjhorner/upsy-desky-",
                 "packageName": "tjhorner/upsy-desky",
                 "currentValue": "v1.2.0",
                 "datasource": "github-releases",
                 "replaceString": " github.com/tjhorner/upsy-desky | v1.2.0 |",
                 "skipReason": "github-token-required",
                 "updates": []
               }
             ],
             "matchStrings": [
               "[^_]github.com\\/(?<packageName>.*) \\| (?<currentValue>v?\\d+\\.\\d+\\.\\d+) \\|"
             ],
             "depNameTemplate": "{{packageName}}-{{newVersion}}",
             "datasourceTemplate": "github-releases",
             "packageFile": "README.md"
           },
           {
             "deps": [
               {
                 "depName": "tjhorner/upsy-desky-",
                 "packageName": "tjhorner/upsy-desky",
                 "currentValue": "v1.2.0",
                 "datasource": "github-releases",
                 "replaceString": " github.com/tjhorner/upsy-desky | v1.2.0 |",
                 "skipReason": "github-token-required",
                 "updates": []
               }
             ],
             "matchStrings": [
               "[^_]github.com\\/(?<packageName>.*) \\| (?<currentValue>v?\\d+\\.\\d+\\.\\d+) \\|"
             ],
             "depNameTemplate": "{{packageName}}-{{newVersion}}",
             "datasourceTemplate": "github-releases",
             "packageFile": "README.md"
           }
         ]
       }
DEBUG: detectSemanticCommits() (repository=local)
DEBUG: semanticCommits: returning "disabled" from cache (repository=local)
DEBUG: processRepo() (repository=local)
DEBUG: Processing 0 branches:  (repository=local)
DEBUG: Calculating hourly PRs remaining (repository=local)
DEBUG: currentHourStart=2024-04-16T11:00:00.000+00:00 (repository=local)
DEBUG: PR hourly limit remaining: 2 (repository=local)
DEBUG: Calculating prConcurrentLimit (10) (repository=local)
DEBUG: 0 PRs are currently open (repository=local)
DEBUG: PR concurrent limit remaining: 10 (repository=local)
DEBUG: Calculated maximum PRs remaining this run: 2 (repository=local)
DEBUG: PullRequests limit = 2 (repository=local)
DEBUG: Calculating hourly PRs remaining (repository=local)
DEBUG: currentHourStart=2024-04-16T11:00:00.000+00:00 (repository=local)
DEBUG: PR hourly limit remaining: 2 (repository=local)
DEBUG: Calculating branchConcurrentLimit (10) (repository=local)
DEBUG: 0 already existing branches found:  (repository=local)
DEBUG: Branch concurrent limit remaining: 10 (repository=local)
DEBUG: Calculated maximum branches remaining this run: 2 (repository=local)
DEBUG: Branches limit = 2 (repository=local)
DEBUG: ensureDependencyDashboard() (repository=local)
DEBUG: Ensuring Dependency Dashboard (repository=local)
 INFO: DRY-RUN: Would ensure Dependency Dashboard (repository=local)
       "title": "Dependency Dashboard"
DEBUG: validateReconfigureBranch() (repository=local)
ERROR: Repository has unknown error (repository=local)
       "err": {
         "message": "Cannot read properties of undefined (reading 'renovate/reconfigure')",
         "stack": "TypeError: Cannot read properties of undefined (reading 'renovate/reconfigure')\n    at getBranchCommit (/usr/local/renovate/lib/util/git/index.ts:504:30)\n    at validateReconfigureBranch (/usr/local/renovate/lib/workers/repository/reconfigure/index.ts:61:36)\n    at finalizeRepo (/usr/local/renovate/lib/workers/repository/finalize/index.ts:20:3)\n    at Object.renovateRepository (/usr/local/renovate/lib/workers/repository/index.ts:105:7)\n    at attributes.repository (/usr/local/renovate/lib/workers/global/index.ts:205:11)\n    at start (/usr/local/renovate/lib/workers/global/index.ts:190:7)\n    at /usr/local/renovate/lib/renovate.ts:18:22"
       }
DEBUG: Repository result: unknown-error, status: onboarded, enabled: true, onboarded: true (repository=local)
DEBUG: Repository timing splits (milliseconds) (repository=local)
       "splits": {"init": 1728, "extract": 168, "lookup": 16831, "onboarding": 1, "update": 3},
       "total": 18793
DEBUG: Package cache statistics (repository=local)
       "get": {"count": 76, "avgMs": 5, "medianMs": 1, "maxMs": 54, "totalMs": 377},
       "set": {"count": 76, "avgMs": 12, "medianMs": 8, "maxMs": 70, "totalMs": 947}
DEBUG: HTTP statistics (repository=local)
       "urls": {
         "https://auth.docker.io/token": {"GET": {"200": 14}},
         "https://index.docker.io/v2/": {"GET": {"401": 1}},
         "https://index.docker.io/v2/authelia/authelia/manifests/4.38.8": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/authelia/authelia/manifests/latest": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/authelia/authelia/manifests/sha256:19375b10024caeef4e0b119a6247beae84cbaa02c846cfd750e92dea910d4b6a": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/authelia/authelia/manifests/sha256:e45167e3090551a0cab66f015b9332aedc9386f970ac20ba41da676d4d0242a6": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/authelia/authelia/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/b4bz/homer/blobs/sha256:661ffdc7cee00434ed23157f167454183844970278ba344112acc57bd8e7cfde": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/b4bz/homer/manifests/latest": {"GET": {"200": 1}},
         "https://index.docker.io/v2/b4bz/homer/manifests/sha256:a2d39d4605705272da4e3834a40a45fbace4031e73154cc3f6b584d341724a88": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/b4bz/homer/manifests/sha256:f6dcbdd3e9c7d05262128b07aa4138bd4df09837f9a98632111913e9a5eb2283": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/b4bz/homer/manifests/v23.10.1": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/b4bz/homer/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/fmartinou/whats-up-docker/blobs/sha256:f4d52d8ba44062ad7bab6a13d8b60055b6b7464ce460ab1fe8efb02088452167": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/fmartinou/whats-up-docker/manifests/6.3.0": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/fmartinou/whats-up-docker/manifests/latest": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/fmartinou/whats-up-docker/manifests/sha256:65babe494ff97a9243de0d730b3914783d22c7abee890566c510bc63ec0a6ae6": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/fmartinou/whats-up-docker/manifests/sha256:dd2f99b06963a1d25f68ce8a7fab1d23a0fb4dbda691118a7dcb662fd7f0b395": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/fmartinou/whats-up-docker/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/homeassistant/home-assistant/blobs/sha256:1877dba81e07e2073b708135056c590002564cc32b3bb937e92f934e7f03cabb": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/homeassistant/home-assistant/manifests/2024.4.3": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/homeassistant/home-assistant/manifests/latest": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/homeassistant/home-assistant/manifests/sha256:4f86df601650c74b8689f1be033054ff09567db5dba5bf227ccc406ca4fa88d0": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/homeassistant/home-assistant/manifests/sha256:9769542a11b1500a7ff2289a8c891795c4c7238b9aa37618f6e152270e94be82": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/homeassistant/home-assistant/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/joseluisq/static-web-server/blobs/sha256:165857aa76adfec55d64f9b501624b14b3ab0fa20d30fb5fec19bd37c3500b06": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/joseluisq/static-web-server/manifests/2.28.0": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/joseluisq/static-web-server/manifests/latest": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/joseluisq/static-web-server/manifests/sha256:4490c3bf1d985395670d1aacdd896599e45417ea4eaac25e6d1457170326b47d": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/joseluisq/static-web-server/manifests/sha256:542265a74fb2b492d8c869d373950a5528ab2ae78982da63f547619480fa839c": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/joseluisq/static-web-server/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/koenkk/zigbee2mqtt/blobs/sha256:f2536f88d76bf9a05d029e4e349b8f199f158e1bf53b59f3514d56f1c1cc95d3": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/koenkk/zigbee2mqtt/manifests/1.36.1": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/koenkk/zigbee2mqtt/manifests/latest": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/koenkk/zigbee2mqtt/manifests/sha256:0d2135b7f85483bee940a7de43f69cc181e17fa93ade074cf4bcc386729b671c": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/koenkk/zigbee2mqtt/manifests/sha256:32901c8b100ee4d04123eb714523a023ca4aba7946e504209c7d773d07f697b5": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/koenkk/zigbee2mqtt/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/library/eclipse-mosquitto/manifests/2.0.18": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/library/eclipse-mosquitto/manifests/sha256:cb3afd02611b0c58b328196ab00de0158322b4c1e014841fb182d2a0ea3a79b9": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/library/eclipse-mosquitto/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/library/influxdb/manifests/2.7.6": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/library/influxdb/manifests/sha256:edb7c3b48eee5858282f1412d973ea8ed8dea7866dcc8ddfe97de6edb0edf801": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/library/influxdb/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/library/traefik/manifests/2.11.2": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/library/traefik/manifests/sha256:c6f6001dd1fc09fb0ae47ad2198102c40a8d9586c02d6040d561fd4fb7e91f45": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/library/traefik/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/nodered/node-red/blobs/sha256:146b0310a4750a627c48fb56fc0b992286fd094b761669ad37e4b09c27ac80f3": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/nodered/node-red/manifests/3.1.9-18-minimal": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/nodered/node-red/manifests/latest": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/nodered/node-red/manifests/sha256:4f7f84b8e8b8ad67cab30ce1283affe2b3f7cd6ccfb6fc260ad6290202430218": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/nodered/node-red/manifests/sha256:e17a5f2655cb3da9766f03e5a339a23034bd72450e21c0da5e0b36cf4d040f5f": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/nodered/node-red/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/portainer/portainer-ce/blobs/sha256:1a0fb356ea35830bad2a93aea5a72c88385b3505490cf035a575122bbe094a81": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/portainer/portainer-ce/manifests/2.20.1": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/portainer/portainer-ce/manifests/latest": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/portainer/portainer-ce/manifests/sha256:052939c971eb602a56665a6c6e2538dddb3ecdc6f0d0a5f324a4967a74d9c72c": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/portainer/portainer-ce/manifests/sha256:a5c79597ada24d6e9c4520d1b0bf7b5aa11ef48b362988828465373f256e4c84": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/portainer/portainer-ce/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/saspus/duplicacy-web/blobs/sha256:69346453e68601a5885251589bef309cfaa28a6c38df4acc4bbeb6672ec449d6": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/saspus/duplicacy-web/manifests/latest": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/saspus/duplicacy-web/manifests/sha256:9ff7a9fcbae9e63b2df45e6c43d92c88dc948c0cf79dbacfdb63d553e9da3485": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/saspus/duplicacy-web/manifests/sha256:da97a4cc8d4d8209023313a26731ca9fab1d408bd2f0f878d5db9c87d213230d": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/saspus/duplicacy-web/manifests/v1.8.0": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/saspus/duplicacy-web/tags/list": {
           "GET": {"200": 1, "401": 1}
         },
         "https://index.docker.io/v2/spx01/blocky/manifests/sha256:ba17812054a15b58ac80772afe404e7caa1da8c972f0c9ff7754eb3924fd5f57": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/spx01/blocky/manifests/v0.22": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/tecnativa/docker-socket-proxy/blobs/sha256:1c2d38fdda509f54a0e76ccb839b7b8f48d8df86d50a67882a8e0e38796c92d3": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/tecnativa/docker-socket-proxy/manifests/0.1.2": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/tecnativa/docker-socket-proxy/manifests/latest": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/tecnativa/docker-socket-proxy/manifests/sha256:7be95df49f3f07dc6b0840ed97162816ae0631a76048fa6960a99ba598bf6810": {
           "GET": {"200": 1}
         },
         "https://index.docker.io/v2/tecnativa/docker-socket-proxy/manifests/sha256:dc8ec925b1360c54e6bf350602d6faac4e33c5d8d809118e4c000c0b14a4529a": {
           "HEAD": {"200": 1}
         },
         "https://index.docker.io/v2/tecnativa/docker-socket-proxy/tags/list": {
           "GET": {"200": 1, "401": 1}
         }
       },
       "hosts": {
         "auth.docker.io": {
           "count": 14,
           "reqAvgMs": 748,
           "reqMedianMs": 666,
           "reqMaxMs": 955,
           "queueAvgMs": 0,
           "queueMedianMs": 0,
           "queueMaxMs": 1
         },
         "index.docker.io": {
           "count": 84,
           "reqAvgMs": 648,
           "reqMedianMs": 696,
           "reqMaxMs": 1431,
           "queueAvgMs": 0,
           "queueMedianMs": 0,
           "queueMaxMs": 1
         }
       },
       "requests": 98
DEBUG: HTTP cache statistics (repository=local)
DEBUG: Lookup statistics (repository=local)
       "docker": {"count": 14, "avgMs": 5270, "medianMs": 5691, "maxMs": 6911, "totalMs": 73779}
DEBUG: dns cache (repository=local)
       "hosts": []
 INFO: Repository finished (repository=local)
       "cloned": undefined,
       "durationMs": 18793
DEBUG: Checking file package cache for expired items
DEBUG: Deleted 0 of 76 file cached entries in 107ms
 INFO: Renovate is exiting with a non-zero code due to the following logged errors
       "loggerErrors": [
         {
           "name": "renovate",
           "level": 50,
           "logContext": "f54Vx40owJEoCww_-UaxU",
           "repository": "local",
           "err": {
             "message": "Cannot read properties of undefined (reading 'renovate/reconfigure')",
             "stack": "TypeError: Cannot read properties of undefined (reading 'renovate/reconfigure')\n    at getBranchCommit (/usr/local/renovate/lib/util/git/index.ts:504:30)\n    at validateReconfigureBranch (/usr/local/renovate/lib/workers/repository/reconfigure/index.ts:61:36)\n    at finalizeRepo (/usr/local/renovate/lib/workers/repository/finalize/index.ts:20:3)\n    at Object.renovateRepository (/usr/local/renovate/lib/workers/repository/index.ts:105:7)\n    at attributes.repository (/usr/local/renovate/lib/workers/global/index.ts:205:11)\n    at start (/usr/local/renovate/lib/workers/global/index.ts:190:7)\n    at /usr/local/renovate/lib/renovate.ts:18:22"
           },
           "msg": "Repository has unknown error"
         }
       ]
