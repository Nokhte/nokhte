// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
part 'update_session_metadata_store.g.dart';

class UpdateSessionMetadataStore = _UpdateSessionMetadataStoreBase
    with _$UpdateSessionMetadataStore;

abstract class _UpdateSessionMetadataStoreBase extends BaseMobxDBStore<
    UpdateSessionMetadataParams,
    IndividualSessionMetadataUpdateStatusEntity> with Store {
  @observable
  bool isUpdated = false;

  final UpdateSessionMetadataGetterStore getterStore;
  _UpdateSessionMetadataStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<IndividualSessionMetadataUpdateStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.individualSessionMetadataUpdateStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.individualSessionMetadataUpdateStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (updateStatusEntity) {
      isUpdated = updateStatusEntity.isSent;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(getterStore(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
