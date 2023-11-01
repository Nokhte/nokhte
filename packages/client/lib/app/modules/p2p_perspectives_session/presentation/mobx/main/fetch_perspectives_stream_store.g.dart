// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_perspectives_stream_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FetchPerspectivesStreamStore
    on _FetchPerspectivesStreamStoreBase, Store {
  late final _$streamAtom =
      Atom(name: '_FetchPerspectivesStreamStoreBase.stream', context: context);

  @override
  ObservableStream<PerspectivesPositioning> get stream {
    _$streamAtom.reportRead();
    return super.stream;
  }

  @override
  set stream(ObservableStream<PerspectivesPositioning> value) {
    _$streamAtom.reportWrite(value, super.stream, () {
      super.stream = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_FetchPerspectivesStreamStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
stream: ${stream}
    ''';
  }
}
