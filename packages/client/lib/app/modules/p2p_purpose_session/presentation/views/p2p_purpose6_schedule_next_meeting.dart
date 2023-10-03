// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
import 'package:swipe/swipe.dart';

class P2PPupose6ScheduleNextMeeting extends StatelessWidget {
  final P2PPurposePhase6CoordinatorStore coordinator;
  late double currentAngle;
  // CRAP we need a whole new widget that
  P2PPupose6ScheduleNextMeeting({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return PlatformScaffold(
          body: Swipe(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinator.beachWaves,
                  ),
                ),
                StreamBuilder(
                    stream: coordinator.gyroscopeStore.userDirection,
                    builder: (context, snapshot) {
                      return Center(
                        child: PlatformText(
                          snapshot.data.toString(),
                        ),
                      );
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
