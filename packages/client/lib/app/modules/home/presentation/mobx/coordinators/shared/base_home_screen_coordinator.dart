// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/domain/logic/logic.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';

import 'base_home_screen_widgets_coordinator.dart';
part 'base_home_screen_coordinator.g.dart';

class BaseHomeScreenCoordinator = _BaseHomeScreenCoordinatorBase
    with _$BaseHomeScreenCoordinator;

abstract class _BaseHomeScreenCoordinatorBase extends BaseCoordinator
    with Store {
  final BaseHomeScreenWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final CollaborationLogicCoordinator collaborationLogic;
  final DeepLinksCoordinator deepLinks;

  _BaseHomeScreenCoordinatorBase({
    required this.collaborationLogic,
    required this.swipe,
    required this.widgets,
    required this.deepLinks,
  });

  initReactors() {
    deepLinks.listen();
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        widgets.onLongReconnected();
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.onDisconnected();
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

  swipeReactor(Function onSwipeUp) =>
      reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            if (!widgets.isEnteringNokhteSession) {
              ifTouchIsNotDisabled(() {
                onSwipeUp();
              });
            }
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
              if (widgets.beachWaves.movieStatus == MovieStatus.finished &&
                  widgets.isEnteringNokhteSession) {
                Modular.to.navigate('/collaboration/pool');
                timer.cancel();
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
