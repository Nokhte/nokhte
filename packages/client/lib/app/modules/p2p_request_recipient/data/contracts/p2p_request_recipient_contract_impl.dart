// essentials
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
// models
import 'package:primala/app/modules/p2p_request_recipient/data/models/p2p_recipient_request_model.dart';
import 'package:primala/app/modules/p2p_request_recipient/data/models/p2p_recipient_response_status_model.dart';
// sources
import 'package:primala/app/modules/p2p_request_recipient/data/sources/p2p_request_recipient_remote_source.dart';
// contract
import 'package:primala/app/modules/p2p_request_recipient/domain/contracts/p2p_request_recipient_contract.dart';
// entities
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_request_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_response_status_entity.dart';

class P2PRequestRecipientContractImpl implements P2PRequestRecipientContract {
  final P2PRequestRecipientRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  P2PRequestRecipientContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, P2PRecipientRequestEntity>> loadTheRequests() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.loadRequests();
      return Right(
        P2PRecipientRequestModel.fromSupabase(res),
      );
    } else {
      return Left(
        FailureConstants.internetConnectionFailure,
      );
    }
  }

  @override
  Future<Either<Failure, P2PRequestRecipientResponseStatusEntity>>
      respondToARequest(String senderUsername) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.respondToARequest(senderUsername);
      return Right(
        P2PRequestRecipientResponseStatusModel.fromSupabase(res),
      );
    } else {
      return Left(
        FailureConstants.internetConnectionFailure,
      );
    }
  }
}
