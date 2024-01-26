import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class MoveToFinishedDocs
    implements
        AbstractFutureLogic<CollaborativeDocMoveToFinishedDocsStatusEntity,
            MoveToFinishedDocsParams> {
  final CollaborativeDocContract contract;

  MoveToFinishedDocs({required this.contract});

  @override
  call(params) async => await contract.moveToFinishedDocs(params);
}

class MoveToFinishedDocsParams extends Equatable {
  final String docContent;
  final String docType;

  const MoveToFinishedDocsParams({
    required this.docContent,
    required this.docType,
  });

  @override
  List<Object> get props => [docContent, docType];
}
