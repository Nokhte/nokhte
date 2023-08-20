// speak_the_collaborator_phrase_screen.dart
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_size_calculator.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/widgets/smart_beach_waves.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swipe/swipe.dart';

import '../../../../core/widgets/breathing_pentagons/stack/presentation/widgets/breathing_pentagons_button/breathing_pentagons_button.dart';
// import 'package:flutter_modular/flutter_modular.dart';

class SpeakTheCollaboratorPhraseScreen extends StatelessWidget {
  final SupabaseClient supabase;
  final BeachWavesTrackerStore beachWavesStateTrackerStore;
  final BreathingPentagonsStateTrackerStore breathingPentagonsStateTrackerStore;
  final double startingWaveMovement;

  SpeakTheCollaboratorPhraseScreen({
    Key? key,
    required this.supabase,
    required this.beachWavesStateTrackerStore,
    required this.breathingPentagonsStateTrackerStore,
    required this.startingWaveMovement,
  }) : super(key: key) {
    beachWavesStateTrackerStore.teeOceanDiveMovieUp(
        startingWaterMovement: startingWaveMovement);
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
                onSwipeDown: () => beachWavesStateTrackerStore
                    .collaboratorPhraseSwipeDownCallback(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: beachWavesStateTrackerStore,
                  ),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child:
                        Container(), // Empty SizedBox to take up available space
                  ),
                  GestureDetector(
                    onTap: () => breathingPentagonsStateTrackerStore
                        .gestureFunctionRouter(),
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
                          stateTrackerStore:
                              breathingPentagonsStateTrackerStore,
                        ),
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
        );
      },
    );
    // });
  }
}
