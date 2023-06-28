// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_response_status_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/logic/respond_to_a_request.dart';
import 'package:primala/app/modules/p2p_request_recipient/presentation/mobx/getters/respond_to_a_request_getter_store.dart';
// * Mobx Codegen Inclusion
part 'respond_to_a_request_store.g.dart';

class RespondToARequestStore = _RespondToARequestStoreBase
    with _$RespondToARequestStore;

abstract class _RespondToARequestStoreBase extends BaseMobxDBStore<
    P2PRespondToReqParams, P2PRequestRecipientResponseStatusEntity> with Store {
  final RespondToARequestGetterStore respondToRequestGetterStore;

  _RespondToARequestStoreBase({
    required this.respondToRequestGetterStore,
  });

  @observable
  bool isSent = false;

  @observable
  BaseFutureStore<P2PRequestRecipientResponseStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.p2pRequestRecipResEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.p2pRequestRecipResEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (responseStatusEntity) {
        if (responseStatusEntity.isSent) {
          isSent = true;
        }
      },
    );
  }

  @override
  @action
  Future<void> call(P2PRespondToReqParams param) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      respondToRequestGetterStore(
        param.senderUsername,
      ),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    state = StoreState.loaded;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
  }

  @override
  List<Object> get props => [];
}
