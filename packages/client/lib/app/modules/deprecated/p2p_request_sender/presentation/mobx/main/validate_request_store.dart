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
import 'package:primala/app/modules/deprecated/p2p_request_sender/domain/entities/p2p_request_recipient_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_request_sender/domain/logic/validate_request.dart';
import 'package:primala/app/modules/deprecated/p2p_request_sender/presentation/mobx/getters/validate_request_getter_store.dart';
// * Mobx Codegen Inclusion
part 'validate_request_store.g.dart';

class ValidateRequestStore = _ValidateRequestStoreBase
    with _$ValidateRequestStore;

abstract class _ValidateRequestStoreBase
    extends BaseMobxDBStore<P2PReqRecipientParams, P2PRequestRecipientEntity>
    with Store {
  final ValidateRequestGetterStore validateRequestGetterStore;

  @observable
  BaseFutureStore<P2PRequestRecipientEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.p2pRequestRecipientEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.p2pRequestRecipientEntity,
      ),
    ),
  );

  _ValidateRequestStoreBase({required this.validateRequestGetterStore});

  @observable
  bool recipientExists = false;

  @observable
  bool duplicateSender = false;

  @observable
  bool duplicateRecipient = false;

  @override
  @action
  void stateOrErrorUpdater(result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (p2pReqRecipEntity) {
        recipientExists = p2pReqRecipEntity.exists;
        duplicateRecipient = p2pReqRecipEntity.duplicateRecipient;
        duplicateSender = p2pReqRecipEntity.duplicateSender;
      },
    );
  }

  @action
  void resetStore() {
    if (state == StoreState.loaded) {
      state = StoreState.initial;
      recipientExists = false;
      duplicateSender = false;
      duplicateRecipient = false;
      futureStore = BaseFutureStore(
        baseEntity: DefaultEntities.p2pRequestRecipientEntity,
        entityFutureParam: ObservableFuture(
          Future.value(
            DefaultEntities.p2pRequestRecipientEntity,
          ),
        ),
      );
    }
  }

  @override
  @action
  Future<void> call(P2PReqRecipientParams param) async {
    resetStore();
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      validateRequestGetterStore(param.username),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    state = StoreState.loaded;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
  }
}
