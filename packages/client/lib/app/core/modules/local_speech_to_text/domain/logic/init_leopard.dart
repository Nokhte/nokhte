import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';

class InitLeopard
    implements AbstractFutureLogic<InitLeopardStatusEntity, NoParams> {
  final LocalSpeechToTextContract contract;

  InitLeopard({required this.contract});

  @override
  call(params) async => await contract.initLeopard(params);
}
