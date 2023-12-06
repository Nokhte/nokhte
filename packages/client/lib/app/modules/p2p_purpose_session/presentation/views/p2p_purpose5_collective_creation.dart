import 'package:flutter/material.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

class P2PPurpose5CollectiveCreation extends StatefulWidget {
  final P2PPurposePhase5Coordinator coordinator;
  const P2PPurpose5CollectiveCreation({
    super.key,
    required this.coordinator,
  });

  @override
  State<P2PPurpose5CollectiveCreation> createState() =>
      _P2PPurpose5CollectiveCreationState();
}

class _P2PPurpose5CollectiveCreationState
    extends State<P2PPurpose5CollectiveCreation> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    widget.coordinator.screenConstructor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    return LayoutBuilder(
      builder: ((context, constraints) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: Swipe(
              trackerStore: widget.coordinator.swipe,
              child: Stack(
                children: [
                  SizedBox(
                    width: constraints.widthConstraints().maxHeight,
                    height: constraints.heightConstraints().maxWidth,
                    child: NewSmartBeachWaves(
                      store: widget.coordinator.widgets.newBeachWaves,
                    ),
                  ),
                  Center(
                    child: CollaborativeTextEditor(
                      fadeInDuration: Seconds.get(1),
                      trackerStore:
                          widget.coordinator.widgets.collaborativeTextUI,
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
                            stateTrackerStore:
                                widget.coordinator.widgets.gesturePillStore,
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
            ),
          )),
    );
  }
}
