// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';
part 'get_invitation_url_store.g.dart';

class GetInvitationURLStore = _GetInvitationURLStoreBase
    with _$GetInvitationURLStore;

abstract class _GetInvitationURLStoreBase
    extends BaseMobxDBStore<NoParams, CollaborationInvitationDataEntity>
    with Store {
  @observable
  String link = '';

  final GetInvitationURL logic;
  _GetInvitationURLStoreBase({required this.logic});

  @observable
  BaseFutureStore<CollaborationInvitationDataEntity> futureStore =
      BaseFutureStore(
    baseEntity: Right(CollaborationInvitationDataEntity.initial),
    entityFutureParam: ObservableFuture(
      Future.value(Right(CollaborationInvitationDataEntity.initial)),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (dataEntity) {
      link = dataEntity.link;
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
