// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
part 'user_information_coordinator.g.dart';

class UserInformationCoordinator = _UserInformationCoordinatorBase
    with _$UserInformationCoordinator;

abstract class _UserInformationCoordinatorBase extends BaseMobxDBStore
    with Store {
  final GetUserInfoStore getUserInfoStore;
  final UpdateHasAccessedQrCode updateHasAccessedQrCodeLogic;
  final UpdateHasEnteredStorage updateHasEnteredStorageLogic;

  _UserInformationCoordinatorBase({
    required this.getUserInfoStore,
    required this.updateHasAccessedQrCodeLogic,
    required this.updateHasEnteredStorageLogic,
  });

  @observable
  bool invitationFlowCompletionStatusIsUpdated = false;

  @observable
  bool invitationSendStatusIsUpdated = false;

  @observable
  bool invitationRepeatStatusIsUpdated = false;

  @observable
  bool storageStatusIsUpdated = false;

  @action
  updateHasAccessedQrCode(bool newStatus) async {
    state = StoreState.loading;
    final res = await updateHasAccessedQrCodeLogic(newStatus);
    res.fold((failure) => errorUpdater(failure),
        (status) => invitationFlowCompletionStatusIsUpdated = status);
    state = StoreState.loaded;
  }

  @action
  updateHasEnteredStorage(bool newStatus) async {
    state = StoreState.loading;
    final res = await updateHasEnteredStorageLogic(newStatus);
    res.fold((failure) => errorUpdater(failure),
        (status) => storageStatusIsUpdated = status);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
