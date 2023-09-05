import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

// Mysql commands.
import 'package:koality_tools/src/commands/mysql/commands/create/myslq_create_command.dart';

/// {@template mysql_command}
///
/// `koality mysql [command]`
/// A [Command] for working with MySQL/MariaDB from the command line.
/// {@endtemplate}
class MysqlCommand extends Command<int> {
  /// {@macro mysql_command}
  MysqlCommand({
    required Logger logger,
  }) {
    addSubcommand(MysqlCreateCommand(logger: logger));
  }

  @override
  String get description => 'A command for handling MySQL stuff.';

  @override
  String get name => 'mysql';

  @override
  String get invocation => 'koality mysql <subcommand> [arguments]';
}
