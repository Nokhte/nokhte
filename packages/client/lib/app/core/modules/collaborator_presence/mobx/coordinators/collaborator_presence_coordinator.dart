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
  final UpdateOnCallStatus callStatus;
  final UpdateOnlineStatus onlineStatus;
  final UpdateTimerStatus timerStatus;
  final UpdateWhoIsTalking whoIsTalking;
  final GetSessionMetadataStore getSessionMetadata;
  final UpdateCurrentPhase currentPhase;
  final CancelSessionMetadataStream cancelSessionMetadataStream;

  _CollaboratorPresenceCoordinatorBase({
    required this.whoIsTalking,
    required this.callStatus,
    required this.cancelSessionMetadataStream,
    required this.currentPhase,
    required this.onlineStatus,
    required this.timerStatus,
    required this.getSessionMetadata,
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
    final res = await callStatus(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => callStatusIsUpdated = status);
  }

  @action
  updateOnlineStatus(UpdatePresencePropertyParams params) async {
    onlineStatusIsUpdated = false;
    state = StoreState.loading;
    final res = await onlineStatus(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => onlineStatusIsUpdated = status);
  }

  @action
  updateTimerStatus(bool params) async {
    timerStatusIsUpdated = false;
    state = StoreState.loading;
    final res = await timerStatus(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => timerStatusIsUpdated = status);
  }

  @action
  updateWhoIsTalking(UpdateWhoIsTalkingParams params) async {
    whoIsTalkingIsUpdated = false;
    state = StoreState.loading;
    final res = await whoIsTalking(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => whoIsTalkingIsUpdated = status);
  }

  @action
  updateCurrentPhase(double params) async {
    currentPhaseIsUpdated = false;
    state = StoreState.loading;
    final res = await currentPhase(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => currentPhaseIsUpdated = status);
  }

  @action
  dispose() async {
    state = StoreState.loading;
    final res = cancelSessionMetadataStream(NoParams());
    await getSessionMetadata.dispose();
    isListening = res;
  }

  @action
  listen() {
    state = StoreState.loading;
    getSessionMetadata(NoParams());
  }

  @action
  setBasePhaseForScreen(double currentPhase) =>
      getSessionMetadata.setCurrentPhase(currentPhase);

  @override
  List<Object> get props => [];
}
