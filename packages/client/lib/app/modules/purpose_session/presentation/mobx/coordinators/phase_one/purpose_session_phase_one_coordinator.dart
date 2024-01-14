// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/mobx/mobx.dart';
part 'purpose_session_phase_one_coordinator.g.dart';

class PurposeSessionPhaseOneCoordinator = _PurposeSessionPhaseOneCoordinatorBase
    with _$PurposeSessionPhaseOneCoordinator;

abstract class _PurposeSessionPhaseOneCoordinatorBase extends BaseCoordinator
    with Store {
  final VoiceCallCoordinator voiceCall;
  final CollaboratorPresenceCoordinator collaboratorPresence;
  final DeleteCollaborationArtifactsStore deleteCollaborationArtifacts;
  final PurposeSessionPhaseOneWidgetsCoordinator widgets;

  _PurposeSessionPhaseOneCoordinatorBase({
    required this.widgets,
    required this.voiceCall,
    required this.collaboratorPresence,
    required this.deleteCollaborationArtifacts,
  });

  @action
  constructor() {
    widgets.constructor();
    voiceCall.joinCall(shouldEnterTheCallMuted: true);
    onCallJoinedReactor();
  }

  onCallJoinedReactor() =>
      reaction((p0) => voiceCall.voiceCallStatus.inCall, (p0) {
        if (p0 == CallStatus.joined) {
          widgets.onCallJoined();
        }
      });
}
