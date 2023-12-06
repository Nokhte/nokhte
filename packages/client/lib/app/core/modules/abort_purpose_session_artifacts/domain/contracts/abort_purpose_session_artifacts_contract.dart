import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/contracts/delete_the_timer_contract_interface.dart';

abstract class AbortPurposeSessionArtifactsContract
    with DeleteTimerContractInterface {
  Future<Either<Failure, NoEntity>> abortTheCollaboration(NoParams params);
  Future<Either<Failure, NoEntity>> deleteSoloDocuments(NoParams params);
  Future<Either<Failure, NoEntity>> deleteWorkingCollaborativeDocument(
      NoParams params);
}
