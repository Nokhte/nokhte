// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';
part 'add_individual_session_metadata_to_collective_session_store.g.dart';

class AddIndividualSessionMetadataToCollectiveSessionStore = _AddIndividualSessionMetadataToCollectiveSessionStoreBase
    with _$AddIndividualSessionMetadataToCollectiveSessionStore;

abstract class _AddIndividualSessionMetadataToCollectiveSessionStoreBase
    extends BaseMobxDBStore<NoParams,
        InvidualMetadataAdditionToCollectiveSessionStatusEntity> with Store {
  @observable
  bool isAdded = false;

  final AddIndividualSessionMetadataToCollectiveSessionGetterStore getterStore;
  _AddIndividualSessionMetadataToCollectiveSessionStoreBase(
      {required this.getterStore});

  @observable
  BaseFutureStore<InvidualMetadataAdditionToCollectiveSessionStatusEntity>
      futureStore = BaseFutureStore(
    baseEntity:
        DefaultEntities.invidualMetadataAdditionToCollectiveSessionStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities
          .invidualMetadataAdditionToCollectiveSessionStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (additionStatusEntity) {
      isAdded = additionStatusEntity.isSent;
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
