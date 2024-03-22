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
  cancelNokhteSessionSearchStream(NoParams params) =>
      remoteSource.cancelNokhteSessionSearchStream();

  @override
  enterTheCollaboratorPool(collaboratorUID) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.enterThePool(collaboratorUID);
      return fromFunctionResponse(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  exitCollaboratorPool(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.exitThePool();
      return fromFunctionResponse(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getNokhteSessionSearchStatus(params) async {
    if (await networkInfo.isConnected) {
      return Right(remoteSource.getNokhteSessionSearchStatus());
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
