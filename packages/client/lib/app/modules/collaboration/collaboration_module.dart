import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'collaboration_widgets_module.dart';

class CollaborationModule extends Module {
  @override
  List<Module> get imports => [
        CollaborationWidgetsModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<CollaborationHomeCoordinator>(
      () => CollaborationHomeCoordinator(
        widgets: Modular.get<CollaborationHomeWidgetsCoordinator>(),
      ),
    );
    //
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => CollaborationHomeScreen(
        coordinator: Modular.get<CollaborationHomeCoordinator>(),
      ),
    );
    //
  }
}
