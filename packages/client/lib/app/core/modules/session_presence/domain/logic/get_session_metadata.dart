import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_irl_nokhte_sessions/types/types.dart';

class GetSessionMetadata
    implements AbstractFutureLogic<Stream<IrlNokhteSessionMetadata>, NoParams> {
  final SessionPresenceContract contract;

  GetSessionMetadata({required this.contract});

  @override
  call(params) async => await contract.getSessionMetadata(params);
}
