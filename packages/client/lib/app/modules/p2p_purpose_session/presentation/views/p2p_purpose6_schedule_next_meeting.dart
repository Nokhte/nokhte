// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
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
  // idea is that you have a image and then u push it all down with a single container
  // so this means Column(Sky, Stack(Sun, Water))

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return PlayAnimationBuilder(
            tween: Tween<double>(begin: 0.00, end: 200.00),
            duration: const Duration(seconds: 10),
            builder: (context, value, _) {
              return PlatformScaffold(
                body: Swipe(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SmartBeachHorizon(
                          stateTrackerStore: coordinator.beachWaves,
                        ),
                      ),
                    ],
                    // children: [
                    //   // the pusher if that makes sense
                    //   Container(
                    //     height: value,
                    //     color: Colors.green.withOpacity(.4),
                    //   ),
                    //   Stack(
                    //     children: [
                    //       // the sun
                    //       Container(
                    //         height: value,
                    //         child: Container(
                    //             // alignment: Alignment.center,
                    //             // child: PlatformText('hi'),
                    //             ),
                    //       ),
                    //       // the sky
                    //       Container(
                    //         color: Colors.blue,
                    //         width: MediaQuery.of(context).size.width,
                    //         height: (MediaQuery.of(context).size.height * .5) -
                    //             value,
                    //         // child: SmartBeachWaves(
                    //         //   stateTrackerStore: coordinator.beachWaves,
                    //         // ),
                    //       ),
                    //     ],
                    //   ),
                    //   Contkiner(),

                    // Column(
                    //   children: [
                    //     Container(
                    //       height: value,
                    //       child: Container(
                    //           alignment: Alignment.bottomCenter,
                    //           child: PlatformText('hi')),
                    //     ),
                    //     Container(
                    //       color: Colors.blue,
                    //       width: MediaQuery.of(context).size.width,
                    //       height: MediaQuery.of(context).size.height - value,
                    //       // child: SmartBeachWaves(
                    //       //   stateTrackerStore: coordinator.beachWaves,
                    //       // ),
                    //     ),
                    //   ],
                    // ),
                    // StreamBuilder(
                    //     stream: coordinator.gyroscopeStore.userDirection,
                    //     builder: (context, snapshot) {
                    //       return Center(
                    //         child: PlatformText(
                    //           snapshot.data.toString(),
                    //         ),
                    //       );
                    //     })
                    // ],
                  ),
                ),
              );
            });
      }),
    );
  }
}

// import 'package:flutter/material.dart';

