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

    // Check if the folder is a standalone Dart project or contains a 'dart' subfolder
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

Future<void> main() async {
  final commonPackagesYamlPath =
      p.join(Directory.current.path, 'common_packs.yaml');
  final commonPackagesYaml = File(commonPackagesYamlPath);
  final commonPackages =
      loadYaml(await commonPackagesYaml.readAsString()) as YamlMap;

  final packagesPath = p.join(Directory.current.path, 'packages');
  final packageDirs = await getSubfolder(Directory(packagesPath));
  print('PACKAGE DIRS =======> $packageDirs');
  await update(commonPackages, packageDirs, 'dependencies');
  await update(commonPackages, packageDirs, 'dev_dependencies');
}
