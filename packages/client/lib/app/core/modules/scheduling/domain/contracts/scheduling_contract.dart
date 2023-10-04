import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';

abstract class SchedulingContract {
  Future<Either<Failure, SchedulingSessionCreationStatusEntity>>
      createCollaborativeSchedulingSession(NoParams params);
  Future<Either<Failure, SchedulingSesesionUpdateTimeOrDateStatusEntity>>
      updateSchedulingTimeOrDate(UpdateSchedulingTimeOrDateParams params);
}
