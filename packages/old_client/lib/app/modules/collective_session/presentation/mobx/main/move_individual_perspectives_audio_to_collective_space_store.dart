// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';
part 'move_individual_perspectives_audio_to_collective_space_store.g.dart';

class MoveIndividualPerspectivesAudioToCollectiveSpaceStore = _MoveIndividualPerspectivesAudioToCollectiveSpaceStoreBase
    with _$MoveIndividualPerspectivesAudioToCollectiveSpaceStore;

abstract class _MoveIndividualPerspectivesAudioToCollectiveSpaceStoreBase
    extends BaseMobxDBStore<NoParams,
        IndividualAudioMovementToCollectiveSpaceStatusEntity> with Store {
  @observable
  bool isMoved = false;

  final MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStore getterStore;
  _MoveIndividualPerspectivesAudioToCollectiveSpaceStoreBase(
      {required this.getterStore});

  @observable
  BaseFutureStore<IndividualAudioMovementToCollectiveSpaceStatusEntity>
      futureStore = BaseFutureStore(
    baseEntity:
        DefaultEntities.individualAudioMovementToCollectiveSpaceStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
          DefaultEntities.individualAudioMovementToCollectiveSpaceStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (movementStatusEntity) {
      isMoved = movementStatusEntity.isSent;
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
