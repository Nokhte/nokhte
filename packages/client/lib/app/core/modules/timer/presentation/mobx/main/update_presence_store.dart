// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/presentation/presentation.dart';
part 'update_presence_store.g.dart';

class UpdatePresenceStore = _UpdatePresenceStoreBase with _$UpdatePresenceStore;

abstract class _UpdatePresenceStoreBase
    extends BaseMobxDBStore<bool, PresenceUpdateStatusEntity> with Store {
  @observable
  bool isUpdated = false;

  final UpdatePresenceGetterStore getterStore;
  _UpdatePresenceStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<PresenceUpdateStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.presenceUpdateStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.presenceUpdateStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (presenceUpdateStatusEntity) {
      isUpdated = presenceUpdateStatusEntity.isSent;
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
