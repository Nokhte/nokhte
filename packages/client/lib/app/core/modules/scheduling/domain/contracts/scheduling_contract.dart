import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';
import 'package:primala/app/core/modules/scheduling/domain/entities/collaborators_chosen_time_and_day_entity.dart';

abstract class SchedulingContract {
  Future<Either<Failure, SchedulingSessionCreationStatusEntity>>
      createCollaborativeSchedulingSession(NoParams params);
  Future<Either<Failure, SchedulingSesesionUpdateTimeOrDateStatusEntity>>
      updateSchedulingTimeOrDate(UpdateSchedulingTimeOrDateParams params);
  Future<Either<Failure, CollaboratorsChosenTimeAndDayEntity>>
      getCollaboratorsDateAndTime(NoParams params);
}
