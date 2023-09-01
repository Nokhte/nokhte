import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
import 'package:swipe/swipe.dart';

class P2PPurpose5CollectiveCreation extends StatelessWidget {
  final P2PPurposePhase5CoordinatorStore coordinator;
  P2PPurpose5CollectiveCreation({
    super.key,
    required this.coordinator,
  }) {
    //
    coordinator.beachWaves.initiateSuspendedAtTheDepths();
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
                    stateTrackerStore: coordinator.beachWaves,
                  ),
                ),
              ],
            ),
          ))),
    );
    // });
  }
}
