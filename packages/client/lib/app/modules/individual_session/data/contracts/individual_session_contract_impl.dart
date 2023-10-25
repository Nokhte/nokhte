import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/individual_session/domain/domain.dart';
import 'package:primala/app/modules/individual_session/data/data.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/constants/failure_constants.dart';

class IndividualSessionContractImpl implements IndividualSessionContract {
  final IndividualSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  IndividualSessionContractImpl({
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
