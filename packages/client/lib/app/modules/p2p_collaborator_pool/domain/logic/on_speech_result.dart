import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/main/on_speech_result_store.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class OnSpeechResult {
  final OnSpeechResultStore speechResultStore;

  OnSpeechResult({required this.speechResultStore});

  // @override
  void call(SpeechRecognitionResult params) {
    final collaboratorPhrase = params.recognizedWords;
    speechResultStore.addSpeechResult(result: collaboratorPhrase);
  }
}
