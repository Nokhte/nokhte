import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:leopard_flutter/leopard.dart';
import 'package:leopard_flutter/leopard_error.dart';
import 'package:leopard_flutter/leopard_transcript.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:nokhte/app/core/utilities/utilities.dart';

abstract class LocalSpeechToTextRemoteSource {
  Future<bool> initLeopard();
  Future<List<LeopardWord>> processAudio(File recordedFile);
  Future<List<LeopardWord>> stopRecording();
  Future<RecordingStatus> startRecording();
}

class LocalSpeechToTextRemoteSourceImpl
    implements LocalSpeechToTextRemoteSource {
  final OnAudioRecorded onAudioRecorded;

  LocalSpeechToTextRemoteSourceImpl({
    required this.onAudioRecorded,
  });

  late Leopard leopard;
  late MicRecorder micRecorder;

  @override
  Future<bool> initLeopard() async {
    try {
      final accessKey = dotenv.env["LEOPARD_ACCESS_KEY"] ?? '';
      final modelPath = dotenv.env["LEOPARD_MODEL_PATH"] ?? '';
      leopard = await Leopard.create(accessKey, modelPath);
      micRecorder = await MicRecorder.create(
        leopard.sampleRate,
        (length) => onAudioRecorded(Right(length)),
        (error) => onAudioRecorded(Left(error)),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<LeopardWord>> processAudio(File recordedFile) async {
    final result = await leopard.processFile(recordedFile.path);
    final words = result.words;
    return words;
  }

  @override
  Future<List<LeopardWord>> stopRecording() async {
    File recordedFile = await micRecorder.stopRecord();
    return await processAudio(recordedFile);
  }

  @override
  Future<RecordingStatus> startRecording() async {
    try {
      await micRecorder.startRecord();
      return RecordingStatus.started;
    } on LeopardException catch (ex) {
      onAudioRecorded(Left(ex));
      return RecordingStatus.error;
    }
  }
}
