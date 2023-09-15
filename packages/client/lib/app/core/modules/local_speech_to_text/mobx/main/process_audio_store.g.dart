// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_audio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProcessAudioStore on _ProcessAudioStoreBase, Store {
  late final _$resultingWordsAtom =
      Atom(name: '_ProcessAudioStoreBase.resultingWords', context: context);

  @override
  String get resultingWords {
    _$resultingWordsAtom.reportRead();
    return super.resultingWords;
  }

  @override
  set resultingWords(String value) {
    _$resultingWordsAtom.reportWrite(value, super.resultingWords, () {
      super.resultingWords = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_ProcessAudioStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<AudioProcessingEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<AudioProcessingEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_ProcessAudioStoreBase.call', context: context);

  @override
  Future<void> call(ProcessAudioParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
resultingWords: ${resultingWords},
futureStore: ${futureStore}
    ''';
  }
}
