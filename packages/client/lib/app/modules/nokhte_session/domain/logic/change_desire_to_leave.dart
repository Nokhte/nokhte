import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/nokhte_session/domain/domain.dart';

class ChangeDesireToLeave implements AbstractFutureLogic<bool,ChangeDesireToLeaveParams> {
  final NokhteSessionContract contract;

 ChangeDesireToLeave({required this.contract});

  @override
  call(params) async => await contract.changeDesireToLeave(params);
}

enum ChangeDesireToLeaveParams  {
affirmative,
negative,
}
