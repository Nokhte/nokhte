import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/domain/domain.dart';

class CompleteTheSession implements AbstractFutureLogic<bool, NoParams> {
  final SessionPresenceContract contract;

  CompleteTheSession({required this.contract});

  @override
  call(params) async => await contract.completeTheSession(params);
}
