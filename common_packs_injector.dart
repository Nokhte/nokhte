/// common_packs_injector.dart
///
/// Author: Sonny Vesali
/// This script reads a common_packs.yaml file and updates or adds dependencies
/// to all packages under the packages directory using effective Dart conventions.
///
/// The script defines several utility functions to achieve this functionality,
/// such as checking if a folder contains a Dart or Flutter project, retrieving
/// subfolders within a directory, and updating the dependencies in the
/// pubspec.yaml file of each package.
///
/// Usage:
/// 1. Create a common_packs.yaml file with the common dependencies defined.
/// 2. Run the script to apply the common dependencies to the packages.
///
/// Example common_packs.yaml:
/// ```
/// dependencies:
///   flutter:
///     sdk: flutter
///   http: ^0.13.3
///   provider: ^5.0.0
///   # Add more dependencies as needed...
/// ```
///
/// Note: Ensure you have the necessary packages 'path', 'yaml', and 'yaml_edit'
/// in your root pubspec.yaml file before running this script.

import 'dart:async';
import 'dart:io' show Directory, File;

import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

/// Checks if a folder contains a Dart or Flutter project by looking for a
/// pubspec.yaml file.
Future<bool> _isJustAFlutterOrDartProject(Directory folder) async {
  var pubspecFile = File(p.join(folder.path, 'pubspec.yaml'));
  return await pubspecFile.exists();
}

/// Retrieves all subfolders within a given directory, excluding non-directory
/// entities. Additionally, if a 'dart' subfolder exists within a directory,
/// it considers it as a Dart or Flutter project.
Future<List<Directory>> getSubfolder(Directory dir) async {
  var folders = <Directory>[];
  var completer = Completer<List<Directory>>();
  var lister = dir.list(recursive: false);
  await for (var entity in lister) {
    if (entity is! Directory) {
      continue;
    }
    var folder = entity;

    if (await _isJustAFlutterOrDartProject(folder)) {
      folders.add(folder);
    } else {
      var dartSubfolder = Directory(p.join(folder.path, 'dart'));
      if (dartSubfolder.existsSync()) {
        folders.add(dartSubfolder);
      }
    }
  }
  completer.complete(folders);
  return completer.future;
}

/// Updates the dependencies in the pubspec.yaml file of each package within the
/// provided list of folders based on the common dependencies defined in the
/// commonPackages map. The targetNode parameter indicates whether to update
/// 'dependencies' or 'dev_dependencies'.
Future update(YamlMap commonDependencies, List<Directory> folders,
    String targetNode) async {
  for (var x in folders) {
    final pubspecPath = File(p.joinAll([x.path, 'pubspec.yaml']));
    final yamlStr = await pubspecPath.readAsString();
    final editable = YamlEditor(yamlStr);
    for (var dep in commonDependencies.entries) {
      if (targetNode != dep.key) {
        return;
      }
      editable.update(
        [targetNode, dep.value.keys.toList()[0]],
        dep.value.values.toList()[0],
      );
      await pubspecPath.writeAsString(editable.toString());
      //
    }
  }
}

/// Main function that executes the common dependency injection process.
Future<void> main() async {
  final commonPackagesYamlPath =
      p.join(Directory.current.path, 'common_packs.yaml');
  final commonPackagesYaml = File(commonPackagesYamlPath);
  final commonPackages =
      loadYaml(await commonPackagesYaml.readAsString()) as YamlMap;

  final packagesPath = p.join(Directory.current.path, 'packages');
  final packageDirs = await getSubfolder(Directory(packagesPath));
  await update(commonPackages, packageDirs, 'dependencies');
  await update(commonPackages, packageDirs, 'dev_dependencies');
}
