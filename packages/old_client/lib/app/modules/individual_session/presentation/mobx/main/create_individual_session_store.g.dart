// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_individual_session_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateIndividualSessionStore
    on _CreateIndividualSessionStoreBase, Store {
  late final _$sessionTimestampAtom = Atom(
      name: '_CreateIndividualSessionStoreBase.sessionTimestamp',
      context: context);

  @override
  DateTime get sessionTimestamp {
    _$sessionTimestampAtom.reportRead();
    return super.sessionTimestamp;
  }

  @override
  set sessionTimestamp(DateTime value) {
    _$sessionTimestampAtom.reportWrite(value, super.sessionTimestamp, () {
      super.sessionTimestamp = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_CreateIndividualSessionStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<IndividualSessionCreationEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<IndividualSessionCreationEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_CreateIndividualSessionStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
sessionTimestamp: ${sessionTimestamp},
futureStore: ${futureStore}
    ''';
  }
}
