import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class OnSpeechResult {
  final OnSpeechResultStore speechResultStore;

  OnSpeechResult({required this.speechResultStore});

  call(SpeechRecognitionResult params) {
    final collaboratorPhrase = params.recognizedWords;
    speechResultStore.addSpeechResult(collaboratorPhrase);
  }
}
