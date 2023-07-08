import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/confirm_p2p_scheduling_time_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/send_scheduling_request_param_entity.dart';

abstract class P2PSchedulingSenderContract {
  Future<Either<Failure, P2PSchedulingRequestStatusEntity>>
      sendSchedulingRequest({
    required SendSchedulingRequestParamEntity schedulingInfoEntity,
  });

  Future<Either<Failure, ConfirmP2PSchedulingTimeStatusEntity>>
      confirmSchedulingTime({required String receiverUID});
  // as it stands now it's just send
}
