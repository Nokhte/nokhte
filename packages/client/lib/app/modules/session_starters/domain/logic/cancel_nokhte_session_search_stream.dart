import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

class CancelNokhteSessionSearchStream
    extends AbstractSyncNoFailureLogic<bool, NoParams> {
  final SessionStartersContract contract;

  CancelNokhteSessionSearchStream({
    required this.contract,
  });

  @override
  call(params) => contract.cancelNokhteSessionSearchStream(params);
}
