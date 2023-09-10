import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class FetchChannelId extends AbstractFutureLogic<ChannelIdEntity, NoParams> {
  final VoiceCallContract contract;

  FetchChannelId({
    required this.contract,
  });

  @override
  call(NoParams params) async => await contract.fetchChannelId();
}
