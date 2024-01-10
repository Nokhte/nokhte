// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
part 'collaborator_pool_screen_coordinator.g.dart';

class CollaboratorPoolScreenCoordinator = _CollaboratorPoolScreenCoordinatorBase
    with _$CollaboratorPoolScreenCoordinator;

abstract class _CollaboratorPoolScreenCoordinatorBase extends BaseCoordinator
    with Store {
  final CollaboratorPoolScreenWidgetsCoordinator widgets;
  final CancelCollaboratorSearchStreamStore cancelCollaboratorSearchStream;
  final ExitCollaboratorPoolStore exitCollaboratorPool;

  _CollaboratorPoolScreenCoordinatorBase({
    required this.widgets,
    required this.cancelCollaboratorSearchStream,
    required this.exitCollaboratorPool,
  });

  @action
  constructor() {
    widgets.constructor();
  }
}
