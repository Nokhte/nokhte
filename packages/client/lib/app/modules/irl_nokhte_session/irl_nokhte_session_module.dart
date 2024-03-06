import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/presentation/presentation.dart';
import 'shared/shared_irl_nokhte_session_module.dart';

class IrlNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        SharedIrlNokhteSessionModule(),
      ];

  @override
  void routes(r) {
    r.child(
      transition: TransitionType.noTransition,
      '/',
      child: (context) => IrlNokhteSessionPhase0Screen(
        coordinator: Modular.get<IrlNokhteSessionPhase0Coordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/talking',
      child: (context) => const IrlNokhteSessionTalkingPlaceHolderScreen(),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/notes',
      child: (context) => const IrlNokhteSessionNotesPlaceHolderScreen(),
    );
  }
}
