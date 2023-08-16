// speak_the_collaborator_phrase_screen.dart
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/presentation/mobx/main/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/presentation/widgets/smart_beach_waves.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swipe/swipe.dart';
// import 'package:flutter_modular/flutter_modular.dart';

class SpeakTheCollaboratorPhraseScreen extends StatelessWidget {
  final SupabaseClient supabase;
  final BeachWavesTrackerStore stateTrackerStore;
  final double startingWaveMovement;

  SpeakTheCollaboratorPhraseScreen({
    Key? key,
    required this.supabase,
    required this.stateTrackerStore,
    required this.startingWaveMovement,
  }) : super(key: key) {
    stateTrackerStore.teeOceanDiveMovieUp(
        startingWaterMovement: startingWaveMovement);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return PlatformScaffold(
          body: Stack(
            children: [
              Swipe(
                onSwipeDown: () =>
                    stateTrackerStore.collaboratorPhraseSwipeDownCallback(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: stateTrackerStore,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    // });
  }
}
