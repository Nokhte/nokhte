import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class ConstantAgoraCallTokenEntity {
  static AgoraCallTokenEntity get successCase =>
      const AgoraCallTokenEntity(returnedToken: "someReturnedToken");
  static AgoraCallTokenEntity get notSuccessCase =>
      const AgoraCallTokenEntity(returnedToken: "");
  static Either<Failure, AgoraCallTokenEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, AgoraCallTokenEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
