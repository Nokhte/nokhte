import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/modules/nokhte_session/domain/domain.dart';
import 'package:nokhte/app/modules/nokhte_session/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class NokhteSessionContractImpl implements NokhteSessionContract {
  final NokhteSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  NokhteSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  checkIfUserHasTheQuestion(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.checkifUserHasTheQuestion();
      return Right(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
