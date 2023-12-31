// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
part 'init_leopard_store.g.dart';

class InitLeopardStore = _InitLeopardStoreBase with _$InitLeopardStore;

abstract class _InitLeopardStoreBase
    extends BaseMobxDBStore<NoParams, InitLeopardStatusEntity> with Store {
  @observable
  bool isInitialized = false;

  final InitLeopard logic;
  _InitLeopardStoreBase({required this.logic});

  @observable
  BaseFutureStore<InitLeopardStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultInitLeopardStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.defaultInitLeopardStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (leopardInitializationStatusEntity) {
      isInitialized = leopardInitializationStatusEntity.isSent;
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
