import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/data.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:nokhte_backend/tables/phrase_components.dart';

class P2PCollaboratorPoolContractImpl implements P2PCollaboratorPoolContract {
  final P2PCollaboratorPoolRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  P2PCollaboratorPoolContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CollaboratorPhraseValidationModel>> validateQuery(
      String query) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.validateQuery(query: query);
      return Right(
        CollaboratorPhraseValidationModel.fromSupabase(
          adjRes: res.first,
          nounRes: res[1],
        ),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorPoolEntryStatusModel>>
      enterTheCollaboratorPool(CollaboratorPhraseIDs phraseIDs) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.enterThePool(phraseIDs);
      return Right(
        CollaboratorPoolEntryStatusModel.fromSupabase(
          funcRes: res,
        ),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorPoolExitStatusModel>>
      exitCollaboratorPool() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.exitThePool();
      return Right(
        CollaboratorPoolExitStatusModel.fromSupabase(
          funcRes: res,
        ),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorSearchStatusModel>>
      getCollaboratorSearchStatus() async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.getCollaboratorSearchStatus();
      return Right(
        CollaboratorSearchStatusModel(searchAndEntryStatusStream: res),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorStreamStatusModel>>
      cancelCollaboratorStream() async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.cancelStream();
      return Right(
        CollaboratorStreamStatusModel(
          isSubscribed: res,
        ),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
