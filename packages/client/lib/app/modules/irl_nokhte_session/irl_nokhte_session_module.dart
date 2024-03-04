import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/presentation/presentation.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/presentation/views/nokhte_session_phase0_greeter_screen.dart';

import 'shared/shared_irl_nokhte_session_module.dart';

class IrlNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        SharedIrlNokhteSessionModule(),
      ];

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => IrlNokhteSessionPhase0Screen(
        coordinator: Modular.get<IrlNokhteSessionPhase0Coordinator>(),
      ),
    );
  }
}
