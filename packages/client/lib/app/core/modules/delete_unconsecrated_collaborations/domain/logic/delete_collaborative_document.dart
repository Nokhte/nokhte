import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

class DeleteCollaborativeDocument
    implements AbstractFutureLogic<bool, NoParams> {
  final DeleteUnconsecratedCollaborationsContract contract;

  DeleteCollaborativeDocument({required this.contract});

  @override
  call(params) async => await contract.deleteCollaborativeDocument(params);
}