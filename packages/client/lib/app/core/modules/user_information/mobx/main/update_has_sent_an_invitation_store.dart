// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
part 'update_has_sent_an_invitation_store.g.dart';

class UpdateHasSentAnInvitationStore = _UpdateHasSentAnInvitationStoreBase
    with _$UpdateHasSentAnInvitationStore;

abstract class _UpdateHasSentAnInvitationStoreBase
    extends BaseMobxDBStore<bool, HasSentAnInvitationUpdateStatusEntity>
    with Store {
  @observable
  bool isUpdated = false;

  final UpdateHasSentAnInvitation logic;
  _UpdateHasSentAnInvitationStoreBase({required this.logic});

  @observable
  BaseFutureStore<HasSentAnInvitationUpdateStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: Right(HasSentAnInvitationUpdateStatusEntity.initial),
    entityFutureParam: ObservableFuture(
      Future.value(Right(HasSentAnInvitationUpdateStatusEntity.initial)),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (updateStatusEntity) {
      isUpdated = updateStatusEntity.isTrue;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
