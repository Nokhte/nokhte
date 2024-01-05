// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'home_screen_coordinator.g.dart';

class HomeScreenCoordinator = _HomeScreenCoordinatorBase
    with _$HomeScreenCoordinator;

abstract class _HomeScreenCoordinatorBase extends BaseCoordinator with Store {
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;
  final GetExistingCollaborationsInfoStore getExistingCollaborationInfo;
  final GetInvitationURLStore getInvitationURL;
  final ShareCollaborationInvitationStore shareCollaborationInvitation;
  final HomeScreenWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final UserInformationCoordinator userInformation;

  _HomeScreenCoordinatorBase({
    required this.addNameToDatabaseStore,
    required this.getCollaboratorPhraseStore,
    required this.getExistingCollaborationInfo,
    required this.getInvitationURL,
    required this.userInformation,
    required this.shareCollaborationInvitation,
    required this.swipe,
    required this.widgets,
  });

  @action
  constructor() async {
    widgets.constructor();
    await userInformation.getUserInfo(NoParams());
    if (userInformation.getUserInfo.hasGoneThroughInvitationFlow) {
      // widgets.postInvitationFlowConstuctor();
    } else {
      widgets.invitationFlowConstructor();
    }
    widgets.initReactors(
      onGradientTreeNodeTap: onGradientTreeNodeTap,
    );
    initReactors();
    await getExistingCollaborationInfo(NoParams());
    await addNameToDatabaseStore(NoParams());
    await getCollaboratorPhraseStore(NoParams());
    await getInvitationURL(NoParams());
  }

  initReactors() {
    swipeReactor();
  }

  @action
  onGradientTreeNodeTap() {
    shareCollaborationInvitation(getInvitationURL.link);
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            ifTouchIsNotDisabled(() {
              widgets.onSwipeUp();
            });
          default:
            break;
        }
      });
}
