// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_session_metadata_stream_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CancelSessionMetadataStreamStore
    on _CancelSessionMetadataSreamStoreBase, Store {
  late final _$isListeningAtom = Atom(
      name: '_CancelSessionMetadataSreamStoreBase.isListening',
      context: context);

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

  late final _$callAsyncAction = AsyncAction(
      '_CancelSessionMetadataSreamStoreBase.call',
      context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isListening: ${isListening}
    ''';
  }
}
