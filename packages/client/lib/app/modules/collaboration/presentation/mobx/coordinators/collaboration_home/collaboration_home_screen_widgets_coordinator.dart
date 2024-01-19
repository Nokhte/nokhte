// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'collaboration_home_screen_widgets_coordinator.g.dart';

class CollaborationHomeScreenWidgetsCoordinator = _CollaborationHomeScreenWidgetsCoordinatorBase
    with _$CollaborationHomeScreenWidgetsCoordinator;

abstract class _CollaborationHomeScreenWidgetsCoordinatorBase extends Equatable
    with Store {
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
  bool isDisconnected = false;

  @observable
  bool shouldEnterCollaboratorPool = false;

  @action
  toggleShouldEnterCollaboratorPool() =>
      shouldEnterCollaboratorPool = !shouldEnterCollaboratorPool;

  @action
  toggleIsDisconnected() => isDisconnected = !isDisconnected;

  @action
  toggleInvitationIsSent() => invitationIsSent = !invitationIsSent;

  @action
  onConnected() {
    if (isDisconnected) toggleIsDisconnected();
    if (smartText.isPaused &&
        wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.placeTheCircle) {
      smartText.resume();
    }
  }

  @action
  onDisconnected() {
    if (!isDisconnected) toggleIsDisconnected();
    if (!smartText.isPaused) {
      smartText.pause();
    }
  }

  @action
  onResumed() {
    if (smartText.isPaused && !isDisconnected) {
      smartText.resume();
    }
  }

  @action
  onInactive() {
    if (!smartText.isPaused && !isDisconnected) {
      smartText.pause();
    }
  }

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtOceanDive);
    gestureCross.setCollaborationHomeScreen();
    smartText.setMessagesData(MessagesData.firstTimeCollaborationList);
    gradientTreeNode.toggleWidgetVisibility();
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
  postInvitationFlowNoInviteConstructor() {
    smartText.setMessagesData(MessagesData.postInvitationNoInvite);
    gradientTreeNode.toggleWidgetVisibility();
    Timer.periodic(Seconds.get(0, milli: 100), (timer) {
      if (!smartText.isPaused) {
        smartText.startRotatingText();
        timer.cancel();
      }
    });
  }

  @action
  enterCollaboratorPoolConstructor() {
    gradientTreeNode.toggleWidgetVisibility();
    toggleShouldEnterCollaboratorPool();
  }

  @action
  postInvitationFlowConstructor() {
    Timer.periodic(Seconds.get(0, milli: 100), (timer) {
      if (!smartText.isPaused) {
        smartText.setCurrentIndex(2);
        smartText.startRotatingText();
        timer.cancel();
      }
    });
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
    if (!isDisconnected) {
      if (gradientTreeNode.showWidget) {
        gradientTreeNode.toggleWidgetVisibility();
      }
      smartText.pause();
      smartText.toggleWidgetVisibility();
      gestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
      beachWaves.setMovieMode(BeachWaveMovieModes.oceanDiveToOnShore);
      beachWaves.currentStore.initMovie(NoParams());
    }
  }

  initReactors(Function onGradientTreeNodeTap, Function onFlowCompleted,
      Function enterCollaboratorPool) {
    smartTextReactor(onFlowCompleted);
    gradientTreeNodeTapReactor(onGradientTreeNodeTap);
    invitationSendStatusReactor();
    centerCrossNokhteReactor();
    beachWavesMovieStatusReactor();
    wifiDisconnectOverlay.connectionReactor(
      onConnected: onConnected,
      onDisconnected: onDisconnected,
    );
    wifiDisconnectOverlayReactor();
    gradientTreeNodeOpacityReactor(enterCollaboratorPool);
    gradientTreeNodeMovieStatusReactor();
  }

  smartTextReactor(Function onFlowCompleted) =>
      reaction((p0) => smartText.currentIndex, (p0) {
        if (p0 == 2) {
          gradientTreeNode.toggleWidgetVisibility();
          onFlowCompleted();
        }
      });

  gradientTreeNodeTapReactor(Function onGradientTreeNodeTap) =>
      reaction((p0) => gradientTreeNode.tapCount, (p0) {
        if (!isDisconnected) {
          onGradientTreeNodeTap();
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
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.oceanDiveToOnShore) {
          Modular.to.navigate('/home/');
        }
      });

  wifiDisconnectOverlayReactor() =>
      reaction((p0) => wifiDisconnectOverlay.movieStatus, (p0) {
        if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.removeTheCircle) {
          if (smartText.isPaused) {
            smartText.resume();
          }
        }
      });

  @override
  List<Object> get props => [];
}
