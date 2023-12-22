// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'circle_explanation_widgets_coordinator.g.dart';

class CircleExplanationWidgetsCoordinator = _CircleExplanationWidgetsCoordinatorBase
    with _$CircleExplanationWidgetsCoordinator;

abstract class _CircleExplanationWidgetsCoordinatorBase extends Equatable
    with Store {
  final NokhteBlurStore nokhteBlur;
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SmartTextStore smartText;
  final GestureCrossStore gestureCross;
  final CircleExplanationModelCoordinator circleModel;

  _CircleExplanationWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.smartText,
    required this.gestureCross,
    required this.circleModel,
  });

  @override
  List<Object> get props => [];
}
