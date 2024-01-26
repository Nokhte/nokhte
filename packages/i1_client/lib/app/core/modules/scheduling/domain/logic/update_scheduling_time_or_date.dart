import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';

class UpdateSchedulingTimeOrDate
    implements
        AbstractFutureLogic<SchedulingSessionUpdateTimeOrDateStatusEntity,
            UpdateSchedulingTimeOrDateParams> {
  final SchedulingContract contract;

  UpdateSchedulingTimeOrDate({required this.contract});

  @override
  call(params) async => await contract.updateSchedulingTimeOrDate(params);
}

class UpdateSchedulingTimeOrDateParams extends Equatable {
  final bool updateDate;
  final DateTime newDateOrTime;

  const UpdateSchedulingTimeOrDateParams({
    required this.updateDate,
    required this.newDateOrTime,
  });
  @override
  List<Object> get props => [];
}
