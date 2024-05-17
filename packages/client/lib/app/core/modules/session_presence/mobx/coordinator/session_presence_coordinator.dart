// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
part 'session_presence_coordinator.g.dart';

class SessionPresenceCoordinator = _SessionPresenceCoordinatorBase
    with _$SessionPresenceCoordinator;

abstract class _SessionPresenceCoordinatorBase extends BaseMobxDBStore
    with Store {
  final UpdateOnlineStatus updateOnlineStatusLogic;
  final UpdateCurrentPhase updateCurrentPhaseLogic;
  final CancelSessionMetadataStream cancelSessionMetadataStreamLogic;
  final ListenToSessionMetadataStore listenToSessionMetadataStore;
  final CollaboratorPresenceIncidentsOverlayStore incidentsOverlayStore;
  final AddContent addContentLogic;
  final CompleteTheSession completeTheSessionLogic;
  final UpdateHasGyroscope updateHasGyroscopeLogic;
  final StartTheSession startTheSessionLogic;
  final UpdateWhoIsTalking updateWhoIsTalkingLogic;

  _SessionPresenceCoordinatorBase({
    required this.cancelSessionMetadataStreamLogic,
    required this.updateWhoIsTalkingLogic,
    required this.updateCurrentPhaseLogic,
    required this.updateOnlineStatusLogic,
    required this.listenToSessionMetadataStore,
    required this.addContentLogic,
    required this.startTheSessionLogic,
    required this.completeTheSessionLogic,
    required this.updateHasGyroscopeLogic,
  }) : incidentsOverlayStore = CollaboratorPresenceIncidentsOverlayStore(
          sessionMetadataStore: listenToSessionMetadataStore,
        );

  @observable
  bool contentIsUpdated = false;

  @observable
  bool sessionIsFinished = false;

  @observable
  bool gyroscopeAvailabilityIsUpdated = false;

  @observable
  bool onlineStatusIsUpdated = false;

  @observable
  bool whoIsTalkingIsUpdated = false;

  @observable
  bool currentPhaseIsUpdated = false;

  @observable
  bool isListening = false;

  @observable
  bool sessionStartStatusIsUpdated = false;

  @observable
  bool speakerSpotlightIsUpdated = false;

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
    await listenToSessionMetadataStore.dispose();
    isListening = res;
  }

  @action
  listen() {
    state = StoreState.loading;
    listenToSessionMetadataStore.get(NoParams());
  }

  @action
  addContent(String params) async {
    final res = await addContentLogic(params);
    res.fold(
      (failure) => errorUpdater(failure),
      (contentUpdateStatus) => contentIsUpdated = contentUpdateStatus,
    );
  }

  @action
  completeTheSession() async {
    final res = await completeTheSessionLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (sessionUpdateStatus) => sessionIsFinished = sessionUpdateStatus,
    );
  }

  @action
  updateHasGyroscope(bool param) async {
    final res = await updateHasGyroscopeLogic(param);
    res.fold(
      (failure) => errorUpdater(failure),
      (gyroscopeUpdateStatus) =>
          gyroscopeAvailabilityIsUpdated = gyroscopeUpdateStatus,
    );
  }

  @action
  updateWhoIsTalking(UpdateWhoIsTalkingParams params) async {
    final res = await updateWhoIsTalkingLogic(params);
    res.fold(
      (failure) => errorUpdater(failure),
      (gyroscopeUpdateStatus) =>
          speakerSpotlightIsUpdated = gyroscopeUpdateStatus,
    );
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
  updateCurrentPhase(double params) async {
    currentPhaseIsUpdated = false;
    state = StoreState.loading;
    final res = await updateCurrentPhaseLogic(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => currentPhaseIsUpdated = status);
  }

  @action
  startTheSession() async {
    state = StoreState.loading;
    final res = await startTheSessionLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (status) => sessionStartStatusIsUpdated = status,
    );
  }
}
