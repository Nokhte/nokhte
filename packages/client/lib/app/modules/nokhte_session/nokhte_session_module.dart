import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/modules/nokhte_session/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'nokhte_session_widgets_module.dart';

class NokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        NokhteSessionWidgetsModule(),
        NokhteSessionPresenceModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<NokhteSessionPhase0Coordinator>(
      () => NokhteSessionPhase0Coordinator(
        widgets: Modular.get<NokhteSessionPhase0WidgetsCoordinator>(),
      ),
    );
    i.add<NokhteSessionPhase1Coordinator>(
      () => NokhteSessionPhase1Coordinator(
        widgets: Modular.get<NokhteSessionPhase1WidgetsCoordinator>(),
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
      child: (context) => NokhteSessionPhase1(
        coordinator: Modular.get<NokhteSessionPhase1Coordinator>(),
      ),
    );
  }
}
