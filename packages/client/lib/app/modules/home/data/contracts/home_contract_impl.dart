import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/data/models/models.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';

class HomeContractImpl implements HomeContract {
  final HomeRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  HomeContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  addNameToDatabase(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.addNamesToDatabase();
      return Right(NameCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getCollaboratorPhrase(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getCollaboratorPhrase();
      return Right(CollaboratorPhraseModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getExistingCollaborationInfo(NoParams params) async {
    if (await networkInfo.isConnected) {
      final collaborationRes =
          await remoteSource.checkIfTheyHaveACollaboration();
      final initRes = ExistingCollaborationsInfoModel.fromSupabase(
        collaborationRes: collaborationRes,
        perspectivesSessionRes: [],
        committedPurposeRes: [],
      );
      if (initRes.hasACollaboration) {
        final perspectivesRes =
            await remoteSource.checkIfTheyHaveDonePerspectives();
        final purposeRes =
            await remoteSource.checkIfTheyHaveCommittedAPurpose();
        return Right(ExistingCollaborationsInfoModel.fromSupabase(
          collaborationRes: collaborationRes,
          perspectivesSessionRes: perspectivesRes,
          committedPurposeRes: purposeRes,
        ));
      } else {
        return Right(initRes);
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  shareCollaborationInvitation(String link) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.shareCollaborationInvitation(link);
      return Right(CollaborationInvitationSendStatusModel.fromShareResult(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getInvitationURL(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getInvitationURL();
      return Right(CollaborationInvitationDataModel(link: res.result));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

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
}
