import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';

class GetCollaboratorsDateAndTime
    implements
        AbstractFutureLogic<CollaboratorsChosenTimeAndDayEntity, NoParams> {
  final SchedulingContract contract;

  GetCollaboratorsDateAndTime({required this.contract});

  @override
  call(params) async => await contract.getCollaboratorsDateAndTime(params);
}
