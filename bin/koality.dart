import 'dart:io';

import 'package:koality_tools/src/command_runner.dart';
import 'package:riverpod/riverpod.dart';

typedef VoidCallback = void Function();

Future<void> main(List<String> args) async {
  final container = ProviderContainer();
  await _flushThenExit(await KoalityToolsCommandRunner(container: container).run(args), container.dispose);
}

/// Flushes the stdout and stderr streams, then exits the program with the given
/// status code.
///
/// This returns a Future that will never complete, since the program will have
/// exited already. This is useful to prevent Future chains from proceeding
/// after you've decided to exit.
Future<void> _flushThenExit(int status, VoidCallback cleanupFunction) async {
  return Future.wait<void>([
    stdout.close(),
    stderr.close(),
  ]).then<void>((_) => cleanup(status, cleanupFunction));
}

// Calls cleanup function and then exits.
void cleanup(int status, VoidCallback cleanupFunction) {
  cleanupFunction.call();
  exit(status);
}
