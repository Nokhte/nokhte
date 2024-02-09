import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/nokhte_session/domain/domain.dart';

class DeleteActiveNokhteSession implements AbstractFutureLogic<bool, NoParams> {
  final NokhteSessionContract contract;

  DeleteActiveNokhteSession({required this.contract});

  @override
  call(params) async => await contract.deleteActiveNokhteSession(params);
}
