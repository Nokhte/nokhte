// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'collaboration_home_screen_widgets_coordinator.g.dart';

class CollaborationHomeScreenWidgetsCoordinator = _CollaborationHomeScreenWidgetsCoordinatorBase
    with _$CollaborationHomeScreenWidgetsCoordinator;

abstract class _CollaborationHomeScreenWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final GradientTreeNodeStore gradientTreeNode;
  final SmartTextStore smartText;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;

  _CollaborationHomeScreenWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.gestureCross,
    required this.gradientTreeNode,
    required this.smartText,
    required this.wifiDisconnectOverlay,
  });

  @observable
  bool invitationIsSent = false;

  @observable
  bool shouldEnterCollaboratorPool = false;

  @action
  toggleShouldEnterCollaboratorPool() =>
      shouldEnterCollaboratorPool = !shouldEnterCollaboratorPool;

  @action
  toggleInvitationIsSent() => invitationIsSent = !invitationIsSent;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtOceanDive);
    gestureCross.setCollaborationHomeScreen();
    smartText.setMessagesData(MessagesData.firstTimeCollaborationList);
    gradientTreeNode.setWidgetVisibility(true);
  }

  @action
  onResumed() {
    if (smartText.currentIndex.isLessThanOrEqualTo(1) &&
        smartText.messagesData.length == 3) {
      smartText.reset();
      smartText.startRotatingText();
    }
  }

  @action
  onInactive() {
    if (smartText.currentIndex.isLessThanOrEqualTo(1) &&
        smartText.messagesData.length == 3) {
      smartText.pause();
    }
  }

  @action
  invitationFlowConstructor() {
    Timer.periodic(Seconds.get(0, milli: 100), (timer) {
      if (!smartText.isPaused) {
        smartText.startRotatingText();
        timer.cancel();
      }
    });
  }

  @action
  enterCollaboratorPoolConstructor() {
    gradientTreeNode.setWidgetVisibility(false);
    toggleShouldEnterCollaboratorPool();
  }

  @action
  postInvitationFlowConstructor() {
    Timer.periodic(Seconds.get(0, milli: 100), (timer) {
      if (!smartText.isPaused) {
        smartText.setCurrentIndex(1);
        smartText.startRotatingText();
        timer.cancel();
      }
    });
  }

  @action
  onNokhteSessionLinkOpened() {
    beachWaves.setMovieMode(BeachWaveMovieModes.oceanDiveToTimesUp);
    beachWaves.currentStore.initMovie(NoParams());
    gestureCross.toggleAll();
    // if (gradientTreeNode.showWidget) {
    gradientTreeNode.setWidgetVisibility(false);
    // }
    if (smartText.showWidget) {
      smartText.toggleWidgetVisibility();
    }
  }

  @action
  initCollaboratorPoolWidgets() {
    if (!shouldEnterCollaboratorPool) {
      toggleShouldEnterCollaboratorPool();
    }
    gradientTreeNode.initMovie(NoParams());
    gestureCross.toggleAll();
  }

  @action
  onSwipeDown() {
    gradientTreeNode.setWidgetVisibility(false);
    smartText.pause();
    smartText.toggleWidgetVisibility();
    gestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
    beachWaves.setMovieMode(BeachWaveMovieModes.oceanDiveToOnShore);
    beachWaves.currentStore.initMovie(NoParams());
  }

  initReactors(Function onFlowCompleted, Function enterCollaboratorPool) {
    smartTextReactor(onFlowCompleted);

    invitationSendStatusReactor();
    centerCrossNokhteReactor();
    beachWavesMovieStatusReactor();
    gradientTreeNodeOpacityReactor(enterCollaboratorPool);
    gradientTreeNodeMovieStatusReactor();
  }

  smartTextReactor(Function onFlowCompleted) =>
      reaction((p0) => smartText.currentIndex, (p0) {
        if (p0 == 1) {
          gradientTreeNode.setWidgetVisibility(true);
          onFlowCompleted();
        }
      });

  gradientTreeNodeOpacityReactor(Function enterCollaboratorPool) =>
      reaction((p0) => gradientTreeNode.hasFadedIn, (p0) async {
        if (shouldEnterCollaboratorPool && p0) {
          initCollaboratorPoolWidgets();
          await enterCollaboratorPool();
        }
      });

  gradientTreeNodeMovieStatusReactor() =>
      reaction((p0) => gradientTreeNode.movieStatus, (p0) async {
        if (shouldEnterCollaboratorPool && p0 == MovieStatus.finished) {
          Modular.to.navigate('/collaboration/pool');
        }
      });

  invitationSendStatusReactor() => reaction((p0) => invitationIsSent, (p0) {
        if (p0) {
          smartText.startRotatingText(isResuming: true);
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.toggleWidgetVisibility();
          gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
        }
      });

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.oceanDiveToOnShore) {
            Modular.to.navigate('/home/');
          }
        }
      });
}
