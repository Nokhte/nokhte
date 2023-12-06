// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
part 'update_the_staging_area_store.g.dart';

class UpdateTheStagingAreaStore = _UpdateTheStagingAreaStoreBase
    with _$UpdateTheStagingAreaStore;

abstract class _UpdateTheStagingAreaStoreBase
    extends BaseMobxDBStore<List<String>, StagingAreaUpdateStatusEntity>
    with Store {
  @observable
  bool isUpdated = false;

  final UpdateTheStagingAreaGetterStore getterStore;
  _UpdateTheStagingAreaStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<StagingAreaUpdateStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.stagingAreaUpdateStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.stagingAreaUpdateStatusEntity),
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
    futureStore.entityOrFailureFuture = ObservableFuture(getterStore(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
