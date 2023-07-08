import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/p2p_scheduling_response_status_entity.dart';

class ConstantResponseStatusEntities {
  static P2PSchedulingResponseStatusEntity get successCase =>
      const P2PSchedulingResponseStatusEntity(isSent: true);
  static P2PSchedulingResponseStatusEntity get notSuccessCase =>
      const P2PSchedulingResponseStatusEntity(isSent: false);
  static Either<Failure, P2PSchedulingResponseStatusEntity>
      get wrappedSuccessCase =>
          const Right(P2PSchedulingResponseStatusEntity(isSent: true));
  static Either<Failure, P2PSchedulingResponseStatusEntity>
      get wrappedNotSuccessCase =>
          const Right(P2PSchedulingResponseStatusEntity(isSent: false));
}
