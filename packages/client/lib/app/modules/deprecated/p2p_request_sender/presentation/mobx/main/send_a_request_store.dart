// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/deprecated/p2p_request_sender/domain/entities/p2p_request_sender_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_request_sender/domain/logic/send_a_request.dart';
import 'package:primala/app/modules/deprecated/p2p_request_sender/presentation/mobx/getters/send_a_request_getter_store.dart';
// * Mobx Codegen Inclusion
part 'send_a_request_store.g.dart';

class SendARequestStore = _SendARequestStore with _$SendARequestStore;

abstract class _SendARequestStore
    extends BaseMobxDBStore<P2PSendReqParams, P2PRequestSenderStatusEntity>
    with Store {
  final SendARequestGetterStore sendARequestGetterStore;

  @observable
  BaseFutureStore<P2PRequestSenderStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.p2pSenderStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.p2pSenderStatusEntity,
      ),
    ),
  );

  _SendARequestStore({required this.sendARequestGetterStore});

  @observable
  bool isSent = false;

  @override
  @action
  void stateOrErrorUpdater(result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (p2pReqStatusEntity) {
        if (p2pReqStatusEntity.isSent) {
          isSent = true;
        }
      },
    );
  }

  @override
  @action
  Future<void> call(P2PSendReqParams param) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      sendARequestGetterStore(param.username),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    state = StoreState.loaded;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
  }
}
