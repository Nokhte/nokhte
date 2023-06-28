import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/data/models/confirm_p2p_scheduling_time_status_model.dart';

class ConstantConfirmSchedulingTimeStatusModels {
  static ConfirmP2PSchedulingTimeStatusModel get successCase =>
      const ConfirmP2PSchedulingTimeStatusModel(isSent: true);
  static ConfirmP2PSchedulingTimeStatusModel get notSuccessCase =>
      const ConfirmP2PSchedulingTimeStatusModel(isSent: false);
  static Either<Failure, ConfirmP2PSchedulingTimeStatusModel>
      get wrappedSuccessCase =>
          const Right(ConfirmP2PSchedulingTimeStatusModel(isSent: true));
  static Either<Failure, ConfirmP2PSchedulingTimeStatusModel>
      get wrappedNotSuccessCase =>
          const Right(ConfirmP2PSchedulingTimeStatusModel(isSent: false));
}
