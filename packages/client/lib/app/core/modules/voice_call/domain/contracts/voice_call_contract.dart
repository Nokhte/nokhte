import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

abstract class VoiceCallContract {
  Future<Either<Failure, AgoraCallTokenEntity>> getAgoraToken(
      {required String channelName});
  Future<Either<Failure, ChannelIdEntity>> getChannelId();
  Future<Either<Failure, CallStatusEntity>> joinCall(
      String token, String channelId);
  Future<Either<Failure, CallStatusEntity>> leaveCall();
  Future<Either<Failure, LocalAudioStreamStatusEntity>> muteLocalAudio();
  Future<Either<Failure, LocalAudioStreamStatusEntity>> unmuteLocalAudio();
}
