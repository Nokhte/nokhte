import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

class UpdatePreferredPreset implements AbstractFutureLogic<bool, String> {
  final UserInformationContract contract;

  UpdatePreferredPreset({required this.contract});

  @override
  call(params) async => await contract.updatePreferredPreset(params);
}
