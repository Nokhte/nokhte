import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class LeaveCall extends AbstractFutureLogic<CallStatusEntity, NoParams> {
  final VoiceCallContract contract;

  LeaveCall({required this.contract});

  @override
  call(NoParams params) async => contract.leaveCall();
}
