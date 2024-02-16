import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

class DeleteActiveNokhteSession implements AbstractFutureLogic<bool, NoParams> {
  final DeleteUnconsecratedCollaborationsContract contract;

  DeleteActiveNokhteSession({required this.contract});

  @override
  call(params) async => await contract.deleteActiveNokhteSession(params);
}
