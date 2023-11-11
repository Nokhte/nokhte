// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
part 'create_a_perspectives_session_store.g.dart';

class CreateAPerspectivesSessionStore = _CreateAPerspectivesSessionStoreBase
    with _$CreateAPerspectivesSessionStore;

abstract class _CreateAPerspectivesSessionStoreBase
    extends BaseMobxDBStore<NoParams, PerspectiveSessionCreationStatusEntity>
    with Store {
  @observable
  bool isCreated = false;

  final CreateAPerspectivesSessionGetterStore getterStore;
  _CreateAPerspectivesSessionStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<PerspectiveSessionCreationStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.perspectivesSessionCreationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.perspectivesSessionCreationStatusEntity),
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
