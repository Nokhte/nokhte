// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
part 'create_scheduling_session_store.g.dart';

class CreateSchedulingSessionStore = _CreateSchedulingSessionStoreBase
    with _$CreateSchedulingSessionStore;

abstract class _CreateSchedulingSessionStoreBase
    extends BaseMobxDBStore<NoParams, SchedulingSessionCreationStatusEntity>
    with Store {
  @observable
  bool isCreated = false;

  final CreateSchedulingSession logic;
  _CreateSchedulingSessionStoreBase({required this.logic});

  @observable
  BaseFutureStore<SchedulingSessionCreationStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.schedulingSessionCreationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.schedulingSessionCreationStatusEntity),
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
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
