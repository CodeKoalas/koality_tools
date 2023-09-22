/// A simple data struct for installing a package.
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:koality_tools/src/utilities.dart';

part 'package_install.freezed.dart';

@freezed
class PackageInstallStruct with _$PackageInstallStruct {
  const PackageInstallStruct._();
  const factory PackageInstallStruct({
    required String packageName,
    required String commandName,
    required PackageTool tool,
  }) = _PackageInstallStruct;
}
