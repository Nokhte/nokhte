import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/modules/purpose_session/data/data.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/mobx/coordinators/phase_one/phase_one.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/views/purpose_session_phase_one_greeter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'purpose_session_widgets_module.dart';

class PurposeSessionModule extends Module {
  @override
  List<Module> get imports => [
        PurposeSessionWidgetsModule(),
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
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => PurposeSessionPhaseOneGreeter(
        coordinator: Modular.get<PurposeSessionPhaseOneCoordinator>(),
      ),
    );
  }
}
