import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class CollaborationContract {
  Future<Either<Failure, bool>> enterTheCollaboratorPool(
      String collaboratorUID);
  Future<Either<Failure, bool>> exitCollaboratorPool(NoParams params);
  Future<Either<Failure, Stream<bool>>> getCollaboratorSearchStatus(
      NoParams params);
  Future<Either<Failure, bool>> cancelCollaboratorSearchStream(NoParams params);
}
