import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/contracts/local_speech_to_text_contract.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';

class InitLeopard
    implements AbstractFutureLogic<InitLeopardStatusEntity, NoParams> {
  final LocalSpeechToTextContract contract;

  InitLeopard({required this.contract});

  @override
  call(params) async => await contract.initLeopard(params);
}
