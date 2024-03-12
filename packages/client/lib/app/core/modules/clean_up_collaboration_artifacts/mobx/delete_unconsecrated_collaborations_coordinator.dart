// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
part 'delete_unconsecrated_collaborations_coordinator.g.dart';

class DeleteUnconsecratedCollaborationsCoordinator = _DeleteUnconsecratedCollaborationsCoordinatorBase
    with _$DeleteUnconsecratedCollaborationsCoordinator;

abstract class _DeleteUnconsecratedCollaborationsCoordinatorBase
    extends BaseMobxDBStore<NoParams, bool> with Store {
  final CollaborationLogicCoordinator collaborationLogicCoordinator;
  final DeleteIrlActiveNokhteSession deleteIrlActiveNokhteSession;

  _DeleteUnconsecratedCollaborationsCoordinatorBase({
    required this.collaborationLogicCoordinator,
    required this.deleteIrlActiveNokhteSession,
  });

  @override
  @action
  Future<void> call(NoParams params) async {
    state = StoreState.loading;
    await collaborationLogicCoordinator.exit();
    await deleteIrlActiveNokhteSession(NoParams());
    state = StoreState.loaded;
  }
}
