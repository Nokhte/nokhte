import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/login/domain/contracts/login_contract.dart';

class AddName extends AbstractFutureLogic<bool, NoParams> {
  final LoginContract contract;

  AddName({required this.contract});

  @override
  call(NoParams params) async => await contract.addName(params);
}
