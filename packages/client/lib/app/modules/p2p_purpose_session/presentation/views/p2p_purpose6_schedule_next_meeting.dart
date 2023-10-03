import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
import 'package:swipe/swipe.dart';
import 'package:sensors_plus/sensors_plus.dart';

class P2PPupose6ScheduleNextMeeting extends StatelessWidget {
  final P2PPurposePhase6CoordinatorStore coordinator;
  // CRAP we need a whole new widget that
  P2PPupose6ScheduleNextMeeting({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
    final gyroStream = gyroscopeEvents.distinct();
    gyroStream.listen(
      (GyroscopeEvent event) {
        double yaw = event.z * (180.0 / pi);
        if (yaw < 0) {
          yaw += 360.0;
        } else if (event.z >= 360.0) {
          yaw -= 360.0;
        }
        print("$yaw degrees");
        // Return the normalized yaw angle
      },
      onError: (error) {
        //
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (((context, constraints) => PlatformScaffold(
            body: Swipe(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SmartBeachWaves(
                  stateTrackerStore: coordinator.beachWaves,
                ),
              ),
            ),
          ))),
    );
  }
}
