import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';

class GetSessionMetadata
    implements AbstractFutureLogic<Stream<NokhteSessionMetadata>, NoParams> {
  final SessionPresenceContract contract;

  GetSessionMetadata({required this.contract});

  @override
  call(params) async => await contract.getSessionMetadata(params);
}
