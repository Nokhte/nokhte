import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

class ConstantCallStatusEntity {
  static CallStatusEntity get successCase =>
      const CallStatusEntity(callStatus: CallStatus.joined);
  static CallStatusEntity get inProgressCase =>
      const CallStatusEntity(callStatus: CallStatus.joining);
  static CallStatusEntity get notSuccessCase =>
      const CallStatusEntity(callStatus: CallStatus.theDefault);
  static CallStatusEntity get leavingSuccessCase =>
      const CallStatusEntity(callStatus: CallStatus.joined);
  static CallStatusEntity get leavingInProgressCase =>
      const CallStatusEntity(callStatus: CallStatus.joining);
  static Either<Failure, CallStatusEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, CallStatusEntity> get wrappedInProgressCase =>
      Right(successCase);
  static Either<Failure, CallStatusEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
  static Either<Failure, CallStatusEntity> get wrappedLeavingSuccessCase =>
      Right(leavingSuccessCase);
  static Either<Failure, CallStatusEntity> get wrappedLeavingInProgressCase =>
      Right(leavingInProgressCase);
}
