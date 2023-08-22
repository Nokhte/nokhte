import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/main/on_speech_result_store.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class OnSpeechResult {
  final OnSpeechResultStore speechResultStore;

  OnSpeechResult({required this.speechResultStore});

  // @override
  void call(SpeechRecognitionResult params) {
    /// * TODO we are probably missing some error handling queues here, so come
    /// * back if it flips out later
    final collaboratorPhrase = params.recognizedWords;
    speechResultStore.setSpeechResult(result: collaboratorPhrase);
  }
}
