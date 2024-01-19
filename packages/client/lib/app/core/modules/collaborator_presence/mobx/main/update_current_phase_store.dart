// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
part 'update_current_phase_store.g.dart';

class UpdateCurrentPhaseStore = _UpdateCurrentPhaseStoreBase
    with _$UpdateCurrentPhaseStore;

abstract class _UpdateCurrentPhaseStoreBase
    extends BaseMobxDBStore<UpdateCurrentPhaseParams, PhaseUpdateStatusEntity>
    with Store {
  @observable
  bool isUpdated = false;

  final UpdateCurrentPhase logic;
  _UpdateCurrentPhaseStoreBase({required this.logic});

  @observable
  BaseFutureStore<PhaseUpdateStatusEntity> futureStore = BaseFutureStore(
    baseEntity: Right(PhaseUpdateStatusEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(PhaseUpdateStatusEntity.initial())),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (updateStatusEntity) {
      isUpdated = updateStatusEntity.isTrue;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
