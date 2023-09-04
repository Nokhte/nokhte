import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

abstract class P2PPurposeSessionContract {
  Future<Either<Failure, AgoraCallTokenEntity>> fetchAgoraToken(
      {required String channelName});
  Future<Either<Failure, ChannelIdEntity>> fetchChannelId();
  Future<Either<Failure, AgoraSdkStatusEntity>> instantiateAgoraSdk();
  Future<Either<Failure, CallStatusEntity>> joinCall(
      String token, String channelId);
  Future<Either<Failure, CallStatusEntity>> leaveCall();
  Future<Either<Failure, LocalAudioStreamStatusEntity>> muteLocalAudioStream();
  Future<Either<Failure, LocalAudioStreamStatusEntity>>
      unmuteLocalAudioStream();
  Future<Either<Failure, WhoGetsTheQuestionEntity>> checkIfUserHasTheQuestion();
}
