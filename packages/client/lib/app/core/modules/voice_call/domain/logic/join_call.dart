import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class JoinCall extends AbstractFutureLogic<CallStatusEntity, JoinCallParams> {
  final P2PPurposeSessionVoiceCallContract contract;

  JoinCall({required this.contract});

  @override
  call(params) async => contract.joinCall(params.token, params.channelId);
}

class JoinCallParams extends Equatable {
  final String token;
  final String channelId;

  const JoinCallParams({
    required this.token,
    required this.channelId,
  });

  @override
  List<Object> get props => [token];
}
