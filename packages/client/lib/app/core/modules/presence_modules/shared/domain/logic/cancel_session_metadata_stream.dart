import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';

class CancelSessionMetadataStream
    implements AbstractSyncNoFailureLogic<bool, NoParams> {
  final BasePresenceContract contract;

  CancelSessionMetadataStream({required this.contract});

  @override
  call(params) => contract.cancelSessionMetadataStream(params);
}
