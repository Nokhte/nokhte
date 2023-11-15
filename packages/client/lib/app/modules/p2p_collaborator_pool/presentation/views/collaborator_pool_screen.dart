import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/presentation.dart';

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
            trackerStore: coordinatorStore.swipe,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinatorStore.beachWavesStore,
                  ),
                ),
                Center(
                  child: FadeInAndChangeColorText(
                    stateStore: coordinatorStore.fadeInAndColorTextStore,
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
