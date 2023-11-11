// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
part 'create_solo_doc_store.g.dart';

class CreateSoloDocStore = _CreateSoloDocStoreBase with _$CreateSoloDocStore;

abstract class _CreateSoloDocStoreBase
    extends BaseMobxDBStore<CreateSoloDocParams, SoloDocCreationStatusEntity>
    with Store {
  final CreateSoloDocGetterStore getterStore;

  @observable
  bool isCreated = false;

  _CreateSoloDocStoreBase({
    required this.getterStore,
  });

  @observable
  BaseFutureStore<SoloDocCreationStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultSoloDocCreationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultSoloDocCreationStatusEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (soloDocCreationEntity) {
      isCreated = soloDocCreationEntity.isSent;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      getterStore(
        params,
      ),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
