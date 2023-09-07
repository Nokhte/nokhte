// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/presentation.dart';
// * Equatable Import
// * Mobx Codegen Inclusion
part 'get_solo_doc_content_store.g.dart';

class GetSoloDocContentStore = _GetSoloDocContentStoreBase
    with _$GetSoloDocContentStore;

abstract class _GetSoloDocContentStoreBase
    extends BaseMobxDBStore<NoParams, SoloDocContentEntity> with Store {
  final GetSoloDocContentGetterStore getterStore;

  @observable
  String docContent = "";

  _GetSoloDocContentStoreBase({
    required this.getterStore,
  });

  @observable
  BaseFutureStore<SoloDocContentEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultSoloDocContentEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultSoloDocContentEntity,
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
    }, (soloDocContentEntity) {
      docContent = soloDocContentEntity.content;
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
