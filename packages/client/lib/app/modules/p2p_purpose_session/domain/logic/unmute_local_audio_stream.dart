import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/local_audio_stream_status_entity.dart';

class UnmuteLocalAudioStream
    extends AbstractFutureLogic<LocalAudioStreamStatusEntity, NoParams> {
  final P2PPurposeSessionContract contract;

  UnmuteLocalAudioStream({required this.contract});

  @override
  call(NoParams params) async => contract.unmuteLocalAudioStream();
}
