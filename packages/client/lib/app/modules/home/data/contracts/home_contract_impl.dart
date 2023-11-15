import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/data/models/models.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/home/domain/entities/collaborator_phrase_entity.dart';
import 'package:nokhte/app/modules/home/domain/entities/name_creation_status_entity.dart';

class HomeContractImpl implements HomeContract {
  final HomeRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  HomeContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NameCreationStatusEntity>> addNameToDatabase(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.addNamesToDatabase();
      return Right(NameCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorPhraseEntity>> getCollaboratorPhrase(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getCollaboratorPhrase();
      return Right(CollaboratorPhraseModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, ExistingCollaborationsInfoModel>>
      getExistingCollaborationInfo(NoParams params) async {
    if (await networkInfo.isConnected) {
      final collaborationRes =
          await remoteSource.checkIfTheyHaveACollaboration();
      final initRes = ExistingCollaborationsInfoModel.fromSupabase(
        collaborationRes,
        [],
      );
      if (initRes.hasACollaboration) {
        final perspectives =
            await remoteSource.checkIfTheyHaveDonePerspectives();
        return Right(ExistingCollaborationsInfoModel.fromSupabase(
          collaborationRes,
          perspectives,
        ));
      } else {
        return Right(initRes);
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
