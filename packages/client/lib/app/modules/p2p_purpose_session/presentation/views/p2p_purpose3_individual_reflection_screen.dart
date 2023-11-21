import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

class P2PPurpose3IndividualRefletionScreen extends StatelessWidget
    with WidgetsBindingObserver {
  final P2PPurposePhase3CoordinatorStore coordinator;

  P2PPurpose3IndividualRefletionScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      coordinator.setAppState(state);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Swipe(
            trackerStore: coordinator.swipe,
            child: Stack(
              children: [
                SizedBox(
                  width: constraints.widthConstraints().maxHeight,
                  height: constraints.heightConstraints().maxWidth,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinator.beachWaves,
                  ),
                ),
                Center(
                  child: SmartFadingAnimatedText(
                    stateTrackerStore: coordinator.fadingText,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SoloTextEditor(
                    maxLength: 55,
                    maxLines: 5,
                    fadeInDuration: Seconds.get(2),
                    trackerStore: coordinator.textEditor,
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
