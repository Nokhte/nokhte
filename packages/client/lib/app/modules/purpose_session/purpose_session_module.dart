import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/modules/purpose_session/data/data.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/views/purpose_session_phase1_greeter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PurposeSessionModule extends Module {
  @override
  void binds(i) {
    i.add<PurposeSessionRemoteSourceImpl>(
      () => PurposeSessionRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => PurposeSessionPhase1Greeter(
        remoteSource: Modular.get<PurposeSessionRemoteSourceImpl>(),
      ),
    );
  }
}
