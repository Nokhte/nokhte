import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class CleanUpCollaborationArtifactsContract {
  Future<Either<Failure, bool>> deleteIrlActiveNokhteSession(NoParams params);
}
