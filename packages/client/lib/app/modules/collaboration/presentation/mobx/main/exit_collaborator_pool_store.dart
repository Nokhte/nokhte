// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
part 'exit_collaborator_pool_store.g.dart';

class ExitCollaboratorPoolStore = _ExitCollaboratorPoolStoreBase
    with _$ExitCollaboratorPoolStore;

abstract class _ExitCollaboratorPoolStoreBase
    extends BaseMobxDBStore<NoParams, CollaboratorPoolExitStatusEntity>
    with Store {
  final ExitCollaboratorPool logic;

  _ExitCollaboratorPoolStoreBase({
    required this.logic,
  });

  @observable
  bool hasLeft = false;

  @observable
  BaseFutureStore<CollaboratorPoolExitStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: Right(CollaboratorPoolExitStatusEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(
        Right(CollaboratorPoolExitStatusEntity.initial()),
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (entryStatusEntity) {
      hasLeft = entryStatusEntity.isSent;
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

  @override
  List<Object> get props => [];
}
