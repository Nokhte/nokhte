// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/mobx/coordinators/coordinators.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';
import 'package:nokhte/app/modules/purpose_session/types/types.dart';
part 'purpose_session_phase_zero_coordinator.g.dart';

class PurposeSessionPhaseZeroCoordinator = _PurposeSessionPhaseZeroCoordinatorBase
    with _$PurposeSessionPhaseZeroCoordinator;

abstract class _PurposeSessionPhaseZeroCoordinatorBase extends BaseCoordinator
    with Store {
  final PurposeSessionPhaseZeroWidgetsCoordinator widgets;
  final CollaboratorPresenceCoordinator collaboratorPresence;
  final DeleteCollaborationArtifactsStore deleteCollaborationArtifacts;

  _PurposeSessionPhaseZeroCoordinatorBase({
    required this.widgets,
    required this.deleteCollaborationArtifacts,
    required this.collaboratorPresence,
  });

  @action
  constructor() async {
    widgets.constructor();
    await collaboratorPresence.updateMeetingIdAndToken(
      UpdateMeetingIdAndTokenParams.refresh,
    );
  }

  @action
  onInactive() => widgets.onInactive();

  @action
  onResumed() => widgets.onResumed();

  @action
  onDetached() async => await deleteCollaborationArtifacts
      .call(PurposeSessionScreen.phase0Greeter);
}
