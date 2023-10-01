// speak_the_collaborator_phrase_screen.dart
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart' hide AnimationStatus;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import 'package:swipe/swipe.dart';

class SpeakTheCollaboratorPhraseScreen extends StatelessWidget {
  final SpeakTheCollaboratorPhraseCoordinatorStore coordinatorStore;

  SpeakTheCollaboratorPhraseScreen({
    Key? key,
    required this.coordinatorStore,
  }) : super(key: key) {
    coordinatorStore.screenConstructorCallback(
      coordinatorStore: coordinatorStore,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        return PlatformScaffold(
          body: Swipe(
            onSwipeUp: () => coordinatorStore.swipeUpCallback(),
            onSwipeDown: () => coordinatorStore.swipeDownCallback(),
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinatorStore.beachWaves,
                  ),
                ),
                // Observer(builder: (context) { return
                Observer(builder: (context) {
                  if (coordinatorStore.isReadyToEnterPool) {
                    // navigation work in here
                    Modular.to.navigate('/p2p_collaborator_pool/pool/');
                  }
                  return Center(
                      child: SmartFadingAnimatedText(
                    initialFadeInDelay: const Duration(seconds: 0),
                    stateTrackerStore: coordinatorStore.fadingTextStore,
                  ));
                }),
                Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    GestureDetector(
                      onLongPressStart: (_) =>
                          coordinatorStore.audioButtonHoldStartCallback(),
                      onLongPressEnd: (_) {
                        coordinatorStore.audioButtonHoldEndCallback();
                      },
                      child: MeshCircleButton(
                        trackerStore: coordinatorStore.meshCircleStore,
                        size: size,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
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
