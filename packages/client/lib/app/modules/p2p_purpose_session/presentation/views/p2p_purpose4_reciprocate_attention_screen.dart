import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

class P2PPurpose4ReciprocateAttentionScreen extends StatelessWidget {
  final P2PPurposePhase4CoordinatorStore coordinator;
  P2PPurpose4ReciprocateAttentionScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => PlatformScaffold(
            body: Stack(
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
                    initialFadeInDelay: Seconds.get(0),
                    stateTrackerStore: coordinator.fadingText,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
