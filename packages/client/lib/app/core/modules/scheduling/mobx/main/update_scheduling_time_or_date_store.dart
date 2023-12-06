// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
part 'update_scheduling_time_or_date_store.g.dart';

class UpdateSchedulingTimeOrDateStore = _UpdateSchedulingTimeOrDateStoreBase
    with _$UpdateSchedulingTimeOrDateStore;

abstract class _UpdateSchedulingTimeOrDateStoreBase extends BaseMobxDBStore<
    UpdateSchedulingTimeOrDateParams,
    SchedulingSessionUpdateTimeOrDateStatusEntity> with Store {
  @observable
  bool isUpdated = false;

  final UpdateSchedulingTimeOrDate logic;
  _UpdateSchedulingTimeOrDateStoreBase({required this.logic});

  @observable
  BaseFutureStore<SchedulingSessionUpdateTimeOrDateStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.schedulingSessionUpdateStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.schedulingSessionUpdateStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (updateStatusEntity) {
      isUpdated = updateStatusEntity.isSent;
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
