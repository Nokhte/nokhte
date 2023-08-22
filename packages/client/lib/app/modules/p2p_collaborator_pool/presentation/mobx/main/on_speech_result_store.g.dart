// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_speech_result_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnSpeechResultStore on _OnSpeechResultStoreBase, Store {
  late final _$speechResultAtom =
      Atom(name: '_OnSpeechResultStoreBase.speechResult', context: context);

  @override
  String get speechResult {
    _$speechResultAtom.reportRead();
    return super.speechResult;
  }

  @override
  set speechResult(String value) {
    _$speechResultAtom.reportWrite(value, super.speechResult, () {
      super.speechResult = value;
    });
  }

  late final _$_OnSpeechResultStoreBaseActionController =
      ActionController(name: '_OnSpeechResultStoreBase', context: context);

  @override
  dynamic setSpeechResult({required String result}) {
    final _$actionInfo = _$_OnSpeechResultStoreBaseActionController.startAction(
        name: '_OnSpeechResultStoreBase.setSpeechResult');
    try {
      return super.setSpeechResult(result: result);
    } finally {
      _$_OnSpeechResultStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
speechResult: ${speechResult}
    ''';
  }
}
