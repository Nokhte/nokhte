import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/main/collaborator_pool_screen_coordinator_store.dart';
import 'package:swipe/swipe.dart';

class CollaboratorPoolScreen extends StatelessWidget {
  final CollaboratorPoolScreenCoordinatorStore coordinatorStore;

  CollaboratorPoolScreen({
    super.key,
    required this.coordinatorStore,
  }) {
    coordinatorStore.screenConstructorCallback();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => PlatformScaffold(
              body: Swipe(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore:
                        coordinatorStore.widgetStore.beachWavesStore,
                  ),
                ),
                // Center(
                //   child: SmartFadingAnimatedText(
                //     initialFadeInDelay: const Duration(seconds: 3),
                //     stateTrackerStore: coordinatorStore
                //         .widgetStore.smartFadingAnimatedTextStore,
                //   ),
                // ),
              ],
            ),
          ))),
    );
  }
}
