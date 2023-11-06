import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';

class GetCurrentPerspective
    implements AbstractFutureLogic<CurrentPerspectivesEntity, NoParams> {
  final IndividualSessionContract contract;

  GetCurrentPerspective({required this.contract});

  @override
  call(params) async => await contract.getCurrentPerspectives(params);
}
