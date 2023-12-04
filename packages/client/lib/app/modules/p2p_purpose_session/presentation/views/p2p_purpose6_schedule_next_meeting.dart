import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

class P2PPupose6ScheduleNextMeeting extends StatefulWidget {
  final P2PPurposePhase6CoordinatorStore coordinator;
  const P2PPupose6ScheduleNextMeeting({
    super.key,
    required this.coordinator,
  });

  @override
  State<P2PPupose6ScheduleNextMeeting> createState() =>
      _P2PPupose6ScheduleNextMeetingState();
}

class _P2PPupose6ScheduleNextMeetingState
    extends State<P2PPupose6ScheduleNextMeeting> {
  @override
  void initState() {
    super.initState();
    widget.coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return LayoutBuilder(
        builder: ((context, constraints) {
          final size = MediaQuery.of(context).size;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Swipe(
              trackerStore: widget.coordinator.swipe,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: BeachSky(
                      stateTrackerStore:
                          widget.coordinator.widgets.beachSkyStore,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SunAndMoon(
                      stateTrackerStore: widget.coordinator.widgets.sunAndMoon,
                    ),
                  ),
                  Opacity(
                    opacity:
                        widget.coordinator.widgets.beachWavesVisibility ? 0 : 1,
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: BeachHorizonWater(
                        size: size,
                        stateTrackerStore:
                            widget.coordinator.widgets.beachHorizonWater,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: ConveyerBeltText(
                        size: size,
                        trackerStore: widget.coordinator.widgets.conveyerBelt,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SchedulingDelta(
                        trackerStore:
                            widget.coordinator.widgets.schedulingDelta,
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SmartBeachWaves(
                      stateTrackerStore: widget.coordinator.widgets.beachWaves,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
