import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/widget_modules/perspectives_widgets_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/data/data.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class P2PPerspectivesSessionModule extends Module {
  @override
  List<Module> get imports => [
        VoiceCallModule(),
        PerspectivesWidgetsModule(),
        GyroscopicModule(),
        VoiceCallModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.singleton<P2PPerspectivesSessionRemoteSourceImpl>(
          (i) => P2PPerspectivesSessionRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        Bind.singleton<P2PPerspectivesSessionContractImpl>(
          (i) => P2PPerspectivesSessionContractImpl(
              remoteSource: i<P2PPerspectivesSessionRemoteSource>(),
              networkInfo: Modular.get<NetworkInfoImpl>()),
        ),
        Bind.singleton<CommitThePerspectives>(
          (i) => CommitThePerspectives(
            contract: i<P2PPerspectivesSessionContractImpl>(),
          ),
        ),
        Bind.singleton<CreateAPerspectivesSession>(
          (i) => CreateAPerspectivesSession(
            contract: i<P2PPerspectivesSessionContractImpl>(),
          ),
        ),
        Bind.singleton<GetPerspectivesStream>(
          (i) => GetPerspectivesStream(
            contract: i<P2PPerspectivesSessionContractImpl>(),
          ),
        ),
        Bind.singleton<UpdateCurrentQuadrant>(
          (i) => UpdateCurrentQuadrant(
            contract: i<P2PPerspectivesSessionContractImpl>(),
          ),
        ),
        Bind.singleton<UpdateTheStagingArea>(
          (i) => UpdateTheStagingArea(
            contract: i<P2PPerspectivesSessionContractImpl>(),
          ),
        ),
        Bind.singleton<CommitThePerspectivesGetterStore>(
          (i) => CommitThePerspectivesGetterStore(
            logic: i<CommitThePerspectives>(),
          ),
        ),
        Bind.singleton<CreateAPerspectivesSessionGetterStore>(
          (i) => CreateAPerspectivesSessionGetterStore(
            logic: i<CreateAPerspectivesSession>(),
          ),
        ),
        Bind.singleton<GetPerspectivesStreamGetterStore>(
          (i) => GetPerspectivesStreamGetterStore(
            logic: i<GetPerspectivesStream>(),
          ),
        ),
        Bind.singleton<UpdateCurrentQuadrantGetterStore>(
          (i) => UpdateCurrentQuadrantGetterStore(
            logic: i<UpdateCurrentQuadrant>(),
          ),
        ),
        Bind.singleton<UpdateTheStagingAreaGetterStore>(
          (i) => UpdateTheStagingAreaGetterStore(
            logic: i<UpdateTheStagingArea>(),
          ),
        ),
        Bind.singleton<CommitThePerspectivesStore>(
          (i) => CommitThePerspectivesStore(
            getterStore: i<CommitThePerspectivesGetterStore>(),
          ),
        ),
        Bind.singleton<CreateAPerspectivesSessionStore>(
          (i) => CreateAPerspectivesSessionStore(
            getterStore: i<CreateAPerspectivesSessionGetterStore>(),
          ),
        ),
        Bind.singleton<GetPerspectivesStreamStore>(
          (i) => GetPerspectivesStreamStore(
            getterStore: i<GetPerspectivesStreamGetterStore>(),
          ),
        ),
        Bind.singleton<UpdateCurrentQuadrantStore>(
          (i) => UpdateCurrentQuadrantStore(
            getterStore: i<UpdateCurrentQuadrantGetterStore>(),
          ),
        ),
        Bind.singleton<UpdateTheStagingAreaStore>(
          (i) => UpdateTheStagingAreaStore(
            getterStore: i<UpdateTheStagingAreaGetterStore>(),
          ),
        ),
        Bind.singleton<PerspectivesWidgetsCoordinatorStore>(
          (i) => PerspectivesWidgetsCoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            collaborativeTextEditor:
                Modular.get<CollaborativeTextEditorTrackerStore>(),
            beachHorizonWater: Modular.get<BeachHorizonWaterTrackerStore>(),
            beachSky: Modular.get<BeachSkyStore>(),
            perspectivesMap: Modular.get<PerspectivesMapStore>(),
          ),
        ),
        Bind.singleton<P2PPerspectiveSessionCoordinatorStore>(
          (i) => P2PPerspectiveSessionCoordinatorStore(
            getChannelId: Modular.get<GetChannelIdStore>(),
            voiceCallActions: Modular.get<VoiceCallActionsStore>(),
            instantiateAgoraSdk: Modular.get<InstantiateAgoraSdkStore>(),
            getAgoraToken: Modular.get<GetAgoraTokenStore>(),
            swipe: i<SwipeDetector>(),
            widgets: i<PerspectivesWidgetsCoordinatorStore>(),
            voiceCall: Modular.get<VoiceCallActionsStore>(),
            quadrantAPI: Modular.get<QuadrantAPI>(),
            commitThePerspectives: i<CommitThePerspectivesStore>(),
            createSession: i<CreateAPerspectivesSessionStore>(),
            perspectivesStream: i<GetPerspectivesStreamStore>(),
            updateQuadStore: i<UpdateCurrentQuadrantStore>(),
            updateStaging: i<UpdateTheStagingAreaStore>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => PerspectivesSessionScreen(
            coordinator: Modular.get<P2PPerspectiveSessionCoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
      ];
}
