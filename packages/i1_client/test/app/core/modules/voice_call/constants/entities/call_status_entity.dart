import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class ConstantCallStatusEntity {
  static CallStatusEntity get joinedCase =>
      const CallStatusEntity(callStatus: CallStatus.joined);
  static CallStatusEntity get joiningCase =>
      const CallStatusEntity(callStatus: CallStatus.joining);
  static CallStatusEntity get initialState =>
      const CallStatusEntity(callStatus: CallStatus.initial);
  static CallStatusEntity get leavingCase =>
      const CallStatusEntity(callStatus: CallStatus.leaving);
  static CallStatusEntity get leftCase =>
      const CallStatusEntity(callStatus: CallStatus.left);
  static Either<Failure, CallStatusEntity> get wrappedJoinedCase =>
      Right(joinedCase);
  static Either<Failure, CallStatusEntity> get wrappedJoiningCase =>
      Right(joiningCase);
  static Either<Failure, CallStatusEntity> get wrappedLeavingCase =>
      Right(leavingCase);
  static Either<Failure, CallStatusEntity> get wrappedLeftCase =>
      Right(leftCase);
  static Either<Failure, CallStatusEntity> get wrappedInitialState =>
      Right(initialState);
}
