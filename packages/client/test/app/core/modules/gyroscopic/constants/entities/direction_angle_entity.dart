import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

import '../compass_event.dart';

class ConstantDirectionAngleEntity {
  static DirectionAngleEntity get successCase =>
      DirectionAngleEntity(angleStream: ConstantCompassEvent.successCase);
  static DirectionAngleEntity get notSuccessCase =>
      DirectionAngleEntity(angleStream: ConstantCompassEvent.notSuccessCase);
  static Either<Failure, DirectionAngleEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, DirectionAngleEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
