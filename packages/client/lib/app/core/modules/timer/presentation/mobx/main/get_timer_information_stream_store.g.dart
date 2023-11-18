// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_timer_information_stream_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetTimerInformationStreamStore
    on _GetTimerInformationStreamStoreBase, Store {
  late final _$timerInformationStreamAtom = Atom(
      name: '_GetTimerInformationStreamStoreBase.timerInformationStream',
      context: context);

  @override
  ObservableStream<PresenceAndTimeRemaining> get timerInformationStream {
    _$timerInformationStreamAtom.reportRead();
    return super.timerInformationStream;
  }

  @override
  set timerInformationStream(ObservableStream<PresenceAndTimeRemaining> value) {
    _$timerInformationStreamAtom
        .reportWrite(value, super.timerInformationStream, () {
      super.timerInformationStream = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetTimerInformationStreamStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
timerInformationStream: ${timerInformationStream}
    ''';
  }
}
