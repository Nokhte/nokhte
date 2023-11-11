import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class P2PPerspectivesSessionContractImpl
    implements P2PPerspectivesSessionContract {
  final P2PPerspectivesSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  P2PPerspectivesSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, PerspectivesCommitStatusModel>> commitThePerspectives(
      List<String> params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.commitThePerspectives(params);
      return const Right(PerspectivesCommitStatusModel(isCommitted: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, PerspectiveSessionCreationStatusModel>>
      createAPerspectivesSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.createAPerspectivesSession(params);
      return const Right(
          PerspectiveSessionCreationStatusModel(isCreated: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, WorkingPerspectivesStreamModel>>
      fetchPerspectivesStream(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.fetchPerspectivesStream(params);
      return Right(WorkingPerspectivesStreamModel(stream: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CurrentQuadrantUpdatingStatusModel>>
      updateCurrentQuadrant(int params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.updateCurrentQuadrant(params);
      return const Right(CurrentQuadrantUpdatingStatusModel(isUpdated: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, StagingAreaUpdateStatusModel>> updateTheStagingArea(
      List<String> params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.updateTheStagingArea(params);
      return const Right(StagingAreaUpdateStatusModel(isUpdated: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
