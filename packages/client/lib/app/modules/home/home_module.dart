import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/types/types.dart';
import 'package:primala/app/modules/home/presentation/screens/home_screen.dart';
// import 'package:primala/app/core/widgets/breathing_pentagons_stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/main/beach_waves_tracker_store.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:primala/app/modules/home/presentation/screens/home_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(defaultMovieMode: MovieModes.onShore),
        ),
      ];
  // List<Bind> get binds => [
  //       Bind.singleton<SupabaseClient>(
  //         (i) => Modular.get<SupabaseClient>(),
  //       ),
  //     ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          transition: TransitionType.noTransition,
          child: (context, args) => HomeScreen(
            stateTrackerStore: Modular.get<BeachWavesTrackerStore>(),
            supabase: Modular.get<SupabaseClient>(),
            //     Modular.get<BreathingPentagonsStateTrackerStore>(),
            // supabase: Modular.get<SupabaseClient>(),
          ),
        )
      ];
}
