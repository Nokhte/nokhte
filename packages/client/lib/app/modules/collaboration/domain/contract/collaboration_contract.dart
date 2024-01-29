import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';

abstract class CollaborationContract {
  Future<Either<Failure, bool>> enterTheCollaboratorPool(
      EnterCollaboratorPoolParams collaboratorUID);
  Future<Either<Failure, bool>> exitCollaboratorPool(NoParams params);
  Future<Either<Failure, Stream<bool>>> getCollaboratorSearchStatus(
      NoParams params);
  bool cancelCollaboratorSearchStream(NoParams params);
}
