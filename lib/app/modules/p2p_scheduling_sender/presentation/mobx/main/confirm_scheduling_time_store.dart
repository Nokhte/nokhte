// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Primala Core
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
// * Primala Entity
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/confirm_p2p_scheduling_time_status_entity.dart';
// * Primala Logic
import 'package:primala/app/modules/p2p_scheduling_sender/domain/logic/confirm_scheduling_time.dart';
// * Primala Mobx Getter
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/getters/confirm_scheduling_time_getter_store.dart';
// * Mobx Codegen Inclusion
part 'confirm_scheduling_time_store.g.dart';

class ConfirmSchedulingTimeStore = _ConfirmSchedulingTimeStoreBase
    with _$ConfirmSchedulingTimeStore;

abstract class _ConfirmSchedulingTimeStoreBase extends BaseMobxDBStore<
    ConfirmSchedulingTimeParams,
    ConfirmP2PSchedulingTimeStatusEntity> with Store {
  ConfirmSchedulingTimeGetterStore confirmSchedulingTimeGetterStore;

  @observable
  BaseFutureStore<ConfirmP2PSchedulingTimeStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.p2pSchedulingConfirmTimeStatusEnt,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.p2pSchedulingConfirmTimeStatusEnt,
      ),
    ),
  );

  _ConfirmSchedulingTimeStoreBase({
    required this.confirmSchedulingTimeGetterStore,
  });

  @observable
  bool isSent = false;

  @override
  // @action
  void stateOrErrorUpdater(result) {
    return result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (p2pConfirmTimeStatusEntity) {
      if (p2pConfirmTimeStatusEntity.isSent) isSent = true;
    });
  }

  @override
  @action
  Future<void> call(ConfirmSchedulingTimeParams params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      confirmSchedulingTimeGetterStore(params),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    state = StoreState.loaded;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
  }

  @override
  List<Object> get props => [isSent];
}
