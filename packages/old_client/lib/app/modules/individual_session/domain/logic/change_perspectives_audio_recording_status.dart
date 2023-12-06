import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/types/types.dart';

class ChangePerspectivesAudioRecordingStatus
    implements
        AbstractNoFailureAsyncLogic<PerspectivesAudioRecordingStatusEntity,
            ChangePerspectivesAudioRecordingStatusParams> {
  final IndividualSessionContract contract;

  ChangePerspectivesAudioRecordingStatus({required this.contract});

  @override
  call(params) async =>
      await contract.changePerspectivesAudioRecordingStatus(params);
}

class ChangePerspectivesAudioRecordingStatusParams extends Equatable {
  final PerspectivesAudioRecordingActions recordingAction;
  final String thePath;
  const ChangePerspectivesAudioRecordingStatusParams({
    required this.recordingAction,
    required this.thePath,
  });

  @override
  List<Object> get props => [recordingAction, thePath];
}
