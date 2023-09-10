import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/types/call_status.dart';
import 'package:primala/app/core/modules/voice_call/data/data.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class VoiceCallContractImpl implements VoiceCallContract {
  final VoiceCallRemoteSource remoteSource;
  final NetworkInfo networkInfo;
  VoiceCallContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AgoraCallTokenModel>> fetchAgoraToken({
    required String channelName,
  }) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.fetchAgoraToken(channelName: channelName);
      return Right(AgoraCallTokenModel.fromTokenServer(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, ChannelIdEntity>> fetchChannelId() async {
    //
    if (await networkInfo.isConnected) {
      final res = await remoteSource.fetchCollaboratorInfo();
      return Right(ChannelIdModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, AgoraSdkStatusModel>> instantiateAgoraSdk() async {
    //
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
    print("is this being called?");
    if (await networkInfo.isConnected) {
      await remoteSource.joinCall(token: token, channelId: channelId);
      return const Right(CallStatusModel(callStatus: CallStatus.joining));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
    //
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
  Future<Either<Failure, LocalAudioStreamStatusModel>>
      muteLocalAudioStream() async {
    if (await networkInfo.isConnected) {
      await remoteSource.muteLocalAudioStream();
      return const Right(LocalAudioStreamStatusModel(isMuted: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, LocalAudioStreamStatusModel>>
      unmuteLocalAudioStream() async {
    if (await networkInfo.isConnected) {
      await remoteSource.unmuteLocalAudioStream();
      return const Right(LocalAudioStreamStatusModel(isMuted: false));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, WhoGetsTheQuestionModel>>
      checkIfUserHasTheQuestion() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.fetchCollaboratorInfo();
      return Right(
        WhoGetsTheQuestionModel.fromSupabase(res),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
