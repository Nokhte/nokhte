import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/modules/nokhte_session/presentation/presentation.dart';
import 'nokhte_session_widgets_module.dart';

class NokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        NokhteSessionWidgetsModule(),
      ];

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => NokhteSessionPhase0Greeter(
        coordinator: Modular.get<NokhteSessionPhase0WidgetsCoordinator>(),
      ),
    );
  }
}