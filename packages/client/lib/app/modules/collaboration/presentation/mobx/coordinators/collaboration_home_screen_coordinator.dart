// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
part 'collaboration_home_screen_coordinator.g.dart';

class CollaborationHomeScreenCoordinator = _CollaborationHomeScreenCoordinatorBase
    with _$CollaborationHomeScreenCoordinator;

abstract class _CollaborationHomeScreenCoordinatorBase extends BaseCoordinator
    with Store {
  final CollaborationHomeScreenWidgetsCoordinator widgets;
  final GetInvitationURLStore getInvitationURL;
  final ShareCollaborationInvitationStore shareCollaborationInvitation;
  final UserInformationCoordinator userInformation;
  final SwipeDetector swipe;

  _CollaborationHomeScreenCoordinatorBase({
    required this.getInvitationURL,
    required this.shareCollaborationInvitation,
    required this.widgets,
    required this.userInformation,
    required this.swipe,
  });

  @observable
  bool isNavigatingAway = false;

  @action
  toggleIsNavigatingAway() => isNavigatingAway = !isNavigatingAway;

  @action
  constructor() async {
    widgets.constructor();

    widgets.initReactors(onGradientTreeNodeTap, onFlowCompleted);
    await getInvitationURL(NoParams());
    initReactors();
  }

  @action
  onGradientTreeNodeTap() => ifTouchIsNotDisabled(() {
        shareCollaborationInvitation(getInvitationURL.link);
      });

  @action
  onFlowCompleted() => userInformation.updateHasGoneThroughInvitationFlow(true);

  initReactors() {
    swipeReactor();
    shareInvitationReactor();
  }

  shareInvitationReactor() =>
      reaction((p0) => shareCollaborationInvitation.isShared, (p0) {
        if (p0) {
          userInformation.updateHasSentAnInvitation(true);
          widgets.toggleInvitationIsSent();
        }
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        if (!isNavigatingAway) {
          switch (p0) {
            case GestureDirections.down:
              toggleIsNavigatingAway();
              ifTouchIsNotDisabled(() {
                widgets.onSwipeDown();
              });
              toggleDisableAllTouchFeedback();
            default:
              break;
          }
        }
      });

  @override
  List<Object> get props => [];
}
