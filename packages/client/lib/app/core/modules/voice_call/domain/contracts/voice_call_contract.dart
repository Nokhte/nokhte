import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

abstract class VoiceCallContract {
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
