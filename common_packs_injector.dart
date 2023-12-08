import 'dart:async';
import 'dart:io' show Directory, File;

import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

Future<bool> _isJustAFlutterOrDartProject(Directory folder) async {
  var pubspecFile = File(p.join(folder.path, 'pubspec.yaml'));
  return await pubspecFile.exists();
}

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
  folders.removeAt(0); // exclude nokhte core
  completer.complete(folders);
  return completer.future;
}

Future updateDependencies(
    YamlMap commonDependencies, List<Directory> folders) async {
  for (var projectDir in folders) {
    final pubspecPath = File(p.join(projectDir.path, 'pubspec.yaml'));
    final yamlStr = await pubspecPath.readAsString();
    final editable = YamlEditor(yamlStr);

    for (var depEntry in commonDependencies.entries) {
      final depType = depEntry.key;
      final depData = depEntry.value;

      for (var dep in depData.entries) {
        final targetDependency = dep.key;
        final targetValue = dep.value;

        editable.update([depType, targetDependency], targetValue);
      }
    }

    await pubspecPath.writeAsString(editable.toString());
  }
}

Future<void> main() async {
  final commonPackagesYamlPath =
      p.join(Directory.current.path, 'common_packs.yaml');
  final commonPackagesYaml = File(commonPackagesYamlPath);
  final commonPackages =
      loadYaml(await commonPackagesYaml.readAsString()) as YamlMap;

  final packagesPath = p.join(Directory.current.path, 'packages');
  final packageDirs = await getSubfolder(Directory(packagesPath));
  await updateDependencies(commonPackages, packageDirs);
}
