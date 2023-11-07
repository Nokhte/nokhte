// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'create_individual_session_store.g.dart';

class CreateIndividualSessionStore = _CreateIndividualSessionStoreBase
    with _$CreateIndividualSessionStore;

abstract class _CreateIndividualSessionStoreBase
    extends BaseMobxDBStore<NoParams, IndividualSessionCreationStatusEntity>
    with Store {
  @observable
  bool isCreated = false;

  final CreateIndividualSessionGetterStore getterStore;
  _CreateIndividualSessionStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<IndividualSessionCreationStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.individualSessionCreationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.individualSessionCreationStatusEntity),
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
