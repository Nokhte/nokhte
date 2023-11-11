// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';
part 'get_collaborator_individual_session_metadata_store.g.dart';

class GetCollaboratorIndividualSessionMetadataStore = _GetCollaboratorIndividualSessionMetadataStoreBase
    with _$GetCollaboratorIndividualSessionMetadataStore;

abstract class _GetCollaboratorIndividualSessionMetadataStoreBase
    extends BaseMobxDBStore<NoParams,
        CollaboratorIndividualSessionMetadataEntity> with Store {
  @observable
  Map collaboratorMetadata = {};

  final GetCollaboratorIndividualSessionMetadataGetterStore getterStore;
  _GetCollaboratorIndividualSessionMetadataStoreBase(
      {required this.getterStore});

  @observable
  BaseFutureStore<CollaboratorIndividualSessionMetadataEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.collaboratorIndividualSessionMetadataEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.collaboratorIndividualSessionMetadataEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (metadataEntity) {
      collaboratorMetadata = metadataEntity.sessionMetadata;
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
