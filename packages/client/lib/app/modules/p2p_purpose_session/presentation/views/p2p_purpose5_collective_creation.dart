import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

class P2PPurpose5CollectiveCreation extends StatelessWidget {
  final P2PPurposePhase5CoordinatorStore coordinator;
  P2PPurpose5CollectiveCreation({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    return LayoutBuilder(
      builder: ((context, constraints) => Observer(builder: (context) {
            return Scaffold(
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
                        child: CollaborativeTextEditor(
                          fadeInDuration: Seconds.get(1),
                          trackerStore: coordinator.collaborativeTextUI,
                        ),
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GesturePill(
                                size: size,
                                stateTrackerStore: coordinator.gesturePillStore,
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          })),
    );
  }
}
