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
  final AddMetadata addMetadataLogic;

  _UserMetadataCoordinatorBase({
    required this.addMetadataLogic,
  });

  @observable
  bool hasAddedMetadata = false;

  @action
  Future<void> addMetadata(NoParams param) async {
    state = StoreState.loading;
    final res = await addMetadataLogic(NoParams());
    res.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (status) {
      hasAddedMetadata = status;
    });
    state = StoreState.loaded;
  }
}
