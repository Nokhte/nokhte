// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
part 'instantiate_agora_sdk_store.g.dart';

class InstantiateAgoraSdkStore = _InstantiateAgoraSdkStoreBase
    with _$InstantiateAgoraSdkStore;

abstract class _InstantiateAgoraSdkStoreBase
    extends BaseMobxDBStore<NoParams, AgoraSdkStatusEntity> with Store {
  final InstantiateAgoraSdk logic;

  @observable
  bool isInstantiated = false;

  _InstantiateAgoraSdkStoreBase({
    required this.logic,
  });

  @observable
  BaseFutureStore<AgoraSdkStatusEntity> futureStore = BaseFutureStore(
    baseEntity: Right(AgoraSdkStatusEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(AgoraSdkStatusEntity.initial())),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (agoraSdkStatusEntity) {
      isInstantiated = agoraSdkStatusEntity.isSent;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(logic(NoParams()));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
