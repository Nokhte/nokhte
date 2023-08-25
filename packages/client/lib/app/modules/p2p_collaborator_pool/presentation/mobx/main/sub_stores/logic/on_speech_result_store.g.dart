// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_speech_result_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnSpeechResultStore on _OnSpeechResultStoreBase, Store {
  late final _$currentPhraseIndexAtom = Atom(
      name: '_OnSpeechResultStoreBase.currentPhraseIndex', context: context);

  @override
  int get currentPhraseIndex {
    _$currentPhraseIndexAtom.reportRead();
    return super.currentPhraseIndex;
  }

  @override
  set currentPhraseIndex(int value) {
    _$currentPhraseIndexAtom.reportWrite(value, super.currentPhraseIndex, () {
      super.currentPhraseIndex = value;
    });
  }

  late final _$currentSpeechResultAtom = Atom(
      name: '_OnSpeechResultStoreBase.currentSpeechResult', context: context);

  @override
  String get currentSpeechResult {
    _$currentSpeechResultAtom.reportRead();
    return super.currentSpeechResult;
  }

  @override
  set currentSpeechResult(String value) {
    _$currentSpeechResultAtom.reportWrite(value, super.currentSpeechResult, () {
      super.currentSpeechResult = value;
    });
  }

  late final _$_OnSpeechResultStoreBaseActionController =
      ActionController(name: '_OnSpeechResultStoreBase', context: context);

  @override
  dynamic addSpeechResult({required String result}) {
    final _$actionInfo = _$_OnSpeechResultStoreBaseActionController.startAction(
        name: '_OnSpeechResultStoreBase.addSpeechResult');
    try {
      return super.addSpeechResult(result: result);
    } finally {
      _$_OnSpeechResultStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPhraseIndex: ${currentPhraseIndex},
currentSpeechResult: ${currentSpeechResult}
    ''';
  }
}
