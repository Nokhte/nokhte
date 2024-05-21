import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/response_to_status.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/domain/domain.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class ActiveMonetizationSessionContractImpl
    with ResponseToStatus
    implements ActiveMonetizationSessionContract {
  final ActiveMonetizationSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  ActiveMonetizationSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  disposeStatusStream(params) =>
      remoteSource.disposeExplanationCompletionStatusStream();

  @override
  listenToExplanationCompletionStatus(params) async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.listenToExplanationCompletionStatus();
      return Right(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  startSession(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.startMonetizationSession();
      return fromSupabase(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateHasFinishedExplanation(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateHasFinishedExplanation();
      return fromSupabase(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  deleteSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.deleteMonetizationSession();
      return fromSupabase(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
