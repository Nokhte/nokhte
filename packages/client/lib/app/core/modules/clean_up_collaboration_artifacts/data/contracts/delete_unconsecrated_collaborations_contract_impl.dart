import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class CleanUpCollaborationArtifactsContractImpl
    with ResponseToStatus
    implements CleanUpCollaborationArtifactsContract {
  final CleanUpCollaborationArtifactsRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  CleanUpCollaborationArtifactsContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  deleteIrlActiveNokhteSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.deleteIrlActiveNokhteSession();
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
