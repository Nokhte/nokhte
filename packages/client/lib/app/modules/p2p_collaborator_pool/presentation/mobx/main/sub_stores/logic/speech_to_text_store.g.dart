// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speech_to_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpeechToTextStore on _SpeechToTextStoreBase, Store {
  late final _$isListeningAtom =
      Atom(name: '_SpeechToTextStoreBase.isListening', context: context);

  @override
  bool get isListening {
    _$isListeningAtom.reportRead();
    return super.isListening;
  }

  @override
  set isListening(bool value) {
    _$isListeningAtom.reportWrite(value, super.isListening, () {
      super.isListening = value;
    });
  }

  late final _$isAllowedAtom =
      Atom(name: '_SpeechToTextStoreBase.isAllowed', context: context);

  @override
  bool get isAllowed {
    _$isAllowedAtom.reportRead();
    return super.isAllowed;
  }

  @override
  set isAllowed(bool value) {
    _$isAllowedAtom.reportWrite(value, super.isAllowed, () {
      super.isAllowed = value;
    });
  }

  late final _$stopListeningFutureStoreAtom = Atom(
      name: '_SpeechToTextStoreBase.stopListeningFutureStore',
      context: context);

  @override
  BaseFutureStore<ListeningStatusEntity> get stopListeningFutureStore {
    _$stopListeningFutureStoreAtom.reportRead();
    return super.stopListeningFutureStore;
  }

  @override
  set stopListeningFutureStore(BaseFutureStore<ListeningStatusEntity> value) {
    _$stopListeningFutureStoreAtom
        .reportWrite(value, super.stopListeningFutureStore, () {
      super.stopListeningFutureStore = value;
    });
  }

  late final _$startListeningFutureStoreAtom = Atom(
      name: '_SpeechToTextStoreBase.startListeningFutureStore',
      context: context);

  @override
  BaseFutureStore<ListeningStatusEntity> get startListeningFutureStore {
    _$startListeningFutureStoreAtom.reportRead();
    return super.startListeningFutureStore;
  }

  @override
  set startListeningFutureStore(BaseFutureStore<ListeningStatusEntity> value) {
    _$startListeningFutureStoreAtom
        .reportWrite(value, super.startListeningFutureStore, () {
      super.startListeningFutureStore = value;
    });
  }

  late final _$speechToTextInitFutureStoreAtom = Atom(
      name: '_SpeechToTextStoreBase.speechToTextInitFutureStore',
      context: context);

  @override
  BaseFutureStore<SpeechToTextInitializerStatusEntity>
      get speechToTextInitFutureStore {
    _$speechToTextInitFutureStoreAtom.reportRead();
    return super.speechToTextInitFutureStore;
  }

  @override
  set speechToTextInitFutureStore(
      BaseFutureStore<SpeechToTextInitializerStatusEntity> value) {
    _$speechToTextInitFutureStoreAtom
        .reportWrite(value, super.speechToTextInitFutureStore, () {
      super.speechToTextInitFutureStore = value;
    });
  }

  late final _$initSpeechAsyncAction =
      AsyncAction('_SpeechToTextStoreBase.initSpeech', context: context);

  @override
  Future<void> initSpeech() {
    return _$initSpeechAsyncAction.run(() => super.initSpeech());
  }

  late final _$startListeningAsyncAction =
      AsyncAction('_SpeechToTextStoreBase.startListening', context: context);

  @override
  Future<void> startListening() {
    return _$startListeningAsyncAction.run(() => super.startListening());
  }

  late final _$stopListeningAsyncAction =
      AsyncAction('_SpeechToTextStoreBase.stopListening', context: context);

  @override
  Future<void> stopListening() {
    return _$stopListeningAsyncAction.run(() => super.stopListening());
  }

  @override
  String toString() {
    return '''
isListening: ${isListening},
isAllowed: ${isAllowed},
stopListeningFutureStore: ${stopListeningFutureStore},
startListeningFutureStore: ${startListeningFutureStore},
speechToTextInitFutureStore: ${speechToTextInitFutureStore}
    ''';
  }
}
