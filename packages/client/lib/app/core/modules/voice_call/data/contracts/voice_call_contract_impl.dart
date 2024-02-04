import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/response_to_status.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/types/call_status.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class VoiceCallContractImpl with ResponseToStatus implements VoiceCallContract {
  final VoiceCallRemoteSource remoteSource;
  final NetworkInfo networkInfo;
  VoiceCallContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  getAgoraToken({required String channelName}) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getAgoraToken(channelName: channelName);
      return Right(fromHTTPResponseProperty<String>(res, "rtcToken", ""));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getChannelId(params) async {
    if (await networkInfo.isConnected) {
      switch (params) {
        case GetChannelIdParams.forCollaboration:
          final res = await remoteSource.getCollaboratorInfo();
          return Right(ChannelIdMapper.fromCollaborationRow(res));
        case GetChannelIdParams.forNokhteSession:
          final res = await remoteSource.getNokhteSessionMeetingId();
          return Right(res);
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  joinCall(String token, String channelId) async {
    if (await networkInfo.isConnected) {
      await remoteSource.joinCall(token: token, channelId: channelId);
      return const Right(CallStatus.joining);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  leaveCall() async {
    if (await networkInfo.isConnected) {
      await remoteSource.leaveCall();
      return const Right(CallStatus.leaving);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  muteLocalAudio() async {
    if (await networkInfo.isConnected) {
      await remoteSource.muteLocalAudio();
      return const Right(true);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  unmuteLocalAudio() async {
    if (await networkInfo.isConnected) {
      await remoteSource.unmuteLocalAudio();
      return const Right(false);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  initAgoraSdk(NoParams params) async => await remoteSource.initAgoraSdk();

  @override
  startRecording(path) async {
    if (await networkInfo.isConnected) {
      await remoteSource.startRecording(path);
      return const Right(true);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  stopRecording(params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.stopRecording();
      return const Right(false);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
