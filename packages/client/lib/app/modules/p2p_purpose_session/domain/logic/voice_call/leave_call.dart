import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class LeaveCall extends AbstractFutureLogic<CallStatusEntity, NoParams> {
  final P2PPurposeSessionContract contract;

  LeaveCall({required this.contract});

  @override
  call(NoParams params) async => contract.leaveCall();
}
