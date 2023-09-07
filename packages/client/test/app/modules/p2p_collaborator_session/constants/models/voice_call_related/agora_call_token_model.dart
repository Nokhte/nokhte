import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';

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
