// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/send_scheduling_request_param_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/presentation/mobx/getters/send_scheduling_request_getter_store.dart';
// * Mobx Codegen Inclusion
part 'send_scheduling_request_store.g.dart';

class SendSchedulingRequestStore = _SendSchedulingRequestStoreBase
    with _$SendSchedulingRequestStore;

abstract class _SendSchedulingRequestStoreBase extends BaseMobxDBStore<
    SendSchedulingRequestParamEntity,
    P2PSchedulingRequestStatusEntity> with Store {
  final SendSchedulingRequestGetterStore sendSchedulingRequestGetterStore;

  @observable
  BaseFutureStore<P2PSchedulingRequestStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.p2pSchedulingSenderReqStatEnt,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.p2pSchedulingSenderReqStatEnt,
      ),
    ),
  );

  _SendSchedulingRequestStoreBase(
      {required this.sendSchedulingRequestGetterStore});

  @observable
  bool isSent = false;

  @override
  // @action
  void stateOrErrorUpdater(result) {
    return result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (p2pSchedulingStatusEntity) {
      if (p2pSchedulingStatusEntity.isSent) isSent = true;
    });
  }

  @override
  @action
  Future<void> call(SendSchedulingRequestParamEntity params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      sendSchedulingRequestGetterStore(params),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    state = StoreState.loaded;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
  }
}
