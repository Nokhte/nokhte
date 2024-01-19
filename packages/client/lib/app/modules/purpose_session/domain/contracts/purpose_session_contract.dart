import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class PurposeSessionContract {
  Future<Either<Failure, bool>> checkIfUserHasTheQuestion(NoParams params);
}
