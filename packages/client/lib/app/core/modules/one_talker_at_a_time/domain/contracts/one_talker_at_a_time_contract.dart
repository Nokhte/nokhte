import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/domain/domain.dart';

abstract class OneTalkerAtATimeContract {
  Future<Either<Failure, CheckIfCollaboratorisTalkingEntity>>
      checkIfCollaboratorIsTalking(NoParams params);
  Future<Either<Failure, WhoIsTalkingUpdateStatusEntity>> updateWhoIsTalking(
    WhoIsTalkingUpdateParams params,
  );
}
