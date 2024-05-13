import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

class CancelSessionActivationStream
    extends AbstractSyncNoFailureLogic<bool, NoParams> {
  final SessionStartersContract contract;

  CancelSessionActivationStream({
    required this.contract,
  });

  @override
  call(params) => contract.cancelSessionActivationStream(params);
}
