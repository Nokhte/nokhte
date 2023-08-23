// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'on_speech_result_store.g.dart';

class OnSpeechResultStore = _OnSpeechResultStoreBase with _$OnSpeechResultStore;

abstract class _OnSpeechResultStoreBase extends Equatable with Store {
  // @observable
  // List<String> speechResults = [];

  @observable
  bool isInTheMiddleOfTheirPhrase = false;

  @observable
  int numberOfWords = 0;

  // this should be regulated in some way with a speech in progress enum
  // this is only a temporary stand in solution this is not nearly as
  // robust as it needs to be it should be able to let people know that
  // phrases are only two words and display that they need to re-record

  @observable
  int currentPhraseIndex = 1;

  // @observable
  // int pastSpeechResultIndex = 0;

  @observable
  String currentSpeechResult = "";

  /// the problem with this code is that it adds a new index
  /// with each word, which is a problem?
  // @action
  // addSpeechResult({required String result}) {
  //   print("WHATS HAPPENING IN THE STORE? $result");
  //   speechResults.add(result);
  //   currentSpeechResultIndex++;
  //   currentSpeechResultIndex == 1 ? null : pastSpeechResultIndex++;
  //   currentSpeechResult = speechResults[currentSpeechResultIndex];
  // }
  // called under the hood
  @action
  addSpeechResult({required String result}) {
    currentSpeechResult = result;

    // if (numberOfWords % 2 == 0) currentPhraseIndex++;
  }

  @override
  List<Object> get props => [];
}
