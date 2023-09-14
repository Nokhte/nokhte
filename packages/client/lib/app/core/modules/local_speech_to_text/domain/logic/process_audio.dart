import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/contracts/local_speech_to_text_contract.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';

class ProcessAudio
    implements AbstractFutureLogic<AudioProcessingEntity, ProcessAudioParams> {
  final LocalSpeechToTextContract contract;

  ProcessAudio({required this.contract});

  @override
  call(params) async => await contract.processAudio(params);
}

class ProcessAudioParams extends Equatable {
  final File recordedFile;

  const ProcessAudioParams({required this.recordedFile});

  @override
  List<Object> get props => [recordedFile];
}
