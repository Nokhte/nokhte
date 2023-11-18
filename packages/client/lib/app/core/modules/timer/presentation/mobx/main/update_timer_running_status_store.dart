// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/presentation/presentation.dart';
part 'update_timer_running_status_store.g.dart';

class UpdateTimerRunningStatusStore = _UpdateTimerRunningStatusStoreBase
    with _$UpdateTimerRunningStatusStore;

abstract class _UpdateTimerRunningStatusStoreBase
    extends BaseMobxDBStore<bool, TimerRunningUpdateStatusEntity> with Store {
  @observable
  bool isUpdated = false;

  final UpdateTimerRunningStatusGetterStore getterStore;
  _UpdateTimerRunningStatusStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<TimerRunningUpdateStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.timerRunningUpdateStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.timerRunningUpdateStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (timerRunningStatusEntity) {
      isUpdated = timerRunningStatusEntity.isSent;
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
