// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
// * Equatable Import
// * Mobx Codegen Inclusion
part 'update_user_delta_store.g.dart';

class UpdateUserDeltaStore = _UpdateUserDeltaStoreBase
    with _$UpdateUserDeltaStore;

abstract class _UpdateUserDeltaStoreBase extends BaseMobxDBStore<
    UpdateUserDeltaParams,
    CollaborativeDocDeltaUpdaterStatusEntity> with Store {
  final UpdateUserDeltaGetterStore getterStore;

  @observable
  bool isUpdated = false;

  @action
  setToDefault() {
    isUpdated = false;
    state = StoreState.initial;
  }

  _UpdateUserDeltaStoreBase({
    required this.getterStore,
  });

  @observable
  BaseFutureStore<CollaborativeDocDeltaUpdaterStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.defaultCollaborativeDocDeltaUpdaterStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultCollaborativeDocDeltaUpdaterStatusEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    return result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (deltaStatusEntity) {
      isUpdated = deltaStatusEntity.isSent;
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
