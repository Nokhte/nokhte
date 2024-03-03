import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/coordinator/voice_call_coordinator.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/data/data.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/domain/domain.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'legacy_virtual_nokhte_session_widgets_module.dart';

class LegacyNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        LegacyVirtualNokhteSessionWidgetsModule(),
        LegacyConnectivityModule(),
        GesturesModule(),
        VoiceCallModule(),
        NokhteSessionPresenceModule(),
        PosthogModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<LegacyVirtualNokhteSessionRemoteSourceImpl>(
      () => LegacyVirtualNokhteSessionRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<LegacyVirtualNokhteSessionContractImpl>(
      () => LegacyVirtualNokhteSessionContractImpl(
        remoteSource: Modular.get<LegacyVirtualNokhteSessionRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<CheckIfUserHasTheQuestion>(
      () => CheckIfUserHasTheQuestion(
        contract: Modular.get<LegacyVirtualNokhteSessionContractImpl>(),
      ),
    );
    i.add<ChangeDesireToLeave>(
      () => ChangeDesireToLeave(
        contract: Modular.get<LegacyVirtualNokhteSessionContractImpl>(),
      ),
    );
    i.add<LegacyVirtualNokhteSessionLogicCoordinator>(
      () => LegacyVirtualNokhteSessionLogicCoordinator(
        checkIfUserHasTheQuestionLogic:
            Modular.get<CheckIfUserHasTheQuestion>(),
        changeDesireToLeaveLogic: Modular.get<ChangeDesireToLeave>(),
      ),
    );

    i.add<LegacyVirtualNokhteSessionPhase0Coordinator>(
      () => LegacyVirtualNokhteSessionPhase0Coordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        captureNokhteSessionStart: Modular.get<CaptureNokhteSessionStart>(),
        widgets:
            Modular.get<LegacyVirtualNokhteSessionPhase0WidgetsCoordinator>(),
      ),
    );
    i.add<LegacyVirtualNokhteSessionPhase1Coordinator>(
      () => LegacyVirtualNokhteSessionPhase1Coordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        voiceCall: Modular.get<VoiceCallCoordinator>(),
        hold: Modular.get<HoldDetector>(),
        swipe: Modular.get<SwipeDetector>(),
        logic: Modular.get<LegacyVirtualNokhteSessionLogicCoordinator>(),
        widgets:
            Modular.get<LegacyVirtualNokhteSessionPhase1WidgetsCoordinator>(),
        presence: Modular.get<LegacyVirtualNokhteSessionPresenceCoordinator>(),
      ),
    );
    i.add<LegacyVirtualNokhteSessionPhase2Coordinator>(
      () => LegacyVirtualNokhteSessionPhase2Coordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        captureNokhteSessionEnd: Modular.get<CaptureNokhteSessionEnd>(),
        voiceCall: Modular.get<VoiceCallCoordinator>(),
        hold: Modular.get<HoldDetector>(),
        swipe: Modular.get<SwipeDetector>(),
        logic: Modular.get<LegacyVirtualNokhteSessionLogicCoordinator>(),
        widgets:
            Modular.get<LegacyVirtualNokhteSessionPhase2WidgetsCoordinator>(),
        presence: Modular.get<LegacyVirtualNokhteSessionPresenceCoordinator>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => LegacyVirtualNokhteSessionPhase0Greeter(
        coordinator: Modular.get<LegacyVirtualNokhteSessionPhase0Coordinator>(),
      ),
    );
    r.child(
      '/phase_one',
      transition: TransitionType.noTransition,
      child: (context) => LegacyVirtualNokhteSessionPhase1Consulatation(
        coordinator: Modular.get<LegacyVirtualNokhteSessionPhase1Coordinator>(),
      ),
    );
    r.child(
      '/phase_two',
      transition: TransitionType.noTransition,
      child: (context) => LegacyVirtualNokhteSessionPhase2WaitToExit(
        coordinator: Modular.get<LegacyVirtualNokhteSessionPhase2Coordinator>(),
      ),
    );
  }
}
