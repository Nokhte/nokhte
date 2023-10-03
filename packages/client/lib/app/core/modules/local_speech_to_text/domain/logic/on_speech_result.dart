import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';

class OnSpeechResult {
  final OnSpeechResultStore speechResultStore;

  OnSpeechResult({required this.speechResultStore});

  call(params) {
    final collaboratorPhrase = params.recognizedWords;
    speechResultStore.addSpeechResult(collaboratorPhrase);
  }
}
