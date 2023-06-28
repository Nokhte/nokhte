import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/data/models/p2p_scheduling_response_status_model.dart';

class ConstantResponseStatusModels {
  static P2PSchedulingResponseStatusModel get successCase =>
      const P2PSchedulingResponseStatusModel(isSent: true);
  static P2PSchedulingResponseStatusModel get notSuccessCase =>
      const P2PSchedulingResponseStatusModel(isSent: false);
  static Either<Failure, P2PSchedulingResponseStatusModel>
      get wrappedSuccessCase =>
          const Right(P2PSchedulingResponseStatusModel(isSent: true));
  static Either<Failure, P2PSchedulingResponseStatusModel>
      get wrappedNotSuccessCase =>
          const Right(P2PSchedulingResponseStatusModel(isSent: false));
}
