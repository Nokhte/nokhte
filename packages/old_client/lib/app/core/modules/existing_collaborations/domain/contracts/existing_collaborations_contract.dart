import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';

abstract class ExistingCollaborationsContract {
  Future<Either<Failure, CollaborationConsecrationStatusEntity>>
      consecrateTheCollaboration(NoParams params);
  Future<Either<Failure, CollaborationActivationStatusEntity>>
      updateCollaborationActivationStatus({required bool shouldActivate});
  Future<Either<Failure, IndividualCollaboratorEntryStatusEntity>>
      updateIndividualCollaboratorEntryStatus({
    required bool isEntering,
  });
  Future<Either<Failure, WhoHasTheQuestionEntity>> checkIfUserHasTheQuestion(
      NoParams params);
}
