import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class GetChannelId extends AbstractFutureLogic<String, GetChannelIdParams> {
  final VoiceCallContract contract;

  GetChannelId({
    required this.contract,
  });

  @override
  call(params) async => await contract.getChannelId(params);
}

enum GetChannelIdParams {
  forCollaboration,
  forNokhteSession,
}
