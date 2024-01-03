// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'collaboration_home_widgets_coordinator.g.dart';

class CollaborationHomeWidgetsCoordinator = _CollaborationHomeWidgetsCoordinatorBase
    with _$CollaborationHomeWidgetsCoordinator;

abstract class _CollaborationHomeWidgetsCoordinatorBase extends Equatable
    with Store {
  final BeachWavesStore beachWaves;
  final GradientTreeNodeStore gradientTreeNode;
  final SmartTextStore smartText;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _CollaborationHomeWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.gradientTreeNode,
    required this.smartText,
    required this.wifiDisconnectOverlay,
  });

  @override
  List<Object> get props => [];
}
