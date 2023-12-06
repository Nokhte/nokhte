import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class GetChannelId extends AbstractFutureLogic<ChannelIdEntity, NoParams> {
  final VoiceCallContract contract;

  GetChannelId({
    required this.contract,
  });

  @override
  call(NoParams params) async => await contract.getChannelId();
}
