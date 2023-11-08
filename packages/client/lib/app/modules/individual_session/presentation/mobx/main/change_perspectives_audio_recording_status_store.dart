// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
import 'package:nokhte/app/modules/individual_session/types/types.dart';
// * Mobx Codegen Inclusion
part 'change_perspectives_audio_recording_status_store.g.dart';

class ChangePerspectivesAudioRecordingStatusStore = _ChangePerspectivesAudioRecordingStatusStoreBase
    with _$ChangePerspectivesAudioRecordingStatusStore;

abstract class _ChangePerspectivesAudioRecordingStatusStoreBase
    extends Equatable with Store {
  @observable
  PerspectivesAudioRecordingStatus recordingStatus =
      PerspectivesAudioRecordingStatus.idle;

  @observable
  StoreState state = StoreState.initial;

  final ChangePerspectivesAudioRecordingStatusGetterStore getterStore;
  _ChangePerspectivesAudioRecordingStatusStoreBase({required this.getterStore});

  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    await getterStore(params);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
