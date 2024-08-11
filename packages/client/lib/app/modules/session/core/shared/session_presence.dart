import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/session/session.dart';

mixin SessionPresence on Reactions {
  SessionPresenceCoordinator get presence;

  onInactive() async {
    await presence.updateOnlineStatus(false);
  }

  onResumed() async {
    await presence.updateOnlineStatus(true);
    if (presence.sessionMetadataStore.everyoneIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }
}
