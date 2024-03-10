// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'irl_nokhte_session_notes_instructions_widgets_coordinator.dart';
part 'irl_nokhte_session_notes_instructions_coordinator.g.dart';

class IrlNokhteSessionNotesInstructionsCoordinator = _IrlNokhteSessionNotesInstructionsCoordinatorBase
    with _$IrlNokhteSessionNotesInstructionsCoordinator;

abstract class _IrlNokhteSessionNotesInstructionsCoordinatorBase
    extends BaseCoordinator with Store {
  final IrlNokhteSessionNotesInstructionsWidgetsCoordinator widgets;
  final TapDetector tap;
  final IrlNokhteSessionPresenceCoordinator presence;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;

  _IrlNokhteSessionNotesInstructionsCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
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
