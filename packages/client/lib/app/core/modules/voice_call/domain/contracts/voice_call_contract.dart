import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

abstract class VoiceCallContract {
  Future<Either<Failure, AgoraCallTokenEntity>> getAgoraToken(
      {required String channelName});
  Future<Either<Failure, ChannelIdEntity>> getChannelId();
  Future<Either<Failure, CallStatusEntity>> joinCall(
      String token, String channelId);
  Future<Either<Failure, CallStatusEntity>> leaveCall();
  Future<Either<Failure, bool>> muteLocalAudio();
  Future<Either<Failure, bool>> unmuteLocalAudio();
  Future<RtcEngine> initAgoraSdk(NoParams params);
}
