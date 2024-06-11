import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/response_to_status.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class UserInformationContractImpl
    with ResponseToStatus
    implements UserInformationContract {
  final UserInformationRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  UserInformationContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  getUserInfo(NoParams params) async {
    if (await networkInfo.isConnected) {
      final userInfoRes = await remoteSource.getUserInfo();
      final nokhteSessionsRes = await remoteSource.getFinishedNokhteSessions();
      final appVersionRes = await remoteSource.versionIsUpToDate();

      return Right(
        UserJourneyInfoModel.fromSupabase(
          isUpToDate: appVersionRes,
          userNamesRes: userInfoRes,
          finishedNokhteSessionsRes: nokhteSessionsRes,
        ),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updatePreferredPreset(param) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updatePreferredPreset(param);
      return fromSupabase(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateHasEnteredStorage(newEntryStatus) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateHasEnteredStorage(newEntryStatus);
      return fromSupabase(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
