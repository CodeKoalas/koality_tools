import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

// Subcommands.
import 'package:koality_tools/src/commands/mysql/commands/create/commands/mysql_create_database_command.dart';

/// {@template mysql_create_command}
///
/// `koality mysql create [command]`
/// A [Command] to do stuff related to MySQL/MariaDB and creating stuff
/// {@endtemplate}
class MysqlCreateCommand extends Command<int> {
  /// {@macro mysql_create_command}
  MysqlCreateCommand({
    required Logger logger,
  }) {
    addSubcommand(MysqlCreateDatabaseCommand(logger: logger));
  }

  @override
  String get description => 'A command for handling creating MySQL stuff.';

  @override
  String get name => 'create';

  @override
  String get invocation => 'koality mysql create [subcommand]';
}
