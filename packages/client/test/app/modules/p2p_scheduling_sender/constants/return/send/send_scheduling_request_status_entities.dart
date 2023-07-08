import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';

class ConstantSendSchedulingRequestStatusEntities {
  static P2PSchedulingRequestStatusEntity get successCase =>
      const P2PSchedulingRequestStatusEntity(isSent: true);
  static P2PSchedulingRequestStatusEntity get notSuccessCase =>
      const P2PSchedulingRequestStatusEntity(isSent: false);
  static Either<Failure, P2PSchedulingRequestStatusEntity>
      get wrappedSuccessCase =>
          const Right(P2PSchedulingRequestStatusEntity(isSent: true));
  static Either<Failure, P2PSchedulingRequestStatusEntity>
      get wrappedNotSuccessCase =>
          const Right(P2PSchedulingRequestStatusEntity(isSent: false));
}
