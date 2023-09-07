// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
// * Equatable Import
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/getters/getters.dart';
// * Mobx Codegen Inclusion
part 'exit_collaborator_pool_store.g.dart';

class ExitCollaboratorPoolStore = _ExitCollaboratorPoolStoreBase
    with _$ExitCollaboratorPoolStore;

abstract class _ExitCollaboratorPoolStoreBase
    extends BaseMobxDBStore<NoParams, CollaboratorPoolExitStatusEntity>
    with Store {
  final ExitCollaboratorPoolGetterStore exitCollaboratorPoolGetterStore;

  _ExitCollaboratorPoolStoreBase({
    required this.exitCollaboratorPoolGetterStore,
  });

  @observable
  bool hasLeft = false;

  @observable
  BaseFutureStore<CollaboratorPoolExitStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.collaboratorPoolExitStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.collaboratorPoolExitStatusEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (entryStatusEntity) {
      hasLeft = entryStatusEntity.isSent;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture =
        ObservableFuture(exitCollaboratorPoolGetterStore());
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
