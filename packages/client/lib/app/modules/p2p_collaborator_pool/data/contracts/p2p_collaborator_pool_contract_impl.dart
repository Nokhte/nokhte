import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/sources/p2p_collaborator_pool_remote_source.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/contracts/p2p_collaborator_pool_contract.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/collaborator_pool_entry_status_entity.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/collaborator_pool_exit_status_model.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/collaborator_search_status_entity.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/collaborator_stream_status_entity.dart';
import 'package:primala_backend/phrase_components.dart';

class P2PCollaboratorPoolContractImpl implements P2PCollaboratorPoolContract {
  final P2PCollaboratorPoolRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  P2PCollaboratorPoolContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SpeechToTextInitializerStatusModel>>
      initializeSpeechToText() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.initiateSpeechToText();
      return Right(SpeechToTextInitializerStatusModel(isAllowed: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, ListeningStatusModel>> startListening() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.startListening();
      return Right(ListeningStatusModel(isListening: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, ListeningStatusModel>> stopListening() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.stopListening();
      return Right(ListeningStatusModel(isListening: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorPhraseValidationModel>> validateQuery(
      String query) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.validateQuery(query: query);
      return Right(
        CollaboratorPhraseValidationModel.fromSupabase(
          adjRes: res[0],
          nounRes: res[1],
        ),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorPoolEntryStatusEntity>>
      enterTheCollaboratorPool(
          {required CollaboratorPhraseIDs phraseIDs}) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.enterThePool(phraseIDs: phraseIDs);
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
  Future<Either<Failure, CollaboratorPoolExitStatusEntity>>
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
  Future<Either<Failure, CollaboratorSearchStatusEntity>>
      getCollaboratorSearchStatus() async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.listenToCollaboratorMatchStatus();
      return Right(
        CollaboratorSearchStatusEntity(isFound: res),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorStreamStatusEntity>>
      cancelCollaboratorStream() async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.listenToCollaboratorMatchStatus();
      return Right(
        CollaboratorStreamStatusEntity(
          isSubscribed: res,
        ),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
