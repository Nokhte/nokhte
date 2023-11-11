// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import 'package:nokhte_backend/constants/types/types.dart';
part 'enter_collaborator_pool_store.g.dart';

class EnterCollaboratorPoolStore = _EnterCollaboratorPoolStoreBase
    with _$EnterCollaboratorPoolStore;

abstract class _EnterCollaboratorPoolStoreBase extends BaseMobxDBStore<
    CollaboratorPhraseIDs, CollaboratorPoolEntryStatusEntity> with Store {
  final EnterCollaboratorPoolGetterStore enterCollaboratorPoolGetterStore;

  @observable
  bool hasEntered = false;

  _EnterCollaboratorPoolStoreBase({
    required this.enterCollaboratorPoolGetterStore,
  });

  @observable
  BaseFutureStore<CollaboratorPoolEntryStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.collaboratorPoolEntryStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.collaboratorPoolEntryStatusEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (entryStatusEntity) {
      hasEntered = entryStatusEntity.isSent;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture =
        ObservableFuture(enterCollaboratorPoolGetterStore(
      phraseIDs: params,
    ));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
