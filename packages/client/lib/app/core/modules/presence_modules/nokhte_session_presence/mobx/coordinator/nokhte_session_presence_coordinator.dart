// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
part 'nokhte_session_presence_coordinator.g.dart';

class NokhteSessionPresenceCoordinator = _NokhteSessionPresenceCoordinatorBase
    with _$NokhteSessionPresenceCoordinator;

abstract class _NokhteSessionPresenceCoordinatorBase
    extends BasePresenceCoordinator with Store {
  final GetNokhteSessionMetadataStore getSessionMetadataStore;
  final NokhteBlurStore blur;
  final CollaboratorPresenceIncidentsOverlayStore incidentsOverlayStore;

  _NokhteSessionPresenceCoordinatorBase({
    required super.updateWhoIsTalkingLogic,
    required super.cancelSessionMetadataStreamLogic,
    required super.updateCurrentPhaseLogic,
    required super.updateOnlineStatusLogic,
    required this.getSessionMetadataStore,
    required this.blur,
  }) : incidentsOverlayStore = CollaboratorPresenceIncidentsOverlayStore(
          sessionMetadataStore: getSessionMetadataStore,
          blur: blur,
        );

  @override
  @action
  initReactors({
    required Function onCollaboratorJoined,
    required Function onCollaboratorLeft,
  }) {
    incidentsOverlayStore.collaboratorPresenceReactor(
        onCollaboratorJoined, onCollaboratorLeft);
  }

  @action
  dispose() async {
    state = StoreState.loading;
    final res = cancelSessionMetadataStreamLogic(NoParams());
    await getSessionMetadataStore.dispose();
    isListening = res;
  }

  @action
  listen() {
    state = StoreState.loading;
    getSessionMetadataStore.get(NoParams());
  }

  @action
  setBasePhaseForScreen(double updateCurrentPhaseLogic) =>
      getSessionMetadataStore.setCurrentPhase(updateCurrentPhaseLogic);
}
