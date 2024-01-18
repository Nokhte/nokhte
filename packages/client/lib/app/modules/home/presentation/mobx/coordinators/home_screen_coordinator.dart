// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'home_screen_coordinator.g.dart';

class HomeScreenCoordinator = _HomeScreenCoordinatorBase
    with _$HomeScreenCoordinator;

abstract class _HomeScreenCoordinatorBase extends BaseCoordinator with Store {
  final DeleteUnconsecratedCollaborationsCoordinator
      deleteUnconsecratedCollaborations;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final GetExistingCollaborationsInfoStore getExistingCollaborationInfo;
  final HomeScreenWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final UserInformationCoordinator userInformation;

  _HomeScreenCoordinatorBase({
    required this.deleteUnconsecratedCollaborations,
    required this.addNameToDatabaseStore,
    required this.getExistingCollaborationInfo,
    required this.userInformation,
    required this.swipe,
    required this.widgets,
  });

  @action
  constructor() async {
    widgets.initReactors(repeatTheFlow);
    widgets.constructor();
    await deleteUnconsecratedCollaborations(NoParams());
    await userInformation.getUserInfo(NoParams());
    if (userInformation.getUserInfo.hasGoneThroughInvitationFlow) {
      widgets.postInvitationFlowConstructor();
    } else {
      widgets.invitationFlowConstructor();
    }

    initReactors();
    await getExistingCollaborationInfo(NoParams());
    await addNameToDatabaseStore(NoParams());
  }

  initReactors() {
    swipeReactor();
  }

  @action
  repeatTheFlow() => userInformation.updateWantsToRepeatInvitationFlow(true);

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
