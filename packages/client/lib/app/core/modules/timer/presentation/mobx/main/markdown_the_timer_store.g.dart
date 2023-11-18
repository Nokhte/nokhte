// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markdown_the_timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MarkdownTheTimerStore on _MarkdownTheTimerStoreBase, Store {
  late final _$isMarkedDownAtom =
      Atom(name: '_MarkdownTheTimerStoreBase.isMarkedDown', context: context);

  @override
  bool get isMarkedDown {
    _$isMarkedDownAtom.reportRead();
    return super.isMarkedDown;
  }

  @override
  set isMarkedDown(bool value) {
    _$isMarkedDownAtom.reportWrite(value, super.isMarkedDown, () {
      super.isMarkedDown = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_MarkdownTheTimerStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<TimerMarkdownStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<TimerMarkdownStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_MarkdownTheTimerStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isMarkedDown: ${isMarkedDown},
futureStore: ${futureStore}
    ''';
  }
}
