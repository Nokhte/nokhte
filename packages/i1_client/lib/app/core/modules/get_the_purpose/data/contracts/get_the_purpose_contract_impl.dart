import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/get_the_purpose/data/data.dart';
import 'package:nokhte/app/core/modules/get_the_purpose/domain/domain.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class GetThePurposeContractImpl implements GetThePurposeContract {
  final GetThePurposeRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  GetThePurposeContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CollectivePurposeModel>> getThePurpose(
    NoParams params,
  ) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getThePurpose();
      return Right(CollectivePurposeModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
