import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';

abstract class SchedulingContract {
  Future<Either<Failure, SchedulingSessionCreationStatusEntity>>
      createCollaborativeSchedulingSession(NoParams params);
  Future<Either<Failure, SchedulingSessionUpdateTimeOrDateStatusEntity>>
      updateSchedulingTimeOrDate(UpdateSchedulingTimeOrDateParams params);
  Future<Either<Failure, CollaboratorsChosenTimeAndDayEntity>>
      getCollaboratorsDateAndTime(NoParams params);
}
