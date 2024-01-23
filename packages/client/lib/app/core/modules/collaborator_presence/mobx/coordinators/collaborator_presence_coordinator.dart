// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/mobx/mobx.dart';
part 'collaborator_presence_coordinator.g.dart';

class CollaboratorPresenceCoordinator = _CollaboratorPresenceCoordinatorBase
    with _$CollaboratorPresenceCoordinator;

abstract class _CollaboratorPresenceCoordinatorBase extends BaseMobxDBStore
    with Store {
  final UpdateOnCallStatus updateCallStatusLogic;
  final UpdateOnlineStatus updateOnlineStatusLogic;
  final UpdateTimerStatus updateTimerStatusLogic;
  final UpdateWhoIsTalking updateWhoIsTalkingLogic;
  final GetSessionMetadataStore getSessionMetadataStore;
  final UpdateCurrentPhase updateCurrentPhaseLogic;
  final CancelSessionMetadataStream cancelSessionMetadataStreamLogic;

  _CollaboratorPresenceCoordinatorBase({
    required this.updateWhoIsTalkingLogic,
    required this.updateCallStatusLogic,
    required this.cancelSessionMetadataStreamLogic,
    required this.updateCurrentPhaseLogic,
    required this.updateOnlineStatusLogic,
    required this.updateTimerStatusLogic,
    required this.getSessionMetadataStore,
  });

  @observable
  bool callStatusIsUpdated = false;

  @observable
  bool onlineStatusIsUpdated = false;

  @observable
  bool timerStatusIsUpdated = false;

  @observable
  bool whoIsTalkingIsUpdated = false;

  @observable
  bool currentPhaseIsUpdated = false;

  @observable
  bool isListening = false;

  @action
  updateCallStatus(UpdatePresencePropertyParams params) async {
    callStatusIsUpdated = false;
    state = StoreState.loading;
    final res = await updateCallStatusLogic(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => callStatusIsUpdated = status);
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
  updateTimerStatus(bool params) async {
    timerStatusIsUpdated = false;
    state = StoreState.loading;
    final res = await updateTimerStatusLogic(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => timerStatusIsUpdated = status);
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
