// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_presence_coordinator.g.dart';

class SessionPresenceCoordinator = _SessionPresenceCoordinatorBase
    with _$SessionPresenceCoordinator;

abstract class _SessionPresenceCoordinatorBase with Store, BaseMobxLogic {
  final UpdateOnlineStatus updateOnlineStatusLogic;
  final UpdateCurrentPhase updateCurrentPhaseLogic;
  final CancelSessionMetadataStream cancelSessionMetadataStreamLogic;
  final SessionMetadataStore sessionMetadataStore;
  final CollaboratorPresenceIncidentsOverlayStore incidentsOverlayStore;
  final AddContent addContentLogic;
  final CompleteTheSession completeTheSessionLogic;
  final StartTheSession startTheSessionLogic;
  final UpdateWhoIsTalking updateWhoIsTalkingLogic;

  _SessionPresenceCoordinatorBase({
    required this.cancelSessionMetadataStreamLogic,
    required this.updateWhoIsTalkingLogic,
    required this.updateCurrentPhaseLogic,
    required this.updateOnlineStatusLogic,
    required this.sessionMetadataStore,
    required this.addContentLogic,
    required this.startTheSessionLogic,
    required this.completeTheSessionLogic,
  }) : incidentsOverlayStore = CollaboratorPresenceIncidentsOverlayStore(
          sessionMetadataStore: sessionMetadataStore,
        ) {
    initBaseLogicActions();
  }

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
  ReactionDisposer initReactors({
    required Function onCollaboratorJoined,
    required Function onCollaboratorLeft,
  }) =>
      incidentsOverlayStore.collaboratorPresenceReactor(
          onCollaboratorJoined, onCollaboratorLeft);

  @action
  dispose() async {
    setState(StoreState.loading);
    final res = cancelSessionMetadataStreamLogic(NoParams());
    await sessionMetadataStore.dispose();
    isListening = res;
    setState(StoreState.loaded);
  }

  @action
  listen() {
    setState(StoreState.loading);
    sessionMetadataStore.get(NoParams());
    setState(StoreState.loaded);
  }

  @action
  addContent(String params) async {
    final res = await addContentLogic(params);
    res.fold(
      (failure) => errorUpdater(failure),
      (contentUpdateStatus) => contentIsUpdated = contentUpdateStatus,
    );
    setState(StoreState.loaded);
  }

  @action
  completeTheSession() async {
    final res = await completeTheSessionLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (sessionUpdateStatus) => sessionIsFinished = sessionUpdateStatus,
    );
    setState(StoreState.loaded);
  }

  @action
  updateWhoIsTalking(UpdateWhoIsTalkingParams params) async {
    final res = await updateWhoIsTalkingLogic(params);
    res.fold(
      (failure) => errorUpdater(failure),
      (gyroscopeUpdateStatus) =>
          speakerSpotlightIsUpdated = gyroscopeUpdateStatus,
    );
    setState(StoreState.loaded);
  }

  @action
  updateOnlineStatus(bool params) async {
    onlineStatusIsUpdated = false;
    setState(StoreState.loading);
    final res = await updateOnlineStatusLogic(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => onlineStatusIsUpdated = status);
    setState(StoreState.loaded);
  }

  @action
  updateCurrentPhase(double params) async {
    Timer.periodic(Seconds.get(0, milli: 500), (timer) async {
      if (sessionMetadataStore.userPhase != params) {
        currentPhaseIsUpdated = false;
        setState(StoreState.loading);
        final res = await updateCurrentPhaseLogic(params);
        res.fold((failure) => errorUpdater(failure),
            (status) => currentPhaseIsUpdated = status);
        setState(StoreState.loaded);
      } else {
        timer.cancel();
      }
    });
  }

  @action
  startTheSession() async {
    setState(StoreState.loading);
    final res = await startTheSessionLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (status) => sessionStartStatusIsUpdated = status,
    );
    setState(StoreState.loaded);
  }
}
