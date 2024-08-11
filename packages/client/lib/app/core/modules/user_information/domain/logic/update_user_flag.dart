import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

class UpdateUserFlag implements AbstractFutureLogic<bool, UserFlagParam> {
  final UserInformationContractImpl contract;

  UpdateUserFlag({required this.contract});

  @override
  call(params) async => await contract.updateUserFlag(params);
}
