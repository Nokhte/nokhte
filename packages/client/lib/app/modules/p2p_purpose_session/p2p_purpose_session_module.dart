import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/views/views.dart';

/// shoot we forgot mute & unmute

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
          '/phase-1',
          child: (context, args) => P2PPurpose1GreeterScreen(
            /// stores:
            /// 1. beachWaves ==|====\
            /// 2. fadingText ==|======> beachWavesAndFadingTextWidgetStore
            /// 3. voiceCallActionsStore
            /// 4. instantiateAgoraSdk
            /// 5. fetchChannelId
            /// 6. AgoraCallbacksStore
            beachWavesStore: Modular.get<BeachWavesTrackerStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-2',
          child: (context, args) => P2PPurpose1GreeterScreen(
            /// stores:
            /// 1. beachWaves ==|====\
            /// 2. fadingText ==|======> beachWavesAndFadingTextWidgetStore
            /// 3. voiceCallActionsStore
            /// 4. instantiateAgoraSdk
            /// 5. fetchChannelId
            /// 6. AgoraCallbacksStore
            beachWavesStore: Modular.get<BeachWavesTrackerStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-3',
          child: (context, args) => P2PPurpose1GreeterScreen(
            beachWavesStore: Modular.get<BeachWavesTrackerStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-4',
          child: (context, args) => P2PPurpose1GreeterScreen(
            beachWavesStore: Modular.get<BeachWavesTrackerStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-5',
          child: (context, args) => P2PPurpose1GreeterScreen(
            beachWavesStore: Modular.get<BeachWavesTrackerStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
      ];
}
