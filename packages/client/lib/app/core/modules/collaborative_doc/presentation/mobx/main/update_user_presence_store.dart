// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'update_user_presence_store.g.dart';

class UpdateUserPresenceStore = _UpdateUserPresenceStoreBase
    with _$UpdateUserPresenceStore;

abstract class _UpdateUserPresenceStoreBase extends BaseMobxDBStore<
    UpdateUserPresenceParams,
    CollaborativeDocPresenceUpdaterStatusEntity> with Store {
  final UpdateUserPresenceGetterStore getterStore;

  _UpdateUserPresenceStoreBase({
    required this.getterStore,
  });

  @observable
  bool isUpdated = false;

  @action
  setToDefault() {
    isUpdated = false;
    state = StoreState.initial;
  }

  @observable
  BaseFutureStore<CollaborativeDocPresenceUpdaterStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity:
        DefaultEntities.defaultCollaborativeDocPresenceUpdaterStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultCollaborativeDocPresenceUpdaterStatusEntity,
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
