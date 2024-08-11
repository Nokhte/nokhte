import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/presets/domain/domain.dart';

class GetCompanyPresets
    implements AbstractFutureLogic<CompanyPresetsEntity, NoParams> {
  final PresetsContract contract;

  GetCompanyPresets({required this.contract});

  @override
  call(params) async => await contract.getCompanyPresets(params);
}
