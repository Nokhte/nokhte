import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/p2p_scheduling_response_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/respond_to_scheduling_request_param_entity.dart';

abstract class P2PSchedulingRecipientContract {
  Future<Either<Failure, P2PSchedulingResponseStatusEntity>>
      respondToSchedulingRequest(RespondToSchedulingRequestParamEntity params);
}
