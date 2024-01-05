// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
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

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtOceanDive);
    gestureCross.setCollaborationHomeScreen();
    gradientTreeNode.toggleWidgetVisibility();
    smartText.setMessagesData(MessagesData.firstTimeCollaborationList);
    smartText.startRotatingText();
  }

  initReactors(Function onGradientTreeNodeTap) {
    smartTextReactor();
    gradientTreeNodeTapReactor(onGradientTreeNodeTap);
  }

  smartTextReactor() => reaction((p0) => smartText.currentIndex, (p0) {
        if (p0 == 2) {
          gradientTreeNode.toggleWidgetVisibility();
        }
      });

  gradientTreeNodeTapReactor(Function onGradientTreeNodeTap) => reaction(
        (p0) => gradientTreeNode.tapCount,
        (p0) => onGradientTreeNodeTap(),
      );

  @override
  List<Object> get props => [];
}
