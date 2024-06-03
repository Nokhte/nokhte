import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

class ListenToSessionActivationStatus
    implements AbstractFutureLogic<Stream<bool>, NoParams> {
  final SessionStartersContract contract;

  ListenToSessionActivationStatus({required this.contract});

  @override
  call(params) async => await contract.listenToSessionActivationStatus(params);
}
