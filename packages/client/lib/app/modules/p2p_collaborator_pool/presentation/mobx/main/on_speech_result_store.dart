// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'on_speech_result_store.g.dart';

class OnSpeechResultStore = _OnSpeechResultStoreBase with _$OnSpeechResultStore;

abstract class _OnSpeechResultStoreBase extends Equatable with Store {
  @observable
  String speechResult = "";

  @action
  setSpeechResult({required String result}) => speechResult = result;

  @override
  List<Object> get props => [];
}

/// so how is this injection scheme supposed to work exactly, let's say you have this all injected beforehand it still needs access