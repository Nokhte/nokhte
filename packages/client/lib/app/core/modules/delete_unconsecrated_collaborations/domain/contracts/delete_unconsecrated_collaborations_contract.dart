import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class DeleteUnconsecratedCollaborationsContract {
  Future<Either<Failure, bool>> deleteIrlActiveNokhteSession(NoParams params);
}
