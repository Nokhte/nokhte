import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

abstract class GyroscopicContract {
  Future<Either<Failure, DirectionAngleEntity>> getDirectionAngle(
    NoParams params,
  );
  ReferenceAngleSetterStatusEntity setReferenceAngle(int newReferenceAngle);
}
