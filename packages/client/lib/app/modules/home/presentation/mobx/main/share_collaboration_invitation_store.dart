// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
part 'share_collaboration_invitation_store.g.dart';

class ShareCollaborationInvitationStore = _ShareCollaborationInvitationStoreBase
    with _$ShareCollaborationInvitationStore;

abstract class _ShareCollaborationInvitationStoreBase
    extends BaseMobxDBStore<NoParams, CollaborationInvitationSendStatusEntity>
    with Store {
  final ShareCollaborationInvitation logic;

  _ShareCollaborationInvitationStoreBase({
    required this.logic,
  });

  @observable
  bool isSent = false;

  @observable
  BaseFutureStore<CollaborationInvitationSendStatusEntity> futureStore =
      BaseFutureStore(
          baseEntity: CollaborationInvitationSendStatusEntity.initial,
          entityFutureParam: ObservableFuture(Future.value(
            CollaborationInvitationSendStatusEntity.initial,
          )));

  @override
  void stateOrErrorUpdater(
      Either<Failure, CollaborationInvitationSendStatusEntity> result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (invitationStatusEntity) {
        isSent = invitationStatusEntity.isSent;
      },
    );
  }

  @override
  @action
  Future<void> call(NoParams params) async {
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
