import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

class DeleteSoloDocument
    implements AbstractFutureLogic<bool, DeleteSoloDocumentParams> {
  final DeleteUnconsecratedCollaborationsContract contract;

  DeleteSoloDocument({required this.contract});

  @override
  call(params) async => await contract.deleteSoloDocument(params);
}

class DeleteSoloDocumentParams extends Equatable {
  final String ownerUID;
  final String collaboratorUID;

  const DeleteSoloDocumentParams({
    required this.ownerUID,
    required this.collaboratorUID,
  });

  @override
  List<Object> get props => [ownerUID, collaboratorUID];
}
