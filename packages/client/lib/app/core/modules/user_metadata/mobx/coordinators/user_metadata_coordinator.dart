// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_metadata/domain/domain.dart';
part 'user_metadata_coordinator.g.dart';

class UserMetadataCoordinator = _UserMetadataCoordinatorBase
    with _$UserMetadataCoordinator;

abstract class _UserMetadataCoordinatorBase
    extends BaseMobxDBStore<NoParams, bool> with Store {
  final AddUserMetadata addUserMetadataLogic;
  final GetUserMetadata getUserMetadataLogic;

  _UserMetadataCoordinatorBase({
    required this.addUserMetadataLogic,
    required this.getUserMetadataLogic,
  });

  @observable
  bool hasAddedMetadata = false;

  @observable
  bool isSubscribed = false;

  @observable
  bool hasUsedTrial = false;

  @action
  getMetadata() async {
    final res = await getUserMetadataLogic(NoParams());
    res.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (metadataEntity) {
      hasUsedTrial = metadataEntity.hasUsedTrial;
      print("hasUsedTrial is $hasUsedTrial");
      isSubscribed = metadataEntity.isSubscribed;
      print("isSubscribed is $isSubscribed");
    });
    state = StoreState.loaded;
  }

  @action
  Future<void> addMetadata(NoParams param) async {
    state = StoreState.loading;
    final res = await addUserMetadataLogic(NoParams());
    res.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (status) {
      hasAddedMetadata = status;
    });
    state = StoreState.loaded;
  }
}
