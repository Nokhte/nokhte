import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class GetAgoraToken
    extends AbstractFutureLogic<AgoraCallTokenEntity, GetAgoraTokenParams> {
  final VoiceCallContract contract;
  GetAgoraToken({required this.contract});

  @override
  call(params) async => await contract.getAgoraToken(
        channelName: params.channelName,
      );
}

class GetAgoraTokenParams extends Equatable {
  final String channelName;

  const GetAgoraTokenParams({
    required this.channelName,
  });

  @override
  List<Object> get props => [channelName];
}
