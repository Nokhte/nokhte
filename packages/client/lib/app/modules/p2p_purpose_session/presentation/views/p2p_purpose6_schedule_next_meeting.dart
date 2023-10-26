import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
import 'package:swipe/swipe.dart';

class P2PPupose6ScheduleNextMeeting extends StatelessWidget {
  final P2PPurposePhase6CoordinatorStore coordinator;
  P2PPupose6ScheduleNextMeeting({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return LayoutBuilder(
        builder: ((context, constraints) {
          final size = MediaQuery.of(context).size;
          return PlatformScaffold(
            body: Swipe(
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: BeachSky(
                      stateTrackerStore: coordinator.widgets.beachSkyStore,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SunAndMoon(
                      stateTrackerStore: coordinator.widgets.sunAndMoon,
                    ),
                  ),
                  Opacity(
                    opacity: coordinator.widgets.beachWavesVisibility ? 0 : 1,
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: BeachHorizonWater(
                        size: size,
                        stateTrackerStore:
                            coordinator.widgets.beachHorizonWater,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: ConveyerBeltText(
                        size: size,
                        trackerStore: coordinator.widgets.conveyerBelt,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SchedulingDelta(
                        trackerStore: coordinator.widgets.schedulingDelta,
                      )),
                  // Opacity(
                  //   opacity: coordinator.widgets.beachWavesVisibility ? 1 : 0,
                  //   child:
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    // child: Opacity(
                    // opacity: coordinator.widgets.beachWavesVisibility ? 1 : 0,
                    child: SmartBeachWaves(
                      stateTrackerStore: coordinator.widgets.beachWaves,
                    ),
                    // ),
                  ),
                  // ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}

// import 'package:flutter/material.dart';
