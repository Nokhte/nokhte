import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

class UpdateHasAccessedQrCode implements AbstractFutureLogic<bool, bool> {
  final UserInformationContract contract;

  UpdateHasAccessedQrCode({required this.contract});

  @override
  call(params) async => await contract.updateHasAccessedQrCode(params);
}
