import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

class ConstantGyroscopeDirectionsEntity {
  static GyroscopeDirectionsEntity get successCase =>
      const GyroscopeDirectionsEntity(pitch: .9, roll: .9, yaw: .9);
  static GyroscopeDirectionsEntity get notSuccessCase =>
      const GyroscopeDirectionsEntity(pitch: 0, roll: 0, yaw: 0);
  static Either<Failure, GyroscopeDirectionsEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, GyroscopeDirectionsEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
