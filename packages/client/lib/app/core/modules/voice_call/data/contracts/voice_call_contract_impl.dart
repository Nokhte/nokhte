import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/network/network_info.dart';
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
  getRoomInformation(NoParams params) async {
    if (await networkInfo.isConnected) {
      final token = await remoteSource.getMeetingToken();
      final meetingId = await remoteSource.getMeetingId();
      final userUID = remoteSource.getUserUID();
      return Right(RoomInformationModel(
        token: token,
        meetingId: meetingId,
        userUID: userUID,
      ));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
