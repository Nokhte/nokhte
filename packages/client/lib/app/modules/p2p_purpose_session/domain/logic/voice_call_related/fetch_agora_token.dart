import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/contracts/p2p_purpose_session_contract.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

class FetchAgoraToken
    extends AbstractFutureLogic<AgoraCallTokenEntity, FetchAgoraTokenParams> {
  final P2PPurposeSessionContract contract;
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
