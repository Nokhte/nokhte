import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class UpdateMeetingIdAndToken
    implements
        AbstractFutureLogic<MeetingIdAndTokenUpdateStatusEntity,
            UpdateMeetingIdAndTokenParams> {
  final CollaboratorPresenceContract contract;

  UpdateMeetingIdAndToken({required this.contract});

  @override
  call(params) async => await contract.updateMeetingIdAndToken(params);
}

enum UpdateMeetingIdAndTokenParams { clearOut, refresh }
