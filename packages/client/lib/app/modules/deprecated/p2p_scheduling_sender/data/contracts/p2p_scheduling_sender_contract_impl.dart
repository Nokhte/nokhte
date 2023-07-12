import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/data/models/confirm_p2p_scheduling_time_status_model.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/data/models/p2p_scheduling_request_status_model.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/data/sources/p2p_scheduling_sender_remote_source.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/contracts/p2p_scheduling_sender_contract.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/send_scheduling_request_param_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';

class P2PSchedulingSenderContractImpl implements P2PSchedulingSenderContract {
  final P2PSchedulingSenderRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  P2PSchedulingSenderContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, P2PSchedulingRequestStatusEntity>>
      sendSchedulingRequest(
          {required SendSchedulingRequestParamEntity
              schedulingInfoEntity}) async {
    if (await networkInfo.isConnected) {
      final remoteSourceRes = await remoteSource.sendSchedulingRequest(
        schedulingInfoEntity.receiverUID,
        schedulingInfoEntity.timeRangesToJson(),
      );
      return Right(
        P2PSchedulingRequestStatusModel.fromSupabase(
          remoteSourceRes,
        ),
      );
    } else {
      return Left(
        FailureConstants.internetConnectionFailure,
      );
    }
  }

  @override
  Future<Either<Failure, ConfirmP2PSchedulingTimeStatusModel>>
      confirmSchedulingTime({required String receiverUID}) async {
    if (await networkInfo.isConnected) {
      final remoteSourceRes =
          await remoteSource.confirmSchedulingTime(receiverUID);
      return Right(
        ConfirmP2PSchedulingTimeStatusModel.fromSupabase(
          remoteSourceRes,
        ),
      );
    } else {
      return Left(
        FailureConstants.internetConnectionFailure,
      );
    }
  }
}
