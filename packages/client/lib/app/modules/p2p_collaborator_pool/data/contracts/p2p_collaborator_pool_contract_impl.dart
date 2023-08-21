import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/sources/p2p_collaborator_pool_remote_source.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/contracts/p2p_collaborator_pool_contract.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class P2PCollaboratorPoolContractImpl implements P2PCollaboratorPoolContract {
  final P2PCollaboratorPoolRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  P2PCollaboratorPoolContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SpeechToTextInitializerStatusEntity>>
      initializeSpeechToText() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.initiateSpeechToText();
      return Right(SpeechToTextInitializerStatusModel(isAllowed: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, ListeningStatusEntity>> startListening() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.startListening();
      return Right(ListeningStatusEntity(isListening: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, ListeningStatusEntity>> stopListening() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.stopListening();
      return Right(ListeningStatusEntity(isListening: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorPhraseValidationEntity>> validateQuery(
      String query) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.validateQuery(query: query);
      return Right(
        CollaboratorPhraseValidationModel.fromSupabase(
          adjectiveRes: res[0],
          nounRes: res[1],
        ),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
    //
  }
}
