// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'on_speech_result_store.g.dart';

class OnSpeechResultStore = _OnSpeechResultStoreBase with _$OnSpeechResultStore;

abstract class _OnSpeechResultStoreBase extends Equatable with Store {
  @observable
  int currentPhraseIndex = 0;
  @observable
  String currentSpeechResult = "";

  @action
  addSpeechResult(String result) {
    currentSpeechResult = result.toLowerCase();
  }

  @override
  List<Object> get props => [];
}
