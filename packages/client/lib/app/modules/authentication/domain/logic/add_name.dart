import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/authentication/domain/contracts/authentication_contract.dart';

class AddName extends AbstractFutureLogic<bool, NoParams> {
  final AuthenticationContract contract;

  AddName({required this.contract});

  @override
  call(NoParams params) async => await contract.addName(params);
}
