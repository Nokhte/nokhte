import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/collaborator_presence_module.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/mobx/coordinators/collaborator_presence_coordinator.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/purpose_session/data/data.dart';
import 'package:nokhte/app/modules/purpose_session/domain/logic/logic.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'purpose_session_widgets_module.dart';

class PurposeSessionModule extends Module {
  @override
  List<Module> get imports => [
        PurposeSessionWidgetsModule(),
        VoiceCallModule(),
        LegacyConnectivityModule(),
        CollaboratorPresenceModule(),
        GesturesModule(),
      ];
  @override
  void binds(i) {
    i.add<PurposeSessionRemoteSourceImpl>(
      () => PurposeSessionRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<PurposeSessionContractImpl>(
      () => PurposeSessionContractImpl(
        remoteSource: Modular.get<PurposeSessionRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<CheckIfUserHasTheQuestion>(
      () => CheckIfUserHasTheQuestion(
        contract: Modular.get<PurposeSessionContractImpl>(),
      ),
    );
    i.add<CheckIfUserHasTheQuestionStore>(
      () => CheckIfUserHasTheQuestionStore(
        logic: Modular.get<CheckIfUserHasTheQuestion>(),
      ),
    );
    i.add<PurposeSessionPhase1Coordinator>(
      () => PurposeSessionPhase1Coordinator(
          hold: Modular.get<HoldDetector>(),
          checkIfUserHasTheQuestion:
              Modular.get<CheckIfUserHasTheQuestionStore>(),
          collaboratorPresence: Modular.get<CollaboratorPresenceCoordinator>(),
          widgets: Modular.get<PurposeSessionPhase1WidgetsCoordinator>(),
          voiceCall: Modular.get<VoiceCallCoordinator>()),
    );

    i.add<PurposeSessionPhase2Coordinator>(
      () => PurposeSessionPhase2Coordinator(
        widgets: Modular.get<PurposeSessionPhase2WidgetsCoordinator>(),
      ),
    );

    i.add<PurposeSessionPhase3Coordinator>(
      () => PurposeSessionPhase3Coordinator(
        widgets: Modular.get<PurposeSessionPhase3WidgetsCoordinator>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => PurposeSessionPhase0Greeter(
        coordinator: Modular.get<PurposeSessionPhase0WidgetsCoordinator>(),
      ),
    );
    r.child(
      '/phase_one',
      transition: TransitionType.noTransition,
      child: (context) => PurposeSessionPhase1Consultation(
        coordinator: Modular.get<PurposeSessionPhase1Coordinator>(),
      ),
    );
    r.child(
      '/phase_two',
      transition: TransitionType.noTransition,
      child: (context) => PurposeSessionPhase2Reflection(
        coordinator: Modular.get<PurposeSessionPhase2Coordinator>(),
      ),
    );
    r.child(
      '/phase_three',
      transition: TransitionType.noTransition,
      child: (context) => PurposeSessionPhase3ExpandTheirIdeas(
        coordinator: Modular.get<PurposeSessionPhase3Coordinator>(),
      ),
    );
  }
}
