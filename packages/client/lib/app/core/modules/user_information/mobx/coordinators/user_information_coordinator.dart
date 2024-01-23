// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
part 'user_information_coordinator.g.dart';

class UserInformationCoordinator = _UserInformationCoordinatorBase
    with _$UserInformationCoordinator;

abstract class _UserInformationCoordinatorBase extends BaseMobxDBStore
    with Store {
  final GetUserInfoStore getUserInfoStore;
  final UpdateHasGoneThroughInvitationFlow
      updateHasGoneThroughInvitationFlowLogic;
  final UpdateHasSentAnInvitation updateHasSentAnInvitationLogic;
  final UpdateWantsToRepeatInvitationFlow
      updateWantsToRepeatInvitationFlowLogic;

  _UserInformationCoordinatorBase({
    required this.getUserInfoStore,
    required this.updateHasGoneThroughInvitationFlowLogic,
    required this.updateHasSentAnInvitationLogic,
    required this.updateWantsToRepeatInvitationFlowLogic,
  });

  @observable
  bool invitationFlowCompletionStatusIsUpdated = false;

  @observable
  bool invitationSendStatusIsUpdated = false;

  @observable
  bool invitationRepeatStatusIsUpdated = false;

  @action
  updateHasGoneThroughInvitationFlow(bool newStatus) async {
    state = StoreState.loading;
    final res = await updateHasGoneThroughInvitationFlowLogic(newStatus);
    res.fold((failure) => errorUpdater(failure),
        (status) => invitationFlowCompletionStatusIsUpdated = status);
    state = StoreState.loaded;
  }

  @action
  updateHasSentAnInvitation(bool newStatus) async {
    state = StoreState.loading;
    final res = await updateHasSentAnInvitationLogic(newStatus);
    res.fold((failure) => errorUpdater(failure),
        (status) => invitationSendStatusIsUpdated = status);
    state = StoreState.loaded;
  }

  @action
  updateWantsToRepeatInvitationFlow(bool newStatus) async {
    state = StoreState.loading;
    final res = await updateWantsToRepeatInvitationFlowLogic(newStatus);
    res.fold((failure) => errorUpdater(failure),
        (status) => invitationRepeatStatusIsUpdated = status);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
