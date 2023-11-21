import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/presentation.dart';

class CollaboratorPoolScreen extends StatelessWidget {
  final CollaboratorPoolScreenCoordinatorStore coordinator;

  CollaboratorPoolScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructorCallback();
  }

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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinator.beachWavesStore,
                  ),
                ),
                Center(
                  child: FadeInAndChangeColorText(
                    stateStore: coordinator.fadeInAndColorTextStore,
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
