import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/domain/domain.dart';

class GetSessionPresetInfo
    implements AbstractFutureLogic<SessionPresetInfoEntity, String> {
  final SessionPresenceContract contract;

  GetSessionPresetInfo({required this.contract});

  @override
  call(params) async => await contract.getSessionPresetInfo(params);
}
