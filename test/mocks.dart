import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_updater/pub_updater.dart';

class MockLogger extends Mock implements Logger {}

class MockProgress extends Mock implements Progress {}

class MockUpdater extends Mock implements PubUpdater {}
