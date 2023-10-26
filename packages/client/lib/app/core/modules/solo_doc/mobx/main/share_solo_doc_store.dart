// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'share_solo_doc_store.g.dart';

class ShareSoloDocStore = _ShareSoloDocStoreBase with _$ShareSoloDocStore;

abstract class _ShareSoloDocStoreBase
    extends BaseMobxDBStore<NoParams, SoloDocSharingStatusEntity> with Store {
  final ShareSoloDocGetterStore getterStore;

  _ShareSoloDocStoreBase({required this.getterStore});

  @observable
  bool isShared = false;

  @observable
  BaseFutureStore<SoloDocSharingStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultSoloDocSharingStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultSoloDocSharingStatusEntity,
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
      isShared = soloDocCreationEntity.isSent;
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
}
