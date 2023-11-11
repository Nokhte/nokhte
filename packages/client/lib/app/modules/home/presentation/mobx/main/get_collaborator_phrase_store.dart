// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/getter/get_collaborator_phrase_getter_store.dart';
part 'get_collaborator_phrase_store.g.dart';

class GetCollaboratorPhraseStore = _GetCollaboratorPhraseStoreBase
    with _$GetCollaboratorPhraseStore;

abstract class _GetCollaboratorPhraseStoreBase
    extends BaseMobxDBStore<NoParams, CollaboratorPhraseEntity> with Store {
  final GetCollaboratorPhraseGetterStore getCollaboratorPhraseGetterStore;

  _GetCollaboratorPhraseStoreBase({
    required this.getCollaboratorPhraseGetterStore,
  });

  CollaboratorPhraseEntity collaboratorPhraseEntity =
      const CollaboratorPhraseEntity(collaboratorPhrase: '');

  BaseFutureStore<CollaboratorPhraseEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.collaboratorPhraseEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.collaboratorPhraseEntity,
      ),
    ),
  );

  @observable
  String collaboratorPhrase = '';

  @override
  void stateOrErrorUpdater(result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (collaboratorPhraseEntity) {
        collaboratorPhrase = collaboratorPhraseEntity.collaboratorPhrase;
      },
    );
  }

  @override
  @action
  Future<void> call(NoParams params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture =
        ObservableFuture(getCollaboratorPhraseGetterStore());
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    state = StoreState.loaded;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
  }
}
