import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';
import 'package:primala/app/core/modules/scheduling/domain/entities/scheduling_session_creation_status_entity.dart';

abstract class SchedulingContract {
  Future<Either<Failure, SchedulingSessionCreationStatusEntity>>
      createCollaborativeSchedulingSession(NoParams params);
}
