import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/existing_collaborations/types/collaborator_search_and_entry_status.dart';

class CollaborationContractImpl implements CollaborationContract {
  final CollaborationRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  CollaborationContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, CollaboratorStreamCancellationStatusEntity>>
      cancelCollaboratorSearchStream(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.cancelStream();
      return Right(CollaboratorStreamCancellationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorPoolEntryStatusEntity>>
      enterTheCollaboratorPool(String collaboratorUID) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.enterThePool(collaboratorUID);
      return Right(CollaboratorPoolEntryStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorPoolExitStatusEntity>>
      exitCollaboratorPool(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.exitThePool();
      return Right(CollaboratorPoolExitStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, Stream<CollaboratorSearchAndEntryStatus>>>
      getCollaboratorSearchStatus(NoParams params) async {
    if (await networkInfo.isConnected) {
      return Right(remoteSource.getCollaboratorSearchStatus());
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
