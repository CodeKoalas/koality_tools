import 'dart:convert';
import 'dart:math';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template jwt_command}
///
/// `koality jwt`
/// A [Command] that creates a base64 encoded secure key that can be used for signing JWT keys.
/// {@endtemplate}
class JwtCommand extends Command<int> {
  /// {@macro jwt_command}
  JwtCommand({
    required Logger logger,
  }) : _logger = logger;

  @override
  String get description => 'A command that generates a JWT ready secret.';

  @override
  String get name => 'jwt';

  final Logger _logger;

  @override
  Future<int> run() async {
    _logger.info('Creating JWT secret key...');

    final random = Random.secure();
    final values = List<int>.generate(64, (i) => random.nextInt(256));

    _logger.write(base64UrlEncode(values));
    return ExitCode.success.code;
  }
}
