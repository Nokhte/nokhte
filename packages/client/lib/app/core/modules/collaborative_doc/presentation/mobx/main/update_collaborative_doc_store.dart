// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
// * Equatable Import
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
// * Mobx Codegen Inclusion
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
      //
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (updateStatusEntity) {
      isUpdated = updateStatusEntity.isSent;
      setToDefault();
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
  }
}
