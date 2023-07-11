import 'dart:convert';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaml/yaml.dart';

part 'package_pubpsec.g.dart';

@riverpod
Future<Map<String, dynamic>> getPackagePubspec(GetPackagePubspecRef ref, {required String path}) async {
  late final File file;
  if (FileSystemEntity.isDirectorySync(path)) {
    file = File('$path/pubspec.yaml');
  } else {
    file = File(path);
  }

  final contents = await file.readAsString();
  return json.decode(json.encode(loadYaml(contents))) as Map<String, dynamic>;
}
