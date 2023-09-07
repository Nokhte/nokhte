import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';

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
