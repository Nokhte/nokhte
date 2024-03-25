import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/irl_nokhte_session_presence/domain/domain.dart';

class CompleteTheSession implements AbstractFutureLogic<bool, NoParams> {
  final IrlNokhteSessionPresenceContract contract;

  CompleteTheSession({required this.contract});

  @override
  call(params) async => await contract.completeTheSession(params);
}
