import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/presentation/mobx/smart_fading_animated_text_tracker_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/views/speak_the_collaborator_phrase_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class P2PCollaboratorPoolModule extends Module {
  @override
  List<Bind> get binds => [
        // & Remote Source
        // & Contract Implementation
        // & Logic
        // & MobX Getter Stores
        // & Mobx Mother Stores
        // & Widget State Management Stores
        Bind.singleton<SmartFadingAnimatedTextTrackerStore>((i) =>
            SmartFadingAnimatedTextTrackerStore(
                messagesData: MessagesData.speakTheCollaboratorPhraseList)),
        Bind.singleton<BreathingPentagonsStateTrackerStore>(
          (i) => BreathingPentagonsStateTrackerStore(),
        ),
        Bind.singleton<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
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
            smartFadingAnimatedTextTrackerStore:
                Modular.get<SmartFadingAnimatedTextTrackerStore>(),
            breathingPentagonsStateTrackerStore:
                Modular.get<BreathingPentagonsStateTrackerStore>(),
            startingWaveMovement: args.data,
            beachWavesStateTrackerStore: Modular.get<BeachWavesTrackerStore>(),
            supabase: Modular.get<SupabaseClient>(),
          ),
          transition: TransitionType.noTransition,
        )
      ];
}
