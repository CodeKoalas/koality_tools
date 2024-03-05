# Creating a new release.
1. Update `pubspec.yaml` file version. Typically a minor version bump unless breaking changes are needed.
2. Make sure to run `dart run build_runner build` which populates the `version.dart` file for the pub updater package.
3. Update `CHANGELOG.md` with the changes.
4. Update `README.md` with some example uses and a heading for the commands and what they do.
5. Commit and push up code.
6. Create git tag like `git tag -a 0.5.2 -m "Version 0.5.2"` and then `git push --tags`.
7. Run `dart pub lish`