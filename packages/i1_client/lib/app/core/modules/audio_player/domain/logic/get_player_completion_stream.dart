import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';

class GetPlayerCompletionStream
    implements
        AbstractSyncNoFailureLogic<PlayerCompletionStreamEntity, NoParams> {
  final AudioPlayerContract contract;

  GetPlayerCompletionStream({required this.contract});

  @override
  call(params) => contract.getPlayerCompletionStream(params);
}
