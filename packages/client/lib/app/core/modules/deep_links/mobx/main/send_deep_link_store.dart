// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
part 'send_deep_link_store.g.dart';

class SendDeepLinkStore = _SendDeepLinkStoreBase with _$SendDeepLinkStore;

abstract class _SendDeepLinkStoreBase extends BaseMobxDBStore<String, bool>
    with Store {
  final SendDeepLink logic;

  _SendDeepLinkStoreBase({
    required this.logic,
  });

  @observable
  bool isShared = false;

  @observable
  BaseFutureStore<bool> futureStore = BaseFutureStore(
      baseEntity: const Right(false),
      entityFutureParam: ObservableFuture(Future.value(
        const Right(false),
      )));

  @override
  void stateOrErrorUpdater(result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (invitationShareStatus) {
        isShared = invitationShareStatus;
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
