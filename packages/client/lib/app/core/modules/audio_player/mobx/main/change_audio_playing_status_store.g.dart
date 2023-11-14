// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_audio_playing_status_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangeAudioPlayingStatusStore
    on _ChangeAudioPlayingStatusStoreBase, Store {
  late final _$isPlayingAtom = Atom(
      name: '_ChangeAudioPlayingStatusStoreBase.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_ChangeAudioPlayingStatusStoreBase.state', context: context);

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$onCompletedStreamAtom = Atom(
      name: '_ChangeAudioPlayingStatusStoreBase.onCompletedStream',
      context: context);

  @override
  ObservableStream<dynamic> get onCompletedStream {
    _$onCompletedStreamAtom.reportRead();
    return super.onCompletedStream;
  }

  @override
  set onCompletedStream(ObservableStream<dynamic> value) {
    _$onCompletedStreamAtom.reportWrite(value, super.onCompletedStream, () {
      super.onCompletedStream = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_ChangeAudioPlayingStatusStoreBase.call', context: context);

  @override
  Future<void> call(ChangeAudioPlayingStatusParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
state: ${state},
onCompletedStream: ${onCompletedStream}
    ''';
  }
}
