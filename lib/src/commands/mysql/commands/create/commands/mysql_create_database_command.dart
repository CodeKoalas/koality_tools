import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template mysql_create_database_command}
///
/// `koality mysql create database`
/// A [Command] to create a database with the proper use and priviledges our tools expect.
/// {@endtemplate}
class MysqlCreateDatabaseCommand extends Command<int> {
  /// {@macro mysql_create_database_command}
  MysqlCreateDatabaseCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser
      ..addOption('user', abbr: 'u', help: 'The user we are wanting to configure.', mandatory: true)
      ..addOption(
        'password',
        abbr: 'p',
        help: 'The password for the user we are wanting to configure.',
        mandatory: true,
      )
      ..addOption(
        'host',
        abbr: 'h',
        help: 'The host where the databases are. (Defaults to "localhost")',
        defaultsTo: 'localhost',
      )
      ..addOption(
        'database',
        abbr: 'd',
        help: 'The name of the database we are wanting to do this to.',
        mandatory: true,
      );
  }

  @override
  String get description => 'A command to create a database with expected priviledges and user for our projects.';

  @override
  String get name => 'database';

  final Logger _logger;

  @override
  Future<int> run() async {
    // Let's verify that we have the MySQL cli tool installed locally.
    final mysql = await Process.run('which', ['mysql']);
    if (mysql.exitCode != 0) {
      _logger.err('MySQL is not installed on your system. Please install it and try again.');
      return ExitCode.software.code;
    }

    // Now we need to make sure that we create a user with some of these things set:
    final user = argResults!['user'] as String;
    final password = argResults!['password'] as String;
    final host = argResults!['host'] as String;
    final databaseName = argResults!['database'] as String;
    _logger.info('Running mysql create database command');

    // We need to first create the database.
    final createDatabaseResult = await Process.run(
      'mysql',
      [
        '--host',
        host,
        '--execute',
        'CREATE DATABASE $databaseName;',
      ],
    );
    if (createDatabaseResult.exitCode != 0) {
      _logger.err('Failed to create database: ${createDatabaseResult.stderr}');
      // Let' see if the user wants to continue trying to create the user.
      final shouldContinue = _logger.prompt('Continue to try and create the user? (y/n)');
      if (shouldContinue.toLowerCase() != 'y') {
        return ExitCode.success.code;
      }
      return ExitCode.software.code;
    }

    // Now let's create the user.
    final createUserResult = await Process.run(
      'mysql',
      [
        '--host',
        host,
        '--execute',
        "CREATE USER '$user'@'%' IDENTIFIED BY '$password';",
      ],
    );
    if (createUserResult.exitCode != 0) {
      _logger.err('Failed to create user: ${createUserResult.stderr}');
      return ExitCode.software.code;
    }

    // Finally let's set privileges for this user on this database.
    final setPrivilegesResult = await Process.run(
      'mysql',
      [
        '--host',
        host,
        '--execute',
        "GRANT ALL on $databaseName.* TO '$user'@'%';",
      ],
    );
    if (setPrivilegesResult.exitCode != 0) {
      _logger.err('Failed to set priviledges: ${setPrivilegesResult.stderr}');
      return ExitCode.software.code;
    }

    return ExitCode.success.code;
  }
}
