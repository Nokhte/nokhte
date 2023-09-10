import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class ConstantAgoraSdkStatusEntity {
  static AgoraSdkStatusEntity get successCase =>
      const AgoraSdkStatusEntity(isInstantiated: true);
  static AgoraSdkStatusEntity get notSuccessCase =>
      const AgoraSdkStatusEntity(isInstantiated: false);
  static Either<Failure, AgoraSdkStatusEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, AgoraSdkStatusEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
