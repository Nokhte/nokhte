import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/types/call_status.dart';
import 'package:primala/app/core/modules/voice_call/data/data.dart';

class ConstantCallStatusModel {
  static CallStatusModel get successCase =>
      const CallStatusModel(callStatus: CallStatus.joined);
  static CallStatusModel get inProgressCase =>
      const CallStatusModel(callStatus: CallStatus.joining);
  static CallStatusModel get notSuccessCase =>
      const CallStatusModel(callStatus: CallStatus.initial);
  static CallStatusModel get leavingSuccessCase =>
      const CallStatusModel(callStatus: CallStatus.left);
  static CallStatusModel get leavingInProgressCase =>
      const CallStatusModel(callStatus: CallStatus.leaving);
  static Either<Failure, CallStatusModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, CallStatusModel> get wrappedInProgressCase =>
      Right(inProgressCase);
  static Either<Failure, CallStatusModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
  static Either<Failure, CallStatusModel> get wrappedLeavingSuccessCase =>
      Right(leavingSuccessCase);
  static Either<Failure, CallStatusModel> get wrappedLeavingInProgressCase =>
      Right(leavingInProgressCase);
}
