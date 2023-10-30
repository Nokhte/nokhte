import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
// import 'package:nokhte/app/core/types/types.dart';
// import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
// import 'package:swipe/swipe.dart';

class PerspectivesSessionScreen extends StatelessWidget {
  final P2PPerspectiveSessionCoordinatorStore coordinator;
  PerspectivesSessionScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // final size = CanvasSizeCalculator.squareCanvas(
    //   context: context,
    //   percentageLength: .20,
    // );

    // });
  }
}
