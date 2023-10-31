import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';

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
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .30,
    );
    return Observer(
      builder: (context) => LayoutBuilder(
        builder: (contexts, constraints) => PlatformScaffold(
          body: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: BeachSky(
                  stateTrackerStore: coordinator.widgets.beachSky,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: BeachHorizonWater(
                  size: MediaQuery.of(context).size,
                  stateTrackerStore: coordinator.widgets.beachHorizonWater,
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  PerspectivesMap(
                    size: size,
                    stateTrackerStore: coordinator.widgets.perspectivesMap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
