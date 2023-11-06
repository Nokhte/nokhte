// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_perspectives_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCurrentPerspectivesStore on _GetCurrentPerspectivesStoreBase, Store {
  late final _$currentPerspectivesAtom = Atom(
      name: '_GetCurrentPerspectivesStoreBase.currentPerspectives',
      context: context);

  @override
  ObservableList<String> get currentPerspectives {
    _$currentPerspectivesAtom.reportRead();
    return super.currentPerspectives;
  }

  @override
  set currentPerspectives(ObservableList<String> value) {
    _$currentPerspectivesAtom.reportWrite(value, super.currentPerspectives, () {
      super.currentPerspectives = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_GetCurrentPerspectivesStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<CurrentPerspectivesEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<CurrentPerspectivesEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetCurrentPerspectivesStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
currentPerspectives: ${currentPerspectives},
futureStore: ${futureStore}
    ''';
  }
}
