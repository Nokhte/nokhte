// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'irl_nokhte_session_notes_widgets_coordinator.dart';
part 'irl_nokhte_session_notes_coordinator.g.dart';

class IrlNokhteSessionNotesCoordinator = _IrlNokhteSessionNotesCoordinatorBase
    with _$IrlNokhteSessionNotesCoordinator;

abstract class _IrlNokhteSessionNotesCoordinatorBase extends BaseCoordinator
    with Store {
  final IrlNokhteSessionNotesWidgetsCoordinator widgets;
  final IrlNokhteSessionPresenceCoordinator presence;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;

  _IrlNokhteSessionNotesCoordinatorBase({
    required this.widgets,
    required super.captureScreen,
    required this.presence,
    required this.swipe,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() {
    widgets.constructor();
  }

  @action
  onInactive() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
  }

  @action
  onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (sessionMetadata.collaboratorIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }
}
