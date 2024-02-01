import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/nokhte_session/domain/domain.dart';

class CheckIfUserHasTheQuestion implements AbstractFutureLogic<bool, NoParams> {
  final NokhteSessionContract contract;

  CheckIfUserHasTheQuestion({required this.contract});

  @override
  call(params) async => await contract.checkIfUserHasTheQuestion(params);
}
