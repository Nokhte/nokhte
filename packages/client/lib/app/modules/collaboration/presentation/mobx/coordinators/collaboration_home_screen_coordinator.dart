// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/deep_link_types.dart';
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
  final UserInformationCoordinator userInformation;
  final SwipeDetector swipe;
  final DeepLinksCoordinator deepLinks;
  final CancelCollaboratorSearchStreamStore cancelCollaboratorSearchStream;
  final EnterCollaboratorPoolStore enterCollaboratorPool;
  final ExitCollaboratorPoolStore exitCollaboratorPool;
  final GetCollaboratorSearchStatusStore getCollaboratorSearchStatus;

  _CollaborationHomeScreenCoordinatorBase({
    required this.widgets,
    required this.deepLinks,
    required this.userInformation,
    required this.swipe,
    required this.cancelCollaboratorSearchStream,
    required this.enterCollaboratorPool,
    required this.exitCollaboratorPool,
    required this.getCollaboratorSearchStatus,
  });

  @observable
  ObservableMap additionalRoutingData = ObservableMap.of({});

  @action
  setAdditionalRoutingData(Map? newMap) =>
      additionalRoutingData = ObservableMap.of(newMap ?? {});

  @observable
  bool isNavigatingAway = false;

  @action
  toggleIsNavigatingAway() => isNavigatingAway = !isNavigatingAway;

  @action
  constructor() async {
    deepLinks.listenForOpenedDeepLink(NoParams());
    setAdditionalRoutingData(Modular.args.data);
    widgets.constructor();
    widgets.initReactors(onGradientTreeNodeTap, onFlowCompleted);
    initReactors();
    await userInformation.getUserInfo(NoParams());
    if (userInformation.getUserInfo.hasGoneThroughInvitationFlow) {
      if (additionalRoutingData.isEmpty) {
        widgets.postInvitationFlowConstructor();
      } else {
        if (additionalRoutingData["hasSentAnInvitation"] == true) {
          // print("entering collaborator pool");
        } else {
          // print("send an invite bruh");
          widgets.postInvitationFlowNoInviteConstructor();
        }
      }
    } else {
      widgets.invitationFlowConstructor();
    }
    await deepLinks.getDeepLinkURL(
      const GetDeepLinkURLParams(
        type: DeepLinkTypes.collaboratorInvitation,
      ),
    );
  }

  @action
  onGradientTreeNodeTap() => ifTouchIsNotDisabled(() {
        deepLinks.sendDeepLink(deepLinks.getDeepLinkURL.link);
      });

  @action
  onFlowCompleted() => userInformation.updateHasGoneThroughInvitationFlow(true);

  initReactors() {
    swipeReactor();
    shareInvitationReactor();
    deepLinksReactor();
  }

  deepLinksReactor() =>
      reaction((p0) => deepLinks.listenForOpenedDeepLink.path, (p0) {
        if (p0 == '/collaboration/') {
          setAdditionalRoutingData(
            deepLinks.listenForOpenedDeepLink.additionalMetadata,
          );
          // so this would need to be aware of the current mode & current state
          // and know what to do so this one will be a litter more complicated
        }
      });

  shareInvitationReactor() =>
      reaction((p0) => deepLinks.sendDeepLink.isShared, (p0) {
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
