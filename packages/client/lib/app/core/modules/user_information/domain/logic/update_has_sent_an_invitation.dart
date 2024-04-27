import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

class UpdateHasSentAnInvitation implements AbstractFutureLogic<bool, bool> {
  final UserInformationContract contract;

  UpdateHasSentAnInvitation({required this.contract});

  @override
  call(params) async => await contract.updateHasSentAnInvitation(params);
}
