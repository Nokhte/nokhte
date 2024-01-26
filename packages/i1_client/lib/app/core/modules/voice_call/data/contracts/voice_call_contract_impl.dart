import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/types/call_status.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class VoiceCallContractImpl implements VoiceCallContract {
  final VoiceCallRemoteSource remoteSource;
  final NetworkInfo networkInfo;
  VoiceCallContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AgoraCallTokenModel>> getAgoraToken({
    required String channelName,
  }) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getAgoraToken(channelName: channelName);
      return Right(AgoraCallTokenModel.fromTokenServer(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, ChannelIdEntity>> getChannelId() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getCollaboratorInfo();
      return Right(ChannelIdModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, AgoraSdkStatusModel>> instantiateAgoraSdk() async {
    if (await networkInfo.isConnected) {
      await remoteSource.instantiateAgoraSDK();
      return const Right(AgoraSdkStatusModel(isInstantiated: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CallStatusModel>> joinCall(
      String token, String channelId) async {
    if (await networkInfo.isConnected) {
      await remoteSource.joinCall(token: token, channelId: channelId);
      return const Right(CallStatusModel(callStatus: CallStatus.joining));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CallStatusModel>> leaveCall() async {
    if (await networkInfo.isConnected) {
      await remoteSource.leaveCall();
      return const Right(CallStatusModel(callStatus: CallStatus.leaving));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, LocalAudioStreamStatusModel>> muteLocalAudio() async {
    if (await networkInfo.isConnected) {
      await remoteSource.muteLocalAudio();
      return const Right(LocalAudioStreamStatusModel(isMuted: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, LocalAudioStreamStatusModel>>
      unmuteLocalAudio() async {
    if (await networkInfo.isConnected) {
      await remoteSource.unmuteLocalAudio();
      return const Right(LocalAudioStreamStatusModel(isMuted: false));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
