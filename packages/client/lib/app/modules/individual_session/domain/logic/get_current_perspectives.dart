import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';

class GetCurrentPerspectives
    implements AbstractFutureLogic<CurrentPerspectivesEntity, NoParams> {
  final IndividualSessionContract contract;

  GetCurrentPerspectives({required this.contract});

  @override
  call(params) async => await contract.getCurrentPerspectives(params);
}
