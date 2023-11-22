// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

class P2PPurpose2ConsultationScreen extends StatelessWidget
    with WidgetsBindingObserver {
  final bool isInitialLoad = true;
  final P2PPurposePhase2CoordinatorStore coordinator;
  P2PPurpose2ConsultationScreen({
    super.key,
    required this.coordinator,
  }) {
    WidgetsBinding.instance.addObserver(this);
    coordinator.screenConstructor();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      coordinator.setAppState(state);

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
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SmartBeachWaves(
                          stateTrackerStore: coordinator.beachWaves,
                        ),
                      ),
                      Center(
                        child: SmartFadingAnimatedText(
                          stateTrackerStore: coordinator.fadingText,
                        ),
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          ExplanationText(
                            chosenFont: GoogleFonts.montserrat(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                            trackerStore: coordinator.explanationText,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 15),
                          ),
                          Hold(
                            trackerStore: coordinator.hold,
                            child: Container(
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
                ));
          })),
    );
  }
}
