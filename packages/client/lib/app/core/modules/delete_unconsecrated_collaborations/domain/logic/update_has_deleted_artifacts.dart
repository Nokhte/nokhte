import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

class UpdateHasDeletedArtifacts implements AbstractFutureLogic<bool, bool> {
  final DeleteUnconsecratedCollaborationsContract contract;

  UpdateHasDeletedArtifacts({required this.contract});

  @override
  call(params) async => await contract.updateHasDeletedArtifacts(params);
}
