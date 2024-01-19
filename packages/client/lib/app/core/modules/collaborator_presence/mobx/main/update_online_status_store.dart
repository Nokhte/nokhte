// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
part 'update_online_status_store.g.dart';

class UpdateOnlineStatusStore = _UpdateOnlineStatusStoreBase
    with _$UpdateOnlineStatusStore;

abstract class _UpdateOnlineStatusStoreBase extends BaseMobxDBStore<
    UpdatePresencePropertyParams, OnlineUpdateStatusEntity> with Store {
  @observable
  bool isUpdated = false;

  final UpdateOnlineStatus logic;
  _UpdateOnlineStatusStoreBase({required this.logic});

  @observable
  BaseFutureStore<OnlineUpdateStatusEntity> futureStore = BaseFutureStore(
    baseEntity: Right(OnlineUpdateStatusEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(OnlineUpdateStatusEntity.initial())),
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
