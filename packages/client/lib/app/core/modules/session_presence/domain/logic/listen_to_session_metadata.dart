import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';

class ListenToSessionMetadata
    implements AbstractFutureLogic<Stream<NokhteSessionMetadata>, NoParams> {
  final SessionPresenceContract contract;

  ListenToSessionMetadata({required this.contract});

  @override
  call(params) async => await contract.listenToSessionMetadata(params);
}
