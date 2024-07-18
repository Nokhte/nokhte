import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session/session.dart';

class CancelSessionMetadataStream
    implements AbstractSyncNoFailureLogic<bool, NoParams> {
  final SessionPresenceContract contract;

  CancelSessionMetadataStream({required this.contract});

  @override
  call(params) => contract.cancelSessionMetadataStream(params);
}
