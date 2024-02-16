import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/types/types.dart';

abstract class VoiceCallContract {
  Future<Either<Failure, bool>> startRecording(String path);
  Future<Either<Failure, bool>> stopRecording(NoParams params);
  Future<Either<Failure, String>> getAgoraToken({required String channelName});
  Future<Either<Failure, String>> getChannelId(GetChannelIdParams params);
  Future<Either<Failure, CallStatus>> joinCall(String token, String channelId);
  Future<Either<Failure, CallStatus>> leaveCall();
  Future<Either<Failure, bool>> muteLocalAudio();
  Future<Either<Failure, bool>> unmuteLocalAudio();
  Future<RtcEngine> initAgoraSdk(NoParams params);
}
