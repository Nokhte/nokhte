import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class IndividualSessionContractImpl implements IndividualSessionContract {
  final IndividualSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  IndividualSessionContractImpl(
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

  @override
  Future<Either<Failure, IndividualSessionCreationStatusModel>>
      createIndividualSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createIndividualSession();
      return Right(IndividualSessionCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, IndividualSessionMetadataUpdateStatusEntity>>
      updateSessionMetadata(UpdateSessionMetadataParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateSessionMetadata(params);
      return Right(
          IndividualSessionMetadataUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, IndividualPerspectivesAudioUploadStatusEntity>>
      uploadIndividualPerspectivesAudio(params) {
    // TODO: implement uploadIndividualPerspectivesAudio
    throw UnimplementedError();
  }
}
