import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_logic_module.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'mobx/mobx.dart';

class DeleteUnconsecratedCollaborationsModule extends Module {
  @override
  List<Module> get imports => [
        CollaborationLogicModule(),
      ];
  @override
  void exportedBinds(i) {
    i.add<DeleteUnconsecratedCollaborationsCoordinator>(
      () => DeleteUnconsecratedCollaborationsCoordinator(
        collaborationLogicCoordinator:
            Modular.get<CollaborationLogicCoordinator>(),
      ),
    );
  }
}
