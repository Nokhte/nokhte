import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class InitAgoraSdk
    implements AbstractFutureNoFailureLogic<RtcEngine, NoParams> {
  final VoiceCallContract contract;

  InitAgoraSdk({required this.contract});

  @override
  call(params) async => await contract.initAgoraSdk(params);
}
