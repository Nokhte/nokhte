// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'change_audio_playing_status_store.g.dart';

class ChangeAudioPlayingStatusStore = _ChangeAudioPlayingStatusStoreBase
    with _$ChangeAudioPlayingStatusStore;

abstract class _ChangeAudioPlayingStatusStoreBase extends Equatable with Store {
  @observable
  bool isPlaying = false;

  @observable
  StoreState state = StoreState.initial;

  final ChangeAudioPlayingStatusGetterStore getterStore;
  _ChangeAudioPlayingStatusStoreBase({required this.getterStore});

  void stateOrErrorUpdater(AudioPlayingStatusEntity result) {
    isPlaying = result.isSent;
  }

  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    final res = await getterStore(params);
    stateOrErrorUpdater(res);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [isPlaying];
}
