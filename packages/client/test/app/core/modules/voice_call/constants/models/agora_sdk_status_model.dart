import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';

class ConstantAgoraSdkStatusModel {
  static AgoraSdkStatusModel get successCase =>
      const AgoraSdkStatusModel(isInstantiated: true);
  static AgoraSdkStatusModel get notSuccessCase =>
      const AgoraSdkStatusModel(isInstantiated: false);
  static Either<Failure, AgoraSdkStatusModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, AgoraSdkStatusModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
