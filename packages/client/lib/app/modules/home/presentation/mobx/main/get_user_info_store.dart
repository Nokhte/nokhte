// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';
part 'get_user_info_store.g.dart';

class GetUserInfoStore = _GetUserInfoStoreBase with _$GetUserInfoStore;

abstract class _GetUserInfoStoreBase
    extends BaseMobxDBStore<NoParams, UserJourneyInfoEntity> with Store {
  @observable
  bool hasGoneThroughInvitationFlow = false;

  @observable
  bool hasSentAnInvitation = false;

  final GetUserInfo logic;
  _GetUserInfoStoreBase({required this.logic});

  @observable
  BaseFutureStore<UserJourneyInfoEntity> futureStore = BaseFutureStore(
    baseEntity: Right(UserJourneyInfoEntity.initial),
    entityFutureParam: ObservableFuture(
      Future.value(Right(UserJourneyInfoEntity.initial)),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (journeyInfoEntity) {
      hasGoneThroughInvitationFlow =
          journeyInfoEntity.hasGoneThroughInvitationFlow;
      hasSentAnInvitation = journeyInfoEntity.hasSentAnInvitation;
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
