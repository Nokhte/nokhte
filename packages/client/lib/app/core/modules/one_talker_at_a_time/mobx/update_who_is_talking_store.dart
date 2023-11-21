// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'update_who_is_talking_store.g.dart';

class UpdateWhoIsTalkingStore = _UpdateWhoIsTalkingStoreBase
    with _$UpdateWhoIsTalkingStore;

abstract class _UpdateWhoIsTalkingStoreBase extends BaseMobxDBStore<
    UpdateWhoIsTalkingParams, WhoIsTalkingUpdateStatusEntity> with Store {
  @observable
  bool isUpdated = false;

  final UpdateWhoIsTalking logic;
  _UpdateWhoIsTalkingStoreBase({required this.logic});

  @observable
  BaseFutureStore<WhoIsTalkingUpdateStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.whoIsTalkingUpdateStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.whoIsTalkingUpdateStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (whoIsTalkingUpdateStatusEntity) {
      isUpdated = whoIsTalkingUpdateStatusEntity.isSent;
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
