import 'dart:io';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

abstract class RecordingRemoteSource {
  Future<bool> startRecording(String path);
  Future<File> stopRecording();
}

class RecordingRemoteSourceImpl implements RecordingRemoteSource {
  final AudioRecorder recorder;

  RecordingRemoteSourceImpl({
    required this.recorder,
  });
  @override
  startRecording(fileName) async {
    final path = "${(await getTemporaryDirectory()).path}/$fileName.wav";
    await recorder.start(
      const RecordConfig(encoder: AudioEncoder.wav),
      path: path,
    );
    return true;
  }

  @override
  stopRecording() async {
    final path = await recorder.stop();
    final file = File(path as String);
    return file;
  }
}
