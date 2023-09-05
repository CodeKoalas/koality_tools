import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';

/// These search executors help collection functionality for searching for pods and other resources in 'kubectl'.
/// Each one override the built in `.call` method for Dart objects.
@freezed
class SearchPodsExecutor with _$SearchPodsExecutor {
  const SearchPodsExecutor._();
  const factory SearchPodsExecutor() = _SearchPodsExecutor;

  List<String> call(List<String> searchTerms, {String namespace = 'gitlab-managed-apps'}) {
    final podList = Process.runSync(
      'bash',
      ['-c', "kubectl get pod -n $namespace | awk '{print \$1}'"],
      runInShell: true,
    );
    final podListString = podList.stdout.toString();
    final newLines = podListString.split('\n');
    return newLines.where((element) {
      // Check to see if elements contains any of the values in searchTerms.
      return searchTerms.any((searchTerm) {
        return element.contains(searchTerm);
      });
    }).toList();
  }
}

@freezed
class SearchResourceExecutor with _$SearchResourceExecutor {
  const SearchResourceExecutor._();
  const factory SearchResourceExecutor() = _SearchResourceExecutor;

  List<String> call(List<String> searchTerms, {String namespace = 'gitlab-managed-apps', String element = 'pod'}) {
    final podList = Process.runSync(
      'bash',
      ['-c', "kubectl get $element -n $namespace | awk '{print \$1}'"],
      runInShell: true,
    );
    final podListString = podList.stdout.toString();
    final newLines = podListString.split('\n');
    return newLines.where((element) {
      // Check to see if elements contains any of the values in searchTerms.
      return searchTerms.any((searchTerm) {
        return element.contains(searchTerm);
      });
    }).toList();
  }
}
