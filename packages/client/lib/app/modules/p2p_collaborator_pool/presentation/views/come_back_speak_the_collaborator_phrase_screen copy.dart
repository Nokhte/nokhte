// speak_the_collaborator_phrase_screen.dart
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_size_calculator.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/breathing_pentagons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';

class SpeakTheCollaboratorPhraseScreen extends StatelessWidget {
  final SupabaseClient supabase;
  final BreathingPentagonsStateTrackerStore stateTrackerStore;
  final double startingWaveMovement;

  const SpeakTheCollaboratorPhraseScreen({
    Key? key,
    required this.supabase,
    required this.stateTrackerStore,
    required this.startingWaveMovement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .50,
    );
    return LayoutBuilder(builder: (context, constraints) {
      // change back to platform scaffold later
      return PlatformScaffold(
        body: Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF66CF90),
                Color(0xFF88C9B9),
                Color(0xFF51A18D),
                Color(0xFF3E8077),
                Color(0xFF274D4F),
                Color(0xFF1D3741),
                Color(0xFF122430),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(), // Empty SizedBox to take up available space
              ),
              Observer(builder: (context) {
                return SafeArea(
                  child: GestureDetector(
                    onTap: () => stateTrackerStore.gestureFunctionRouter(),
                    child: Container(
                      // color: Colors.blue.withOpacity(.4),
                      height: size.height,
                      width: size.width,
                      child: Center(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: BreathingPentagonsButton(
                          size: size,
                          stateTrackerStore: stateTrackerStore,
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const Padding(
                padding: EdgeInsets.only(bottom: 40),
              ),
            ],
          ),
        ),
      );
    });
  }
}
