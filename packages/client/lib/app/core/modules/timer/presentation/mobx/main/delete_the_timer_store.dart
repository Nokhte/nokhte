// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/presentation/presentation.dart';
part 'delete_the_timer_store.g.dart';

class DeleteTheTimerStore = _DeleteTheTimerStoreBase with _$DeleteTheTimerStore;

abstract class _DeleteTheTimerStoreBase
    extends BaseMobxDBStore<NoParams, TimerDeletionStatusEntity> with Store {
  @observable
  bool isDeleted = false;

  final DeleteTheTimerGetterStore getterStore;
  _DeleteTheTimerStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<TimerDeletionStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.timerDeletionStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.timerDeletionStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (deletionStatusEntity) {
      isDeleted = deletionStatusEntity.isSent;
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
