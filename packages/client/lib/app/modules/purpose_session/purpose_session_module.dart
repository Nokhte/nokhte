import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/modules/purpose_session/data/data.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'purpose_session_widgets_module.dart';

class PurposeSessionModule extends Module {
  @override
  List<Module> get imports => [
        PurposeSessionWidgetsModule(),
        VoiceCallModule(),
        LegacyConnectivityModule(),
      ];
  @override
  void binds(i) {
    i.add<PurposeSessionRemoteSourceImpl>(
      () => PurposeSessionRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<PurposeSessionPhaseOneCoordinator>(
      () => PurposeSessionPhaseOneCoordinator(
          widgets: Modular.get<PurposeSessionPhaseOneWidgetsCoordinator>(),
          voiceCall: Modular.get<VoiceCallCoordinator>()),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => PurposeSessionPhaseOneConsultation(
        coordinator: Modular.get<PurposeSessionPhaseOneCoordinator>(),
      ),
    );
  }
}
