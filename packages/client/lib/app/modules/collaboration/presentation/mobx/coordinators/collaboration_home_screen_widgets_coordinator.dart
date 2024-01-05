// ignore_for_file: must_be_immutable, library_private_types_in_public_api
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

  @action
  toggleInvitationIsSent() => invitationIsSent = !invitationIsSent;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtOceanDive);
    gestureCross.setCollaborationHomeScreen();
    gradientTreeNode.toggleWidgetVisibility();
    smartText.setMessagesData(MessagesData.firstTimeCollaborationList);
    smartText.startRotatingText();
  }

  @action
  onSwipeDown() {
    if (gradientTreeNode.showWidget) {
      gradientTreeNode.toggleWidgetVisibility();
    }
    smartText.pause();
    smartText.toggleWidgetVisibility();
    gestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
    beachWaves.setMovieMode(BeachWaveMovieModes.oceanDiveToOnShore);
    beachWaves.currentStore.initMovie(NoParams());
  }

  initReactors(Function onGradientTreeNodeTap, Function onFlowCompleted) {
    smartTextReactor(onFlowCompleted);
    gradientTreeNodeTapReactor(onGradientTreeNodeTap);
    invitationSendStatusReactor();
    centerCrossNokhteReactor();
    beachWavesMovieStatusReactor();
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
        onGradientTreeNodeTap();
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

  // add beach waves listener

  @override
  List<Object> get props => [];
}
