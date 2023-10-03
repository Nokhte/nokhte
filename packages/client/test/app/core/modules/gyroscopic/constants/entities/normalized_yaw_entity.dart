import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

class ConstantNormalizedYawEntity {
  static NormalizedYawEntity get successCase =>
      const NormalizedYawEntity(yaw: 51.56620156177409);
  static NormalizedYawEntity get notSuccessCase =>
      const NormalizedYawEntity(yaw: 0.00);
  static Either<Failure, NormalizedYawEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, NormalizedYawEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
