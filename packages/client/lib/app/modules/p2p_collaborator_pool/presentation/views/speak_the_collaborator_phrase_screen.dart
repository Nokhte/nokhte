// speak_the_collaborator_phrase_screen.dart
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart' hide AnimationStatus;
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_size_calculator.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/types/gestures.dart';
// import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/types/gestures.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swipe/swipe.dart';
// import 'package:flutter_modular/flutter_modular.dart';

class SpeakTheCollaboratorPhraseScreen extends StatelessWidget {
  final SupabaseClient supabase;
  final SpeakTheCollaboratorPhraseCoordinatorStore coordinatorStore;
  final double startingWaveMovement;

  SpeakTheCollaboratorPhraseScreen({
    Key? key,
    required this.supabase,
    required this.coordinatorStore,
    required this.startingWaveMovement,
  }) : super(key: key) {
    coordinatorStore.speechToTextStore.initSpeech();
    coordinatorStore.widgetStore.beachWavesStore
        .teeOceanDiveMovieUp(startingWaterMovement: startingWaveMovement);
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .50,
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        return PlatformScaffold(
          body: Stack(
            children: [
              Swipe(
                onSwipeDown: () => coordinatorStore.widgetStore
                    .collaboratorPhraseSwipeDownCallback(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore:
                        coordinatorStore.widgetStore.beachWavesStore,
                  ),
                ),
              ),
              // Observer(builder: (context) { return
              Column(
                children: [
                  Expanded(
                    child:
                        Container(), // Empty SizedBox to take up available space
                  ),
                  GestureDetector(
                    onLongPressStart: (_) =>
                        coordinatorStore.breathingPentagonsHoldStartCallback(),
                    onLongPressEnd: (_) {
                      coordinatorStore.breathingPentagonsHoldEndCallback();

                      // coordinatorStore.onSpeechResultStore.currentPhraseIndex++;
                    },
                    child: Container(
                      height: size.height,
                      width: size.width,
                      child: Center(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: BreathingPentagonsButton(
                          fadeInDelay: const Duration(seconds: 4),
                          fadeInDuration: const Duration(seconds: 4),
                          size: size,
                          stateTrackerStore: coordinatorStore
                              .widgetStore.breathingPentagonsStore,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                  ),
                ],
              ),
              //   );
              // }),
              Observer(builder: (context) {
                final onSpeechResStore = coordinatorStore.onSpeechResultStore;
                final fadingTextStore =
                    coordinatorStore.widgetStore.smartFadingAnimatedTextStore;
                final validateQueryStore = coordinatorStore.validateQueryStore;
                reaction((p0) => onSpeechResStore.currentPhraseIndex, (p0) {
                  fadingTextStore.togglePause(gestureType: Gestures.none);
                  fadingTextStore.addNewMessage(
                    mainMessage: onSpeechResStore.currentSpeechResult,
                  );

                  print(fadingTextStore.messagesData);
                });
                reaction((p0) => validateQueryStore.isNotProperLength, (p0) {
                  print("IS THIS THING RUNNING??");
                  if (validateQueryStore.isNotProperLength == true) {
                    fadingTextStore.changeFutureSubMessage(
                        amountOfMessagesForward:
                            onSpeechResStore.currentPhraseIndex == 1 ? 2 : 1,
                        message: "collaborator phrases are only 2 words");
                    print(fadingTextStore.messagesData);
                  }
                });
                return Center(
                    child: SmartFadingAnimatedText(
                  initialFadeInDelay: const Duration(seconds: 3),
                  stateTrackerStore:
                      coordinatorStore.widgetStore.smartFadingAnimatedTextStore,
                ));
              }),
            ],
          ),
        );
      },
    );
    // });
  }
}
