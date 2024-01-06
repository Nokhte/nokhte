import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/data/data.dart';
import 'package:nokhte/app/core/modules/user_information/data/models/wants_to_repeat_invitation_flow_update_status_model.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class HomeContractImpl implements UserInformationContract {
  final UserInformationRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  HomeContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  getUserInfo(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getUserInfo();
      return Right(UserJourneyInfoModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateHasGoneThroughInvitationFlow(
      bool hasGoneThroughInvitationFlowParam) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateHasGoneThroughInvitationFlow(
          hasGoneThroughInvitationFlowParam);
      return Right(
          HasGoneThroughInvitationFlowUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateHasSentAnInvitation(bool hasSentAnInvitationParam) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource
          .updateHasSentAnInvitation(hasSentAnInvitationParam);
      return Right(HasSentAnInvitationUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateWantsToRepeatInvitationFlow(
      bool wantsToRepeatInvitationFlowParam) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource
          .updateWantsToRepeatInvitationFlow(wantsToRepeatInvitationFlowParam);
      return Right(
          WantsToRepeatInvitationFlowUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
