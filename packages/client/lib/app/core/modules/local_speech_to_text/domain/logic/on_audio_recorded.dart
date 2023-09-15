import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';

class OnAudioRecorded {
  final OnAudioRecordedStore onAudioRecordedStore;

  OnAudioRecorded({required this.onAudioRecordedStore});

  call(LeopardCallbackParams params) async =>
      await onAudioRecordedStore(params);
}
