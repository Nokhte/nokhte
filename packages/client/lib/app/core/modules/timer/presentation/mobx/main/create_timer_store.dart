// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/presentation/presentation.dart';
part 'create_timer_store.g.dart';

class CreateTimerStore = _CreateTimerStoreBase with _$CreateTimerStore;

abstract class _CreateTimerStoreBase
    extends BaseMobxDBStore<CreateTimerParams, TimerCreationStatusEntity>
    with Store {
  @observable
  bool isCreated = false;

  final CreateTimerGetterStore getterStore;
  _CreateTimerStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<TimerCreationStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.timerCreationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.timerCreationStatusEntity),
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
