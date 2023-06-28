import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/modules/p2p_request_sender/data/models/p2p_request_recipient_model.dart';
import 'package:primala/app/modules/p2p_request_sender/data/models/p2p_request_sender_status_model.dart';
import 'package:primala/app/modules/p2p_request_sender/data/sources/p2p_request_sender_remote_source.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_sender_status_entity.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_recipient_entity.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/contracts/p2p_request_sender_contract.dart';

class P2PRequestSenderContractImpl implements P2PRequestSenderContract {
  final P2PRequestSenderRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  P2PRequestSenderContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, P2PRequestRecipientEntity>> validateRequest(
      String receiverUsername) async {
    if (await networkInfo.isConnected) {
      final remoteSourceUsernameChecker =
          await remoteSource.checkIfRecipientExists(
        receiverUsername,
      );
      if (remoteSourceUsernameChecker.isEmpty) {
        // this is only a partial solution this ensures that
        return Right(
          P2PRequestSenderRecipientModel.fromSupabase(
            P2PRequestSenderRecipientModelParams(
              existsRes: remoteSourceUsernameChecker,
              recipDupRes: [],
              senderDupRes: [],
            ),
          ),
        );
      } else {
        final receiverDuplicateRes = await remoteSource
            .checkForRecipientDuplicate(remoteSourceUsernameChecker[0]["uid"]);
        final senderDuplicateRes = await remoteSource
            .checkForSenderDuplicate(remoteSourceUsernameChecker[0]["uid"]);

        return Right(
          P2PRequestSenderRecipientModel.fromSupabase(
            P2PRequestSenderRecipientModelParams(
              existsRes: remoteSourceUsernameChecker,
              recipDupRes: receiverDuplicateRes,
              senderDupRes: senderDuplicateRes,
            ),
          ),
        );
      }
    } else {
      return Left(
        FailureConstants.internetConnectionFailure,
      );
    }
  }

  @override
  Future<Either<Failure, P2PRequestSenderStatusEntity>> sendARequest(
      String receiverUsername) async {
    if (await networkInfo.isConnected) {
      final remoteSourceRes = await remoteSource.sendARequest(
        receiverUsername,
      );
      return Right(
        P2PRequestSenderStatusModel.fromSupabase(remoteSourceRes),
      );
    } else {
      return Left(
        FailureConstants.internetConnectionFailure,
      );
    }
  }
}
