import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/domain/domain.dart';

class GetCurrentPerspectives
    implements AbstractFutureLogic<CurrentPerspectivesEntity, NoParams> {
  final GetCurrentPerspectivesContract contract;

  GetCurrentPerspectives({required this.contract});

  @override
  call(NoParams params) async => await contract.getCurrentPerspectives(params);
}
