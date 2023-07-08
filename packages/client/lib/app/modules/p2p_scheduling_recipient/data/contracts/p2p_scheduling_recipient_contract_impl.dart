import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/data/models/p2p_scheduling_response_status_model.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/contracts/p2p_scheduling_recipient_contract.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/respond_to_scheduling_request_param_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/p2p_scheduling_response_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/data/sources/p2p_scheduling_recipient_remote_source.dart';

class P2PSchedulingRecipientContractImpl
    implements P2PSchedulingRecipientContract {
  final P2PSchedulingRecipientRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  P2PSchedulingRecipientContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, P2PSchedulingResponseStatusEntity>>
      respondToSchedulingRequest(
          RespondToSchedulingRequestParamEntity params) async {
    if (await networkInfo.isConnected) {
      final remoteSourceRes = await remoteSource.respondToSchedulingRequest(
          params.originalSenderUID, params.responseTimestampz);
      return Right(
          P2PSchedulingResponseStatusModel.fromSupabase(remoteSourceRes));
    } else {
      return Left(
        FailureConstants.internetConnectionFailure,
      );
    }
  }
}
