import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class UpdateCollaborativeDoc extends AbstractFutureLogic<
    CollaborativeDocUpdateStatusEntity, UpdateCollaborativeDocParams> {
  final CollaborativeDocContract contract;

  UpdateCollaborativeDoc({required this.contract});

  @override
  call(params) async =>
      await contract.updateCollaborativeDoc(newContent: params.newContent);
}

class UpdateCollaborativeDocParams extends Equatable {
  final String newContent;

  const UpdateCollaborativeDocParams({required this.newContent});

  @override
  List<Object> get props => [newContent];
}
