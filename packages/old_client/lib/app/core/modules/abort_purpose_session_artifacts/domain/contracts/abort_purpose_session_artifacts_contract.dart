import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class AbortPurposeSessionArtifactsContract {
  Future<Either<Failure, NoEntity>> abortTheCollaboration(NoParams params);
  Future<Either<Failure, NoEntity>> deleteSoloDocuments(NoParams params);
  Future<Either<Failure, NoEntity>> deleteWorkingCollaborativeDocument(
      NoParams params);
}
