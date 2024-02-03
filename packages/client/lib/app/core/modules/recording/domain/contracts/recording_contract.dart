import 'dart:io';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class RecordingContract {
  Future<bool> startRecording(String path);
  Future<File> stopRecording(NoParams params);
}
