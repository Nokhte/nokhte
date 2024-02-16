// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
part 'base_presence_coordinator.g.dart';

class BasePresenceCoordinator<T> = _BasePresenceCoordinatorBase<T>
    with _$BasePresenceCoordinator<T>;

abstract class _BasePresenceCoordinatorBase<T> extends BaseMobxDBStore
    with Store {
  final UpdateOnlineStatus updateOnlineStatusLogic;
  final UpdateWhoIsTalking updateWhoIsTalkingLogic;
  final UpdateCurrentPhase updateCurrentPhaseLogic;
  final CancelSessionMetadataStream cancelSessionMetadataStreamLogic;

  _BasePresenceCoordinatorBase({
    required this.updateWhoIsTalkingLogic,
    required this.cancelSessionMetadataStreamLogic,
    required this.updateCurrentPhaseLogic,
    required this.updateOnlineStatusLogic,
  });

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
  }) {}

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

  @override
  List<Object> get props => [];
}
