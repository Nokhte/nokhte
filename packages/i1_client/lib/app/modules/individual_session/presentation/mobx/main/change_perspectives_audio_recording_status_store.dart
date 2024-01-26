// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
import 'package:nokhte/app/modules/individual_session/types/types.dart';
part 'change_perspectives_audio_recording_status_store.g.dart';

class ChangePerspectivesAudioRecordingStatusStore = _ChangePerspectivesAudioRecordingStatusStoreBase
    with _$ChangePerspectivesAudioRecordingStatusStore;

abstract class _ChangePerspectivesAudioRecordingStatusStoreBase
    extends Equatable with Store {
  @observable
  PerspectivesAudioRecordingStatus recordingStatus =
      PerspectivesAudioRecordingStatus.idle;

  @observable
  File returnFile = File('');

  @observable
  StoreState state = StoreState.initial;

  final ChangePerspectivesAudioRecordingStatusGetterStore getterStore;
  _ChangePerspectivesAudioRecordingStatusStoreBase({required this.getterStore});

  void stateOrErrorUpdater(PerspectivesAudioRecordingStatusEntity result) {
    recordingStatus = result.recordingStatus;
    returnFile = result.returnFile;
  }

  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    final res = await getterStore(params);
    stateOrErrorUpdater(res);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
