import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/gyroscopic/data/data.dart';
import '../compass_event.dart';

class ConstantDirectionAngleModel {
  static DirectionAngleModel get successCase =>
      DirectionAngleModel(angleStream: ConstantCompassEvent.successCase);
  static DirectionAngleModel get notSuccessCase =>
      DirectionAngleModel(angleStream: ConstantCompassEvent.notSuccessCase);
  static Either<Failure, DirectionAngleModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, DirectionAngleModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
