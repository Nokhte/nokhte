import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

class GetPreferredPreset
    implements AbstractFutureLogic<PreferredPresetEntity, NoParams> {
  final UserInformationContract contract;

  GetPreferredPreset({required this.contract});

  @override
  call(params) async => await contract.getPreferredPreset(params);
}
