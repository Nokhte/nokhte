import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class UpdateCollaborativeDoc extends AbstractFutureLogic<
    CollaborativeDocUpdateStatusEntity, UpdateCollaborativeDocParams> {
  final CollaborativeDocContract contract;

  UpdateCollaborativeDoc({required this.contract});

  @override
  call(params) async => await contract.updateCollaborativeDoc(
        newContent: params.newContent,
        isAnUpdateFromCollaborator: params.isAnUpdateFromCollaborator,
      );
}

class UpdateCollaborativeDocParams extends Equatable {
  final String newContent;
  final bool isAnUpdateFromCollaborator;

  const UpdateCollaborativeDocParams({
    required this.newContent,
    required this.isAnUpdateFromCollaborator,
  });

  @override
  List<Object> get props => [
        newContent,
        isAnUpdateFromCollaborator,
      ];
}
