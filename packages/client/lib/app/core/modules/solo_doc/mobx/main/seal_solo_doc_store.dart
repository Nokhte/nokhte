// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
// * Equatable Import
// * Mobx Codegen Inclusion
part 'seal_solo_doc_store.g.dart';

class SealSoloDocStore = _SealSoloDocStoreBase with _$SealSoloDocStore;

abstract class _SealSoloDocStoreBase
    extends BaseMobxDBStore<NoParams, SoloDocSealingStatusEntity> with Store {
  final SealSoloDocGetterStore getterStore;

  _SealSoloDocStoreBase({
    required this.getterStore,
  });

  @observable
  bool isSealed = false;

  @observable
  BaseFutureStore<SoloDocSealingStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultSoloDocSealingStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultSoloDocSealingStatusEntity,
      ),
    ),
  );

  //
  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      //
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (soloDocCreationEntity) {
      isSealed = soloDocCreationEntity.isSent;
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
