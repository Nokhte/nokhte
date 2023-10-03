import 'package:dartz/dartz.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/gyroscopic/data/data.dart';

class ConstantDirectionAngleModel {
  static DirectionAngleModel get successCase => DirectionAngleModel(
      angleStream: Stream.value(CompassEvent.fromList([95.95])));
  static DirectionAngleModel get notSuccessCase => DirectionAngleModel(
      angleStream: Stream.value(CompassEvent.fromList([-1])));
  static Either<Failure, DirectionAngleModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, DirectionAngleModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
