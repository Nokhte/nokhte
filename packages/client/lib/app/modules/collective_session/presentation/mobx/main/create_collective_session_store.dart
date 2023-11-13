// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';
part 'create_collective_session_store.g.dart';

class CreateCollectiveSessionStore = _CreateCollectiveSessionStoreBase
    with _$CreateCollectiveSessionStore;

abstract class _CreateCollectiveSessionStoreBase
    extends BaseMobxDBStore<NoParams, CollectiveSessionCreationStatusEntity>
    with Store {
  @observable
  bool isCreated = false;

  final CreateCollectiveSessionGetterStore getterStore;
  _CreateCollectiveSessionStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<CollectiveSessionCreationStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.collectiveSessionCreationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.collectiveSessionCreationStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (creationStatusEntity) {
      isCreated = creationStatusEntity.isSent;
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
