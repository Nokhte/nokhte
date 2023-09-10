import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class FetchAgoraToken
    extends AbstractFutureLogic<AgoraCallTokenEntity, FetchAgoraTokenParams> {
  final VoiceCallContract contract;
  FetchAgoraToken({required this.contract});

  @override
  call(params) async => await contract.fetchAgoraToken(
        channelName: params.channelName,
      );
}

class FetchAgoraTokenParams extends Equatable {
  final String channelName;

  const FetchAgoraTokenParams({
    required this.channelName,
  });

  @override
  List<Object> get props => [channelName];
}
