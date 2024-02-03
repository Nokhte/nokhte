import 'dart:io';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

abstract class RecordingRemoteSource {
  Future<bool> startRecording(String path);
  Future<File> stopRecording();
}
