// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'change_audio_playing_status_getter_store.g.dart';

class ChangeAudioPlayingStatusGetterStore = _ChangeAudioPlayingStatusGetterStoreBase
    with _$ChangeAudioPlayingStatusGetterStore;

abstract class _ChangeAudioPlayingStatusGetterStoreBase extends Equatable
    with Store {
  final ChangeAudioPlayingStatus logic;

  _ChangeAudioPlayingStatusGetterStoreBase({
    required this.logic,
  });

  Future<AudioPlayingStatusEntity> call(
          ChangeAudioPlayingStatusParams params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
