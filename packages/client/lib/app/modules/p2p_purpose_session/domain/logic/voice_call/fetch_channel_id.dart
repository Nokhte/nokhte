import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class FetchChannelId extends AbstractFutureLogic<ChannelIdEntity, NoParams> {
  final P2PPurposeSessionVoiceCallContract contract;

  FetchChannelId({
    required this.contract,
  });

  @override
  call(NoParams params) async => await contract.fetchChannelId();
}
