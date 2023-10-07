// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/mobx.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';
import 'package:primala/app/core/modules/scheduling/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'create_scheduling_session_store.g.dart';

class CreateSchedulingSessionStore = _CreateSchedulingSessionStoreBase
    with _$CreateSchedulingSessionStore;

abstract class _CreateSchedulingSessionStoreBase
    extends BaseMobxDBStore<NoParams, SchedulingSessionCreationStatusEntity>
    with Store {
  @observable
  bool isCreated = false;

  final CreateSchedulingSessionGetterStore getterStore;
  _CreateSchedulingSessionStoreBase({required this.getterStore});

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
    futureStore.entityOrFailureFuture = ObservableFuture(getterStore(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
