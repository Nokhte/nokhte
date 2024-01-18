// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
part 'check_for_unconsecrated_collaboration_store.g.dart';

class CheckForUnconsecratedCollaborationStore = _CheckForUnconsecratedCollaborationStoreBase
    with _$CheckForUnconsecratedCollaborationStore;

abstract class _CheckForUnconsecratedCollaborationStoreBase
    extends BaseMobxDBStore<NoParams, UnconsecratedCollaborationCheckerEntity>
    with Store {
  @observable
  bool hasAnUnconsecratedCollaboration = false;

  final CheckForUnconsecratedCollaboration logic;
  _CheckForUnconsecratedCollaborationStoreBase({required this.logic});

  @observable
  BaseFutureStore<UnconsecratedCollaborationCheckerEntity> futureStore =
      BaseFutureStore(
    baseEntity: Right(UnconsecratedCollaborationCheckerEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(UnconsecratedCollaborationCheckerEntity.initial())),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (updateStatusEntity) {
      hasAnUnconsecratedCollaboration = updateStatusEntity.isTrue;
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
