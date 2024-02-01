// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/modules.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';
part 'collaborator_presence_coordinator.g.dart';

class CollaboratorPresenceCoordinator = _CollaboratorPresenceCoordinatorBase
    with _$CollaboratorPresenceCoordinator;

abstract class _CollaboratorPresenceCoordinatorBase
    extends BasePresenceCoordinator with Store {
  final UpdateTimerStatus updateTimerStatusLogic;

  _CollaboratorPresenceCoordinatorBase({
    required this.updateTimerStatusLogic,
    required super.updateWhoIsTalkingLogic,
    required super.cancelSessionMetadataStreamLogic,
    required super.updateCurrentPhaseLogic,
    required super.updateOnlineStatusLogic,
    required super.getSessionMetadataStore,
    required super.blur,
  });

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
}
