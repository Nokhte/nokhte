// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
// * Equatable Import
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/getters/enter_collaborator_pool_getter_store.dart';
import 'package:primala_backend/constants/phrase_components/collaborator_phrase.dart';
// * Mobx Codegen Inclusion
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
