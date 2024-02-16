// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'purpose_session_presence_coordinator.g.dart';

class PurposeSessionPresenceCoordinator = _PurposeSessionPresenceCoordinatorBase
    with _$PurposeSessionPresenceCoordinator;

abstract class _PurposeSessionPresenceCoordinatorBase
    extends BasePresenceCoordinator with Store {
  final UpdateTimerStatus updateTimerStatusLogic;
  final GetPurposeSessionMetadataStore getSessionMetadataStore;
  final NokhteBlurStore blur;
  final CollaboratorPresenceIncidentsOverlayStore incidentsOverlayStore;

  _PurposeSessionPresenceCoordinatorBase({
    required this.updateTimerStatusLogic,
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

  @observable
  bool timerStatusIsUpdated = false;

  @action
  updateTimerStatus(bool params) async {
    timerStatusIsUpdated = false;
    state = StoreState.loading;
    final res = await updateTimerStatusLogic(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => timerStatusIsUpdated = status);
  }

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
    getSessionMetadataStore(NoParams());
  }

  @action
  setBasePhaseForScreen(double updateCurrentPhaseLogic) =>
      getSessionMetadataStore.setCurrentPhase(updateCurrentPhaseLogic);
}
