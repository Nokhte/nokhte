import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class UpdateCommitDesireStatus
    implements
        AbstractFutureLogic<CollaborativeDocUpdateCommitDesireStatusEntity,
            UpdateCommitDesireStatusParams> {
  final CollaborativeDocContract contract;

  UpdateCommitDesireStatus({required this.contract});

  @override
  call(params) async => await contract.updateCommitDesireStatus(
        wantsToCommit: params.wantsToCommit,
      );
}

class UpdateCommitDesireStatusParams extends Equatable {
  final bool wantsToCommit;
  const UpdateCommitDesireStatusParams({
    required this.wantsToCommit,
  });
  @override
  List<Object> get props => [];
}
