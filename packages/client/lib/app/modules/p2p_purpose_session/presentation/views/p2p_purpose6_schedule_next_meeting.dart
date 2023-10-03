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
    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        print(event.toString());
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
