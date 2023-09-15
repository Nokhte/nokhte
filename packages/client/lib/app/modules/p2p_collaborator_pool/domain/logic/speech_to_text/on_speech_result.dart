import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class OnSpeechResult {
  final OnSpeechResultStore speechResultStore;

  OnSpeechResult({required this.speechResultStore});

  call(SpeechRecognitionResult params) {
    final collaboratorPhrase = params.recognizedWords;
    speechResultStore.addSpeechResult(collaboratorPhrase);
  }
}
// shit still not working I think it's adding empty strings
// i think it would be better to get rid of the final result
// and have an inprogress bool of some sort, but idk isn't that
// waht final result already does??