import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/response_to_status.dart';
import 'package:nokhte/app/modules/home/data/models/models.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';

class HomeContractImpl with ResponseToStatus implements HomeContract {
  final HomeRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  HomeContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  getExistingCollaborationInfo(NoParams params) async {
    if (await networkInfo.isConnected) {
      final collaborationRes =
          await remoteSource.checkIfTheyHaveACollaboration();
      final initRes = ExistingCollaborationsInfoModel.fromSupabase(
        collaborationRes: collaborationRes,
        perspectivesSessionRes: const [],
        committedPurposeRes: const [],
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
}
