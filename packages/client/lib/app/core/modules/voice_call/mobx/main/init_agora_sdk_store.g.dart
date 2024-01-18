// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_agora_sdk_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InitAgoraSdkStore on _InitAgoraSdkStoreBase, Store {
  late final _$rtcEngineAtom =
      Atom(name: '_InitAgoraSdkStoreBase.rtcEngine', context: context);

  @override
  RtcEngine get rtcEngine {
    _$rtcEngineAtom.reportRead();
    return super.rtcEngine;
  }

  @override
  set rtcEngine(RtcEngine value) {
    _$rtcEngineAtom.reportWrite(value, super.rtcEngine, () {
      super.rtcEngine = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_InitAgoraSdkStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
rtcEngine: ${rtcEngine}
    ''';
  }
}
