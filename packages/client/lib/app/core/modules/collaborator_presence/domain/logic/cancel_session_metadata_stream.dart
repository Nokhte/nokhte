import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class CancelSessionMetadataStream
    implements AbstractSyncNoFailureLogic<bool, NoParams> {
  final CollaboratorPresenceContract contract;

  CancelSessionMetadataStream({required this.contract});

  @override
  call(params) => contract.cancelSessionMetadataStream(params);
}
