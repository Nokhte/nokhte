import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/fetch_the_purpose/data/data.dart';
import 'package:nokhte/app/core/modules/fetch_the_purpose/domain/domain.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class FetchThePurposeContractImpl implements FetchThePurposeContract {
  final FetchThePurposeRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  FetchThePurposeContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CollectivePurposeModel>> fetchThePurpose(
    NoParams params,
  ) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.fetchThePurpose();
      return Right(CollectivePurposeModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
