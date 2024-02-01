// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/modules.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';
import 'package:nokhte/app/core/widgets/collaborator_presence_incidents_overlay/stack/presentation/mobx/collaborator_presence_incidents_overlay_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'base_presence_coordinator.g.dart';

class BasePresenceCoordinator<T> = _BasePresenceCoordinatorBase<T>
    with _$BasePresenceCoordinator<T>;

abstract class _BasePresenceCoordinatorBase<T> extends BaseMobxDBStore
    with Store {
  final UpdateOnlineStatus updateOnlineStatusLogic;
  final UpdateWhoIsTalking updateWhoIsTalkingLogic;
  final GetSessionMetadataStore getSessionMetadataStore;
  final UpdateCurrentPhase updateCurrentPhaseLogic;
  final CancelSessionMetadataStream cancelSessionMetadataStreamLogic;
  final NokhteBlurStore blur;
  final CollaboratorPresenceIncidentsOverlayStore incidentsOverlayStore;

  _BasePresenceCoordinatorBase({
    required this.updateWhoIsTalkingLogic,
    required this.cancelSessionMetadataStreamLogic,
    required this.updateCurrentPhaseLogic,
    required this.updateOnlineStatusLogic,
    required this.getSessionMetadataStore,
    required this.blur,
  }) : incidentsOverlayStore = CollaboratorPresenceIncidentsOverlayStore(
          sessionMetadataStore: getSessionMetadataStore,
          blur: blur,
        );

  @observable
  bool callStatusIsUpdated = false;

  @observable
  bool onlineStatusIsUpdated = false;

  @observable
  bool whoIsTalkingIsUpdated = false;

  @observable
  bool currentPhaseIsUpdated = false;

  @observable
  bool isListening = false;

  @action
  initReactors({
    required Function onCollaboratorJoined,
    required Function onCollaboratorLeft,
  }) {
    incidentsOverlayStore.collaboratorPresenceReactor(
        onCollaboratorJoined, onCollaboratorLeft);
  }

  @action
  updateOnlineStatus(UpdatePresencePropertyParams params) async {
    onlineStatusIsUpdated = false;
    state = StoreState.loading;
    final res = await updateOnlineStatusLogic(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => onlineStatusIsUpdated = status);
  }

  @action
  updateWhoIsTalking(UpdateWhoIsTalkingParams params) async {
    whoIsTalkingIsUpdated = false;
    state = StoreState.loading;
    final res = await updateWhoIsTalkingLogic(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => whoIsTalkingIsUpdated = status);
  }

  @action
  updateCurrentPhase(double params) async {
    currentPhaseIsUpdated = false;
    state = StoreState.loading;
    final res = await updateCurrentPhaseLogic(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => currentPhaseIsUpdated = status);
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

  @override
  List<Object> get props => [];
}
