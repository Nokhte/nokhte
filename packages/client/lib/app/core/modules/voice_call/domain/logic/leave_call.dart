import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class LeaveCall extends AbstractFutureLogic<CallStatusEntity, NoParams> {
  final P2PPurposeSessionVoiceCallContract contract;

  LeaveCall({required this.contract});

  @override
  call(NoParams params) async => contract.leaveCall();
}
