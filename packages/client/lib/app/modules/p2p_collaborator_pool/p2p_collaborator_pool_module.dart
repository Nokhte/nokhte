import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/breathing_pentagons_stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/views/speak_the_collaborator_phrase_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class P2PCollaboratorPoolModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<BreathingPentagonsStateTrackerStore>(
          (i) => BreathingPentagonsStateTrackerStore(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => SpeakTheCollaboratorPhraseScreen(
            stateTrackerStore:
                Modular.get<BreathingPentagonsStateTrackerStore>(),
            supabase: Modular.get<SupabaseClient>(),
          ),
        )
      ];
}
