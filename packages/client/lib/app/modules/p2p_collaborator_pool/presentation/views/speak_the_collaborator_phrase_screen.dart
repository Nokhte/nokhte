import 'package:flutter/material.dart' hide AnimationStatus;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';

class SpeakTheCollaboratorPhraseScreen extends StatelessWidget {
  final SpeakTheCollaboratorPhraseCoordinatorStore coordinatorStore;

  SpeakTheCollaboratorPhraseScreen({
    super.key,
    required this.coordinatorStore,
  }) {
    coordinatorStore.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Swipe(
            trackerStore: coordinatorStore.swipe,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinatorStore.beachWaves,
                  ),
                ),
                Observer(builder: (context) {
                  if (coordinatorStore.isReadyToEnterPool) {
                    Modular.to.navigate('/p2p_collaborator_pool/pool/');
                  }
                  return Center(
                      child: SmartFadingAnimatedText(
                    stateTrackerStore: coordinatorStore.fadingTextStore,
                  ));
                }),
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
                      trackerStore: coordinatorStore.explanationText,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                    ),
                    Hold(
                      trackerStore: coordinatorStore.hold,
                      child: MeshCircleButton(
                        trackerStore: coordinatorStore.meshCircleStore,
                        size: size,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
