import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';

class GetCollaboratorsDateAndTime
    implements
        AbstractFutureLogic<CollaboratorsChosenTimeAndDayEntity, NoParams> {
  final SchedulingContract contract;

  GetCollaboratorsDateAndTime({required this.contract});

  @override
  call(params) async => await contract.getCollaboratorsDateAndTime(params);
}
