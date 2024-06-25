import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';

mixin PresenceMixin on Store {
  late final SessionPresenceCoordinator presence;

  @action
  Future<void> onInactive() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
  }

  @action
  Future<void> onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (presence.sessionMetadataStore.everyoneIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }
}
