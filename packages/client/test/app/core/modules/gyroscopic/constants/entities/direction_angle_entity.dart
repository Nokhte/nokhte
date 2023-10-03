import 'package:dartz/dartz.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

class ConstantDirectionAngleEntity {
  static DirectionAngleEntity get successCase => DirectionAngleEntity(
      angleStream: Stream.value(CompassEvent.fromList([95.95])));
  static DirectionAngleEntity get notSuccessCase => DirectionAngleEntity(
      angleStream: Stream.value(CompassEvent.fromList([-1])));
  static Either<Failure, DirectionAngleEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, DirectionAngleEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
