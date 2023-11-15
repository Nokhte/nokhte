import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';

abstract class GyroscopicContract {
  Future<Either<Failure, DirectionAngleEntity>> getDirectionAngle(
    NoParams params,
  );
  ReferenceAngleSetterStatusEntity setReferenceAngle(int newReferenceAngle);
  ReferenceAngleSetterStatusEntity resetRefAngle(ResetRefAngleParams params);
}
