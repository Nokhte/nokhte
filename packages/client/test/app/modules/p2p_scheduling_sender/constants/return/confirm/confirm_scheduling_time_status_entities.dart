import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/confirm_p2p_scheduling_time_status_entity.dart';

class ConstantConfirmSchedulingTimeStatusEntities {
  static ConfirmP2PSchedulingTimeStatusEntity get successCase =>
      const ConfirmP2PSchedulingTimeStatusEntity(isSent: true);
  static get notSuccessCase =>
      const ConfirmP2PSchedulingTimeStatusEntity(isSent: false);
  static Either<Failure, ConfirmP2PSchedulingTimeStatusEntity>
      get wrappedSuccessCase =>
          const Right(ConfirmP2PSchedulingTimeStatusEntity(isSent: true));
  static Either<Failure, ConfirmP2PSchedulingTimeStatusEntity>
      get wrappedNotSuccessCase =>
          const Right(ConfirmP2PSchedulingTimeStatusEntity(isSent: false));
}
