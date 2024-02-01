// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_session_metadata_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetSessionMetadataStore on _GetSessionMetadataStoreBase, Store {
  late final _$timerShouldRunAtom = Atom(
      name: '_GetSessionMetadataStoreBase.timerShouldRun', context: context);

  @override
  bool get timerShouldRun {
    _$timerShouldRunAtom.reportRead();
    return super.timerShouldRun;
  }

  @override
  set timerShouldRun(bool value) {
    _$timerShouldRunAtom.reportWrite(value, super.timerShouldRun, () {
      super.timerShouldRun = value;
    });
  }

  late final _$getAsyncAction =
      AsyncAction('_GetSessionMetadataStoreBase.get', context: context);

  @override
  Future<void> get(dynamic params) {
    return _$getAsyncAction.run(() => super.get(params));
  }

  @override
  String toString() {
    return '''
timerShouldRun: ${timerShouldRun}
    ''';
  }
}
