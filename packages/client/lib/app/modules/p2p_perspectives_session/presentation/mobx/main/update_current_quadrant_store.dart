// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'update_current_quadrant_store.g.dart';

class UpdateCurrentQuadrantStore = _UpdateCurrentQuadrantStoreBase
    with _$UpdateCurrentQuadrantStore;

abstract class _UpdateCurrentQuadrantStoreBase
    extends BaseMobxDBStore<int, CurrentQuadrantUpdatingStatusEntity>
    with Store {
  @observable
  bool isUpdated = false;

  final UpdateCurrentQuadrantGetterStore getterStore;
  _UpdateCurrentQuadrantStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<CurrentQuadrantUpdatingStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.currentQuadrantUpdatingStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.currentQuadrantUpdatingStatusEntity),
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
