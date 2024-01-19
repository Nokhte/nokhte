import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';
import 'package:nokhte/app/modules/purpose_session/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class PurposeSessionContractImpl implements PurposeSessionContract {
  final PurposeSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  PurposeSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  checkIfUserHasTheQuestion(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.checkIfUserHasTheQuestion();
      return Right(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
