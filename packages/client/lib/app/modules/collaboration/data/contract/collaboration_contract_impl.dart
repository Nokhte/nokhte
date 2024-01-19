import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/response_to_status.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class CollaborationContractImpl
    with ResponseToStatus
    implements CollaborationContract {
  final CollaborationRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  CollaborationContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  cancelCollaboratorSearchStream(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.cancelStream();
      return Right(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  enterTheCollaboratorPool(String collaboratorUID) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.enterThePool(collaboratorUID);
      return Right(fromFunctionResponse(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  exitCollaboratorPool(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.exitThePool();
      return Right(fromFunctionResponse(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getCollaboratorSearchStatus(NoParams params) async {
    if (await networkInfo.isConnected) {
      return Right(remoteSource.getCollaboratorSearchStatus());
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
