import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';

// Updater is not exported from the package, so we need to import it directly.
import 'package:koality_tools/src/services/updater.dart';

class MockLogger extends Mock implements Logger {}

class MockProgress extends Mock implements Progress {}

class MockUpdater extends Mock implements PackageUpdater {}
