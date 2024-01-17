// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
part 'update_meeting_id_and_token_store.g.dart';

class UpdateMeetingIdAndTokenStore = _UpdateMeetingIdAndTokenStoreBase
    with _$UpdateMeetingIdAndTokenStore;

abstract class _UpdateMeetingIdAndTokenStoreBase extends BaseMobxDBStore<
    UpdateMeetingIdAndTokenParams,
    MeetingIdAndTokenUpdateStatusEntity> with Store {
  @observable
  bool isUpdated = false;

  final UpdateMeetingIdAndToken logic;

  _UpdateMeetingIdAndTokenStoreBase({
    required this.logic,
  });

  @observable
  BaseFutureStore<MeetingIdAndTokenUpdateStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: Right(MeetingIdAndTokenUpdateStatusEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(MeetingIdAndTokenUpdateStatusEntity.initial())),
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
