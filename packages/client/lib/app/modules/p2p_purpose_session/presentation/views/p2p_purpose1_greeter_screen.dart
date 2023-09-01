import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/coordinators/coordinators.dart';
import 'package:swipe/swipe.dart';

class P2PPurpose1GreeterScreen extends StatelessWidget {
  final P2PPurposePhase1CoordinatorStore coordinator;
  P2PPurpose1GreeterScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructorCallback();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => PlatformScaffold(
              body: Swipe(
            // onSwipeLeft: () {
            //   print('swipe left unmute callback');
            //   coordinator.unmuteCallback();
            // },
            // onSwipeRight: () {
            //   print('swipe right mute callback');
            //   coordinator.muteCallback();
            // },
            onSwipeUp: () async {
              coordinator.swipeUpCallback();
            },
            // onSwipeDown: () async {
            //   await coordinator.swipeDownCallback();
            // },
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinator.beachWaves,
                  ),
                ),
                Center(
                  child: SmartFadingAnimatedText(
                    initialFadeInDelay: const Duration(seconds: 0),
                    stateTrackerStore: coordinator.fadingText,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  alignment: Alignment.bottomCenter,
                  child: FadeInAndChangeColorText(
                    stateStore: coordinator.fadeInColorText,
                  ),
                  // child: Center(
                  //   child:
                  // ),
                ),
              ],
            ),
          ))),
    );
    // });
  }
}
