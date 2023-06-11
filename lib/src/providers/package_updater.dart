import 'package:dio/dio.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:koality_tools/src/services/updater.dart';
import 'package:koality_tools/src/providers/config.dart';

part 'package_updater.g.dart';

@riverpod
Future<PackageUpdater> getPackageUpdater(GetPackageUpdaterRef ref, {required Logger logger}) async {
  final config = await ref.watch(getKoalityConfigProvider(logger: logger).future);
  final client = Dio(
    BaseOptions(
      baseUrl: 'https://gitlab.codekoalas.com',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'PRIVATE-TOKEN': config.gitlabAccessToken,
      },
    ),
  );
  return PackageUpdater(client: client);
}
