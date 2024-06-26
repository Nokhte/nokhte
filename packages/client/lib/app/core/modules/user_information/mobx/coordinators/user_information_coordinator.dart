// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
part 'user_information_coordinator.g.dart';

class UserInformationCoordinator = _UserInformationCoordinatorBase
    with _$UserInformationCoordinator;

abstract class _UserInformationCoordinatorBase extends BaseMobxDBStore
    with Store {
  final GetPreferredPreset getPreferredPresetLogic;
  final GetUserInfoStore getUserInfoStore;
  final UpdatePreferredPreset updatePreferredPresetLogic;
  final UpdateHasEnteredStorage updateHasEnteredStorageLogic;

  _UserInformationCoordinatorBase({
    required this.getUserInfoStore,
    required this.updatePreferredPresetLogic,
    required this.updateHasEnteredStorageLogic,
    required this.getPreferredPresetLogic,
  });

  @observable
  bool invitationFlowCompletionStatusIsUpdated = false;

  @observable
  bool invitationSendStatusIsUpdated = false;

  @observable
  bool invitationRepeatStatusIsUpdated = false;

  @observable
  bool storageStatusIsUpdated = false;

  @observable
  PreferredPresetEntity preferredPreset = PreferredPresetEntity.initial();

  @action
  getPreferredPreset() async {
    state = StoreState.loading;
    final res = await getPreferredPresetLogic(NoParams());
    res.fold((failure) => errorUpdater(failure),
        (status) => preferredPreset = status);
    state = StoreState.loaded;
  }

  @action
  updatePreferredPreset(String presetUID) async {
    state = StoreState.loading;
    final res = await updatePreferredPresetLogic(presetUID);
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
