// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
part 'send_deep_link_store.g.dart';

class SendDeepLinkStore = _SendDeepLinkStoreBase with _$SendDeepLinkStore;

abstract class _SendDeepLinkStoreBase
    extends BaseMobxDBStore<String, DeepLinkSendStatusEntity> with Store {
  final SendDeepLink logic;

  _SendDeepLinkStoreBase({
    required this.logic,
  });

  @observable
  bool isShared = false;

  @observable
  BaseFutureStore<DeepLinkSendStatusEntity> futureStore = BaseFutureStore(
      baseEntity: DeepLinkSendStatusEntity.initial,
      entityFutureParam: ObservableFuture(Future.value(
        DeepLinkSendStatusEntity.initial,
      )));

  @override
  void stateOrErrorUpdater(Either<Failure, DeepLinkSendStatusEntity> result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (invitationStatusEntity) {
        isShared = invitationStatusEntity.isSent;
      },
    );
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      logic(params),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
