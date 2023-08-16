import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/constants/types/movie_modes.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/presentation/mobx/main/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/breathing_pentagons_stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/views/speak_the_collaborator_phrase_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class P2PCollaboratorPoolModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<BreathingPentagonsStateTrackerStore>(
          (i) => BreathingPentagonsStateTrackerStore(),
        ),
        Bind.singleton<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(defaultMovieMode: MovieModes.oceanDive),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        /// Ok so here is where we actually can pass it, so I think this may
        /// mean 2 separate stores or we have a store with a parameter as to which
        /// movie to start with I think that should probably be the move here so what is the first step
        ChildRoute(
          "/",
          child: (context, args) => SpeakTheCollaboratorPhraseScreen(
            startingWaveMovement: args.data,
            stateTrackerStore: Modular.get<BeachWavesTrackerStore>(),
            supabase: Modular.get<SupabaseClient>(),
          ),
          transition: TransitionType.noTransition,
        )
      ];
}
