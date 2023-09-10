// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
// * Equatable Import
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'create_collaborative_doc_store.g.dart';

class CreateCollaborativeDocStore = _CreateCollaborativeDocStoreBase
    with _$CreateCollaborativeDocStore;

abstract class _CreateCollaborativeDocStoreBase extends BaseMobxDBStore<
    CreateCollaborativeDocParams,
    CollaborativeDocCreationStatusEntity> with Store {
  @observable
  bool isCreated = false;

  final CreateCollaborativeDocGetterStore getterStore;

  _CreateCollaborativeDocStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<CollaborativeDocCreationStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.defaultCollaborativeDocCreationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultCollaborativeDocCreationStatusEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    return result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (statusEntity) {
      isCreated = statusEntity.isSent;
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
