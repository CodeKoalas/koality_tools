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
