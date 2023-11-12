// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
part 'get_collaborator_perspectives_store.g.dart';

class GetCollaboratorPerspectivesStore = _GetCollaboratorPerspectivesStoreBase
    with _$GetCollaboratorPerspectivesStore;

abstract class _GetCollaboratorPerspectivesStoreBase extends BaseMobxDBStore<
    CollectiveSessionAudioExtrapolationInfo,
    CollaboratorPerspectivesEntity> with Store {
  @observable
  CollaboratorPerspectivesEntity collaboratorPerspectives =
      DefaultEntities.unwrappedCollaboratorPerspectivesEntity;

  final GetCollaboratorPerspectivesGetterStore getterStore;
  _GetCollaboratorPerspectivesStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<CollaboratorPerspectivesEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.collaboratorPerspectivesEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.collaboratorPerspectivesEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (perspectivesEntity) {
      collaboratorPerspectives = perspectivesEntity;
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
