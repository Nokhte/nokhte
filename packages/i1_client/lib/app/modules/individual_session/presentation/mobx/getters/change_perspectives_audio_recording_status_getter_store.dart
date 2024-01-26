// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
part 'change_perspectives_audio_recording_status_getter_store.g.dart';

class ChangePerspectivesAudioRecordingStatusGetterStore = _ChangePerspectivesAudioRecordingStatusGetterStoreBase
    with _$ChangePerspectivesAudioRecordingStatusGetterStore;

abstract class _ChangePerspectivesAudioRecordingStatusGetterStoreBase
    extends Equatable with Store {
  final ChangePerspectivesAudioRecordingStatus logic;

  _ChangePerspectivesAudioRecordingStatusGetterStoreBase({
    required this.logic,
  });

  Future<PerspectivesAudioRecordingStatusEntity> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
