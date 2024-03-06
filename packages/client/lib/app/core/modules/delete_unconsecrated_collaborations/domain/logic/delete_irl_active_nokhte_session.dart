import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

class DeleteIrlActiveNokhteSession
    implements AbstractFutureLogic<bool, NoParams> {
  final DeleteUnconsecratedCollaborationsContract contract;

  DeleteIrlActiveNokhteSession({required this.contract});

  @override
  call(params) async => await contract.deleteIrlActiveNokhteSession(params);
}
