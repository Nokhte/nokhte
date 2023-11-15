import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/data/data.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/domain/domain.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class GetCurrentPerspectivesContractImpl
    implements GetCurrentPerspectivesContract {
  final GetCurrentPerspectivesRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  GetCurrentPerspectivesContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, CurrentPerspectivesModel>> getCurrentPerspectives(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getCurrentPerspectives();
      return Right(CurrentPerspectivesModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
