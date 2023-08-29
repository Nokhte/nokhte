import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

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
