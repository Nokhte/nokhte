// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/entities/p2p_recipient_request_presentational_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/presentation/mobx/getters/load_the_requests_getter_store.dart';
// * Mobx Codegen Inclusion
part 'load_the_requests_store.g.dart';

class LoadTheRequestsStore = _LoadTheRequestsStoreBase
    with _$LoadTheRequestsStore;

abstract class _LoadTheRequestsStoreBase
    extends BaseMobxDBStore<NoParams, P2PRecipientRequestPresentationalEntity>
    with Store {
  final LoadTheRequestsGetterStore loadTheRequestsGetterStore;

  _LoadTheRequestsStoreBase({
    required this.loadTheRequestsGetterStore,
  });

  P2PRecipientRequestPresentationalEntity requests =
      const P2PRecipientRequestPresentationalEntity(requests: []);

  @observable
  BaseFutureStore<P2PRecipientRequestPresentationalEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.p2pPresentationalRecipReqEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.p2pPresentationalRecipReqEntity),
    ),
  );

  // so how
  @override
  void stateOrErrorUpdater(result) {
    return result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (requestsEntity) {
      requests = requestsEntity;
    });
  }

  @override
  @action
  Future<void> call(NoParams params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      loadTheRequestsGetterStore(),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
