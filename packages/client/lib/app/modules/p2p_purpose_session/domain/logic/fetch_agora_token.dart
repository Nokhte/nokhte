import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/contracts/p2p_purpose_session_contract.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

class FetchAgoraToken
    extends AbstractFutureLogic<AgoraCallTokenEntity, NoParams> {
  final P2PPurposeSessionContract contract;
  FetchAgoraToken({required this.contract});

  @override
  call(params) async => await contract.fetchAgoraToken();
}
