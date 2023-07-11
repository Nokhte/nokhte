// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
// import 'package:equatable/equatable.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/p2p_scheduling_response_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/respond_to_scheduling_request_param_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/presentation/mobx/getters/respond_to_scheduling_request_getter_store.dart';
// * Mobx Codegen Inclusion
part 'respond_to_scheduling_request_store.g.dart';

class RespondToSchedulingRequestStore = _RespondToSchedulingRequestStoreBase
    with _$RespondToSchedulingRequestStore;

abstract class _RespondToSchedulingRequestStoreBase extends BaseMobxDBStore<
    RespondToSchedulingRequestParamEntity,
    P2PSchedulingResponseStatusEntity> with Store {
  final RespondToSchedulingRequestGetterStore respondToARequestGetterStore;

  @observable
  BaseFutureStore<P2PSchedulingResponseStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.p2pSchedulingResponseStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.p2pSchedulingResponseStatusEntity,
      ),
    ),
  );

  _RespondToSchedulingRequestStoreBase({
    required this.respondToARequestGetterStore,
  });

  @observable
  bool isSent = false;

  @override
  // @action
  void stateOrErrorUpdater(result) {
    return result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (p2pSchedulingResponseStatusEntity) {
      if (p2pSchedulingResponseStatusEntity.isSent) isSent = true;
    });
  }

  @override
  @action
  Future<void> call(RespondToSchedulingRequestParamEntity params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      respondToARequestGetterStore(params),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    state = StoreState.loaded;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
  }

  @override
  List<Object> get props => [isSent];
}
