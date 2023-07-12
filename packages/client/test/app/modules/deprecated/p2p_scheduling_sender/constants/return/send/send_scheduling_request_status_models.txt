import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/data/models/p2p_scheduling_request_status_model.dart';

class ConstantSendSchedulingRequestStatusEntities {
  static P2PSchedulingRequestStatusModel get successCase =>
      const P2PSchedulingRequestStatusModel(isSent: true);
  static P2PSchedulingRequestStatusModel get notSuccessCase =>
      const P2PSchedulingRequestStatusModel(isSent: false);
  static Either<Failure, P2PSchedulingRequestStatusModel>
      get wrappedSuccessCase =>
          const Right(P2PSchedulingRequestStatusModel(isSent: true));
  static Either<Failure, P2PSchedulingRequestStatusModel>
      get wrappedNotSuccessCase =>
          const Right(P2PSchedulingRequestStatusModel(isSent: false));
}
