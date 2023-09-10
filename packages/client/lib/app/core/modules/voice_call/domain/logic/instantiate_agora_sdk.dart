import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class InstantiateAgoraSdk
    extends AbstractFutureLogic<AgoraSdkStatusEntity, NoParams> {
  final P2PPurposeSessionVoiceCallContract contract;

  InstantiateAgoraSdk({required this.contract});

  @override
  call(NoParams params) async => await contract.instantiateAgoraSdk();
}
