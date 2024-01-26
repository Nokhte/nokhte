import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';

abstract class P2PPerspectivesSessionContract {
  Future<Either<Failure, CurrentQuadrantUpdatingStatusEntity>>
      updateCurrentQuadrant(int params);
  Future<Either<Failure, PerspectivesCommitStatusEntity>> commitThePerspectives(
      List<String> params);
  Future<Either<Failure, StagingAreaUpdateStatusEntity>> updateTheStagingArea(
    List<String> params,
  );

  Future<Either<Failure, WorkingPerspectivesStreamEntity>>
      getPerspectivesStream(NoParams params);
  Future<Either<Failure, PerspectiveSessionCreationStatusEntity>>
      createAPerspectivesSession(NoParams params);
}
