import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/collaboration/data/data.dart';
import 'package:nokhte/app/modules/collaboration/domain/contracts/collaboration_contract.dart';

class CollaborationContractImpl implements CollaborationContract {
  final CollaborationRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  CollaborationContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });
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
}
