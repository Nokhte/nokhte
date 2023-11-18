// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/presentation/presentation.dart';
part 'markdown_the_timer_store.g.dart';

class MarkdownTheTimerStore = _MarkdownTheTimerStoreBase
    with _$MarkdownTheTimerStore;

abstract class _MarkdownTheTimerStoreBase
    extends BaseMobxDBStore<NoParams, TimerMarkdownStatusEntity> with Store {
  @observable
  bool isMarkedDown = false;

  final MarkdownTheTimerGetterStore getterStore;
  _MarkdownTheTimerStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<TimerMarkdownStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.timerMarkdownStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.timerMarkdownStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (timerMarkdownStatusEntity) {
      isMarkedDown = timerMarkdownStatusEntity.isSent;
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
