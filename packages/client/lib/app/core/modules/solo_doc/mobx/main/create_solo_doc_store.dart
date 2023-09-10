// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
// * Equatable Import
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';
import 'package:primala/app/core/modules/solo_doc/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'create_solo_doc_store.g.dart';

class CreateSoloDocStore = _CreateSoloDocStoreBase with _$CreateSoloDocStore;

abstract class _CreateSoloDocStoreBase
    extends BaseMobxDBStore<NoParams, SoloDocCreationStatusEntity> with Store {
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
      //
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
  List<Object> get props => [
// some items
      ];
}
