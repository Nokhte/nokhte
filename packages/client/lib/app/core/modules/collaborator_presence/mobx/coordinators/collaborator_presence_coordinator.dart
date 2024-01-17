// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/mobx/mobx.dart';
part 'collaborator_presence_coordinator.g.dart';

class CollaboratorPresenceCoordinator = _CollaboratorPresenceCoordinatorBase
    with _$CollaboratorPresenceCoordinator;

abstract class _CollaboratorPresenceCoordinatorBase extends Equatable
    with Store {
  final UpdateOnCallStatusStore updateOnCallStatus;
  final UpdateOnlineStatusStore updateOnlineStatus;
  final UpdateTimerStatusStore updateTimerStatus;
  final UpdateWhoIsTalkingStore updateWhoIsTalking;
  final GetSessionMetadataStore getSessionMetadata;
  final UpdateMeetingIdAndTokenStore updateMeetingIdAndToken;

  _CollaboratorPresenceCoordinatorBase({
    required this.getSessionMetadata,
    required this.updateOnCallStatus,
    required this.updateOnlineStatus,
    required this.updateTimerStatus,
    required this.updateWhoIsTalking,
    required this.updateMeetingIdAndToken,
  });

  @override
  List<Object> get props => [];
}
