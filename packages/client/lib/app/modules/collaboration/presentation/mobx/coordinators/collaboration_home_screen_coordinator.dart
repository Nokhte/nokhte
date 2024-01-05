// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
part 'collaboration_home_screen_coordinator.g.dart';

class CollaborationHomeScreenCoordinator = _CollaborationHomeScreenCoordinatorBase
    with _$CollaborationHomeScreenCoordinator;

abstract class _CollaborationHomeScreenCoordinatorBase extends BaseCoordinator
    with Store {
  final CollaborationHomeScreenWidgetsCoordinator widgets;
  final GetInvitationURLStore getInvitationURL;
  final ShareCollaborationInvitationStore shareCollaborationInvitation;

  _CollaborationHomeScreenCoordinatorBase({
    required this.getInvitationURL,
    required this.shareCollaborationInvitation,
    required this.widgets,
  });

  @action
  constructor() {
    widgets.constructor();
  }

  @override
  List<Object> get props => [];
}
