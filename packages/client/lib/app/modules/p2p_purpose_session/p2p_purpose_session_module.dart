import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/views/p2p_purpose_session_screen.dart';

class P2PCollaboratorSessionModule extends Module {
  @override
  List<Bind> get binds => [
        // & Remote Source
        // & Contract Implementation
        // & Logic
        // & MobX Getter Stores
        // & Mobx Mother Stores
        // & Widget State Management Stores
        Bind.factory<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        // & Widget Manager Store
        // & Coordinator Stores
      ];
  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => P2PPurposeSessionScreen(
            beachWavesStore: Modular.get<BeachWavesTrackerStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
      ];
}
