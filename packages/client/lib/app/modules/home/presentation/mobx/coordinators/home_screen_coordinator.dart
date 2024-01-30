// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/domain/logic/logic.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
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
  final CollaborationLogicCoordinator collaborationLogic;
  final DeepLinksCoordinator deepLinks;

  _HomeScreenCoordinatorBase({
    required this.deleteUnconsecratedCollaborations,
    required this.addNameToDatabaseStore,
    required this.getExistingCollaborationInfo,
    required this.userInformation,
    required this.collaborationLogic,
    required this.swipe,
    required this.widgets,
    required this.deepLinks,
  });

  @action
  constructor() async {
    widgets.initReactors(repeatTheFlow);
    widgets.constructor();
    await deleteUnconsecratedCollaborations(NoParams());
    await userInformation.getUserInfoStore(NoParams());
    if (userInformation.getUserInfoStore.hasGoneThroughInvitationFlow) {
      widgets.postInvitationFlowConstructor();
    } else {
      widgets.invitationFlowConstructor();
    }
    initReactors();
    await getExistingCollaborationInfo(NoParams());
    await addNameToDatabaseStore(NoParams());
  }

  initReactors() {
    deepLinks.listen();
    swipeReactor();
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        widgets.onResumed();
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.onInactive();
      },
    );
    widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete,
      onShoreToVibrantBlueComplete,
    );
    collaboratorPoolEntryReactor();
    openedDeepLinksReactor();
  }

  @action
  onResumed() {
    ifTouchIsNotDisabled(() {
      widgets.onResumed();
    });
  }

  @action
  onInactive() {
    ifTouchIsNotDisabled(() {
      widgets.onInactive();
    });
  }

  @action
  onShoreToOceanDiveComplete() => Modular.to.navigate(
        '/collaboration/',
        arguments: deepLinks.listenForOpenedDeepLinkStore.additionalMetadata,
      );

  @action
  onShoreToVibrantBlueComplete() => Modular.to.navigate(
        '/collaboration/pool',
        arguments: deepLinks.listenForOpenedDeepLinkStore.additionalMetadata,
      );

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

  collaboratorPoolEntryReactor() =>
      reaction((p0) => collaborationLogic.hasEntered, (p0) async {
        if (p0) {
          Timer.periodic(
            const Duration(seconds: 1),
            (timer) async {
              if (widgets.beachWaves.movieStatus == MovieStatus.finished) {
                timer.cancel();
                Modular.to.navigate('/collaboration/pool');
              }
            },
          );
        }
      });

  openedDeepLinksReactor() =>
      reaction((p0) => deepLinks.listenForOpenedDeepLinkStore.path, (p0) async {
        if (deepLinks.listenForOpenedDeepLinkStore
                .additionalMetadata["isTheUsersInvitation"] !=
            null) {
          final additionalMetadata =
              deepLinks.listenForOpenedDeepLinkStore.additionalMetadata;
          await collaborationLogic.enter(EnterCollaboratorPoolParams(
            collaboratorUID: additionalMetadata["deepLinkUID"],
            invitationType: InvitationType.nokhteSession,
          ));
          widgets.onDeepLinkOpened();
        }
      });
}
