import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

abstract class SessionStartersContract {
  Future<Either<Failure, bool>> enterTheCollaboratorPool(
      EnterCollaboratorPoolParams collaboratorUID);
  Future<Either<Failure, bool>> exitCollaboratorPool(NoParams params);
  bool cancelNokhteSessionSearchStream(NoParams params);
  Future<Either<Failure, Stream<bool>>> getNokhteSessionSearchStatus(
      NoParams params);
}
