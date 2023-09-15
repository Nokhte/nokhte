// ignore_for_file: library_private_types_in_public_api, must_be_immutable, curly_braces_in_flow_control_structures

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:leopard_flutter/leopard_error.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart';
// * Mobx Codegen Inclusion
part 'on_audio_recorded_store.g.dart';

class OnAudioRecordedStore = _OnAudioRecordedStoreBase
    with _$OnAudioRecordedStore;

abstract class _OnAudioRecordedStoreBase extends Equatable with Store {
  // so the logic
  final double maxRecordingLength = 10;

  @observable
  double recordedLength = 0.0;

  @observable
  bool isTranscribing = false;

  @observable
  String errorMeessage = "";

  @action
  call(LeopardCallbackParams res) {
    res.fold((failure) {
      errorMeessage = failure.message ?? '';
    }, (length) {
      if (length < maxRecordingLength) {
        recordedLength = length;
      } else {
        isTranscribing = true;
      }
    });
  }

  @action
  setBackToDefaults() {
    recordedLength = 0.0;
    isTranscribing = false;
  }

  @override
  List<Object> get props => [];
}
