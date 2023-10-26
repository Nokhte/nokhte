import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';

class ConstantAgoraCallTokenModel {
  static AgoraCallTokenModel get successCase =>
      const AgoraCallTokenModel(returnedToken: "someReturnedToken");
  static AgoraCallTokenModel get notSuccessCase =>
      const AgoraCallTokenModel(returnedToken: "");
  static Either<Failure, AgoraCallTokenModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, AgoraCallTokenModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
