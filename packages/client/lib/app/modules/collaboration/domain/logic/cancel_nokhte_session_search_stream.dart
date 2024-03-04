import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';

class CancelNokhteSessionSearchStream
    extends AbstractSyncNoFailureLogic<bool, NoParams> {
  final CollaborationContract contract;

  CancelNokhteSessionSearchStream({
    required this.contract,
  });

  @override
  call(params) => contract.cancelNokhteSessionSearchStream(params);
}
