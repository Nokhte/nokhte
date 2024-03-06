// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
part 'delete_unconsecrated_collaborations_coordinator.g.dart';

class DeleteUnconsecratedCollaborationsCoordinator = _DeleteUnconsecratedCollaborationsCoordinatorBase
    with _$DeleteUnconsecratedCollaborationsCoordinator;

abstract class _DeleteUnconsecratedCollaborationsCoordinatorBase
    extends BaseMobxDBStore<NoParams, bool> with Store {
  final CollaborationLogicCoordinator collaborationLogicCoordinator;
  final DeleteIrlActiveNokhteSession deleteIrlActiveNokTheSession;

  _DeleteUnconsecratedCollaborationsCoordinatorBase({
    required this.collaborationLogicCoordinator,
    required this.deleteIrlActiveNokTheSession,
  });

  @override
  @action
  Future<void> call(NoParams params) async {
    state = StoreState.loading;
    await collaborationLogicCoordinator.exit();
    await deleteIrlActiveNokTheSession(NoParams());
    state = StoreState.loaded;
  }
}
