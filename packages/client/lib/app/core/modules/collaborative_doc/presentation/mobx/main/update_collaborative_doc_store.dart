// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
part 'update_collaborative_doc_store.g.dart';

class UpdateCollaborativeDocStore = _UpdateCollaborativeDocStoreBase
    with _$UpdateCollaborativeDocStore;

abstract class _UpdateCollaborativeDocStoreBase extends BaseMobxDBStore<
    UpdateCollaborativeDocParams,
    CollaborativeDocUpdateStatusEntity> with Store {
  final UpdateCollaborativeDocGetterStore getterStore;

  _UpdateCollaborativeDocStoreBase({required this.getterStore});

  @observable
  bool isUpdated = false;

  @action
  setToDefault() {
    isUpdated = false;
    state = StoreState.initial;
  }

  @observable
  BaseFutureStore<CollaborativeDocUpdateStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.defaultCollaborativeDocUpdateStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultCollaborativeDocUpdateStatusEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    return result.fold((failure) {
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
    futureStore.entityOrFailureFuture = ObservableFuture(
      getterStore(params),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
    setToDefault();
  }
}
