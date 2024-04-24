[0.8.0] - 24/04/2024
* Adding new `apple` command for handling Apple/iOS things.
* Adding new subcommand `required-apis` for the `apple` command to handle the new Required Reason APIs. It will search through Swift/Obj-C `*.m` files 
and report any used APIs that will require a reason to be listed for it's usage.

[0.7.2] - 25/03/2024
* Fixing issue with missing template files for new `wordpress` option.

[0.7.1] - 25/03/2024
* Adding new `wordpress` option for the `devops generate` command. Works for Koality Wordpress sites.

[0.7.0] - 04/03/2024
* Adding new `config` command with subcommands to handle updating config through the CLI instead of editing the JSON file.
* Adjusted the `devops generate` command to have an additional parameter in the cli for the container path.
* Improved the `devops generate` command to also handle scaffolding CI/CD variables and environments with Gitlab's Auto DevOps feature.

[0.6.7] - 04/03/2024
* Better error messaging for setup to make it clear what needs to happen.

[0.6.6] - 23/01/2024
* Updating the `devops generate` drupal template to use different default files path.

[0.6.5] - 11/01/2024
* Adding skeleton for Gitlab API feature to help with a new upcoming DevOps command.
* Updating test command to allow generating HTML coverage for multiple coverage files.

[0.6.4] - 21/11/2023
* Adjusting the way the templates are created to be simpler. Eventually replaced by mason bricks.

[0.6.3] - 21/11/2023
* The 1 out of 2 times a year that a rebase trips me up. Never registered the DevOps command runner.

[0.6.2] - 21/11/2023
* Fixing issue with `koality devops generate` not being registered correctly.

[0.6.1] - 16/11/2023
* Adding new `kubectl` subcommands: `cp` and `pods`.
  - `cp` runs `kubectl cp` under the hood with some opinionated defaults and direction (source treated as local by default)
  - `pods` just lists pods and matches passed text.

[0.6.0] - 26/10/2023
* Adding new `devops` command for some typical Koality DevOps processes.

[0.5.1] - 20/10/2023
* Bugfix for mismatched versions in release.

[0.5.0] - 20/10/2023
* Adding a new `drupal` command that currently just has the `lint` subcommand. Will add more commands soon!

[0.4.4] - 27/09/2023
* Fixing an isuse with `kubectl` commands and the way `.start()` works. Switched over to `.run` to allow `stderr` and `stdout` to be handled directly in the terminal session, rather than trying to run detached processes and handling those manually.

[0.4.3] - 22/09/2023
* Fixing installation issue with needing to run setup once.

[0.4.2] - 20/09/2023
* Fixing issue with kubectl commands throwing if they return empty lists. (i.e. nothing matches search term).

[0.4.1] - 04/09/2023
* Fixing README installation instructions.

[0.4.0] - 04/09/2023
* Adding the `mysql` command and it's subcommands.
* Cleanup internal docs.
* Small refactoring.
* Adding docs.

[0.3.4] - 01/09/2023
* Adding the `jwt` command.

[0.3.3] - 24/07/2023
* Adding `firebase setup` command.
* Adding `firebase emulators` command that will start the emulators.

[0.3.2] - 23/07/2023
* Adding classic pub updater to prep for pub.dev release.

[0.3.1] - 11/07/2023
* Adding new `kubectl logs` command to grab logs for a resource.

[0.3.0] - 22/06/2023
* Adding new `firebase` command with the `configure` subcommand.
* Adding new `scaffold` command from the Koality Scaffold tool. Merged into this tool.
* Adding new `refactor` command that will help rename imports from one name to another.

[0.2.1] - 11/06/2023
* Adding config manager to help with adding a Gitlab token during setup.

[0.2.0] - 09/06/2023
* Adding new `kubectl` commands for `exec` and `describe`.
* Added a `.koality_config.json` file to help setup for future configuration options.

[0.1.9] - 27/02/2023

* Adding new `parse` command with a `version` subcommand that will get the version
from a `pubspec.yaml` file.

[0.1.8] - 07/02/2023

* Adding new status to `kubectl clean-pods` command.
* Fixing an issue with the updater not correctly parsing the version string.

[0.1.7] - 24/01/2023

* Adding new `kubectl` command with subcommands.

[0.1.6] - 18/12/2022

* Update command was using wrong text search.

[0.1.5] - 18/12/2022

* Making update command actually work.

[0.1.4] - 18/12/2022

* Fixing some parameters names and README updates.

[0.1.3] - 17/12/2022

* Fixing upload command to allow specifying where the JSON file is created.

[0.1.2] - 17/12/2022

* Moved the POEditor commands to be sub commands of `poeditor`.

[0.1.1] - 16/12/2022

* Renamed executable to be just "koality".

[0.1.0] - 16/12/2022

* Added setup command to configure local tools.
