import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/data/contracts/user_information_contract_impl.dart';

class UpdateHasEnteredStorage implements AbstractFutureLogic<bool, bool> {
  final UserInformationContractImpl contract;

  UpdateHasEnteredStorage({required this.contract});

  @override
  call(params) async => await contract.updateHasEnteredStorage(params);
}
