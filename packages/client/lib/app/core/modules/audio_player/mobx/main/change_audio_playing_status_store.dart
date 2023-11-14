// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/getters/get_player_completion_stream_getter_store.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';
part 'change_audio_playing_status_store.g.dart';

class ChangeAudioPlayingStatusStore = _ChangeAudioPlayingStatusStoreBase
    with _$ChangeAudioPlayingStatusStore;

abstract class _ChangeAudioPlayingStatusStoreBase extends Equatable with Store {
  @observable
  bool isPlaying = false;

  @observable
  StoreState state = StoreState.initial;

  @observable
  ObservableStream onCompletedStream = ObservableStream(const Stream.empty());

  final ChangeAudioPlayingStatusGetterStore getterStore;
  final GetPlayerCompletionStreamGetterStore streamGetterStore;
  _ChangeAudioPlayingStatusStoreBase({
    required this.getterStore,
    required this.streamGetterStore,
  }) {
    onCompletedStream = ObservableStream(streamGetterStore(NoParams()).stream);
    onCompletedStream.listen((value) {
      isPlaying = false;
    });
  }

  void stateOrErrorUpdater(AudioPlayingStatusEntity result) {
    isPlaying = result.isSent;
  }

  @action
  Future<void> call(ChangeAudioPlayingStatusParams params) async {
    if (params.startPlaying) {
      isPlaying = true;
    } else {
      isPlaying = false;
    }
    state = StoreState.loading;
    final res = await getterStore(params);
    stateOrErrorUpdater(res);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [isPlaying];
}
