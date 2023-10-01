import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
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
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
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
                Center(
                  child: CollaborativeTextEditor(
                    trackerStore: coordinator.collaborativeTextUI,
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child:
                          Container(), // Empty SizedBox to take up available space
                    ),
                    GestureDetector(
                      onLongPressStart: (_) =>
                          coordinator.audioButtonHoldStartCallback(),
                      onLongPressEnd: (_) {
                        coordinator.audioButtonHoldEndCallback();
                      },
                      child: SizedBox(
                        height: size.height,
                        width: size.width,
                        child: MeshCircleButton(
                          trackerStore: coordinator.meshCircleStore,
                          size: size,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                  ],
                ),
              ],
            ),
          ))),
    );
    // });
  }
}
