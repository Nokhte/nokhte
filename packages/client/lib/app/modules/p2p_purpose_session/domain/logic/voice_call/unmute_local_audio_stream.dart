import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class UnmuteLocalAudioStream
    extends AbstractFutureLogic<LocalAudioStreamStatusEntity, NoParams> {
  final P2PPurposeSessionVoiceCallContract contract;

  UnmuteLocalAudioStream({required this.contract});

  @override
  call(NoParams params) async => contract.unmuteLocalAudioStream();
}
