import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class CreateCollaborativeDoc extends AbstractFutureLogic<
    CollaborativeDocCreationStatusEntity, CreateCollaborativeDocParams> {
  final CollaborativeDocContract contract;

  CreateCollaborativeDoc({
    required this.contract,
  });

  @override
  call(params) async =>
      await contract.createCollaborativeDoc(docType: params.docType);
}

class CreateCollaborativeDocParams extends Equatable {
  final String docType;

  const CreateCollaborativeDocParams({required this.docType});

  @override
  List<Object> get props => [docType];
}
