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
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/presentation/mobx/coordinators/logic/nokhte_session_logic_coordinator.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/presentation/presentation.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/presentation/views/nokhte_session_phase2_wait_to_exit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'nokhte_session_widgets_module.dart';

class NokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        NokhteSessionWidgetsModule(),
        LegacyConnectivityModule(),
        GesturesModule(),
        VoiceCallModule(),
        NokhteSessionPresenceModule(),
        PosthogModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<NokhteSessionRemoteSourceImpl>(
      () => NokhteSessionRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<NokhteSessionContractImpl>(
      () => NokhteSessionContractImpl(
        remoteSource: Modular.get<NokhteSessionRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<CheckIfUserHasTheQuestion>(
      () => CheckIfUserHasTheQuestion(
        contract: Modular.get<NokhteSessionContractImpl>(),
      ),
    );
    i.add<ChangeDesireToLeave>(
      () => ChangeDesireToLeave(
        contract: Modular.get<NokhteSessionContractImpl>(),
      ),
    );
    i.add<NokhteSessionLogicCoordinator>(
      () => NokhteSessionLogicCoordinator(
        checkIfUserHasTheQuestionLogic:
            Modular.get<CheckIfUserHasTheQuestion>(),
        changeDesireToLeaveLogic: Modular.get<ChangeDesireToLeave>(),
      ),
    );

    i.add<NokhteSessionPhase0Coordinator>(
      () => NokhteSessionPhase0Coordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        captureNokhteSessionStart: Modular.get<CaptureNokhteSessionStart>(),
        widgets: Modular.get<NokhteSessionPhase0WidgetsCoordinator>(),
      ),
    );
    i.add<NokhteSessionPhase1Coordinator>(
      () => NokhteSessionPhase1Coordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        voiceCall: Modular.get<VoiceCallCoordinator>(),
        hold: Modular.get<HoldDetector>(),
        swipe: Modular.get<SwipeDetector>(),
        logic: Modular.get<NokhteSessionLogicCoordinator>(),
        widgets: Modular.get<NokhteSessionPhase1WidgetsCoordinator>(),
        presence: Modular.get<NokhteSessionPresenceCoordinator>(),
      ),
    );
    i.add<NokhteSessionPhase2Coordinator>(
      () => NokhteSessionPhase2Coordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        captureNokhteSessionEnd: Modular.get<CaptureNokhteSessionEnd>(),
        voiceCall: Modular.get<VoiceCallCoordinator>(),
        hold: Modular.get<HoldDetector>(),
        swipe: Modular.get<SwipeDetector>(),
        logic: Modular.get<NokhteSessionLogicCoordinator>(),
        widgets: Modular.get<NokhteSessionPhase2WidgetsCoordinator>(),
        presence: Modular.get<NokhteSessionPresenceCoordinator>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => NokhteSessionPhase0Greeter(
        coordinator: Modular.get<NokhteSessionPhase0Coordinator>(),
      ),
    );
    r.child(
      '/phase_one',
      transition: TransitionType.noTransition,
      child: (context) => NokhteSessionPhase1Consulatation(
        coordinator: Modular.get<NokhteSessionPhase1Coordinator>(),
      ),
    );
    r.child(
      '/phase_two',
      transition: TransitionType.noTransition,
      child: (context) => NokhteSessionPhase2WaitToExit(
        coordinator: Modular.get<NokhteSessionPhase2Coordinator>(),
      ),
    );
  }
}
