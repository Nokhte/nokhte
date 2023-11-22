import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';

class SpeakTheCollaboratorPhraseScreen extends StatefulWidget {
  final SpeakTheCollaboratorPhraseCoordinatorStore coordinator;

  const SpeakTheCollaboratorPhraseScreen({
    super.key,
    required this.coordinator,
  });

  @override
  State<SpeakTheCollaboratorPhraseScreen> createState() =>
      _SpeakTheCollaboratorPhraseScreenState();
}

class _SpeakTheCollaboratorPhraseScreenState
    extends State<SpeakTheCollaboratorPhraseScreen> {
  @override
  initState() {
    super.initState();
    widget.coordinator.screenConstructor();
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
            trackerStore: widget.coordinator.swipe,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: widget.coordinator.beachWaves,
                  ),
                ),
                Center(
                  child: SmartFadingAnimatedText(
                    stateTrackerStore: widget.coordinator.fadingTextStore,
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
                      trackerStore: widget.coordinator.explanationText,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                    ),
                    Hold(
                      trackerStore: widget.coordinator.hold,
                      child: MeshCircleButton(
                        trackerStore: widget.coordinator.meshCircleStore,
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
