// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
part 'enter_collaborator_pool_store.g.dart';

class EnterCollaboratorPoolStore = _EnterCollaboratorPoolStoreBase
    with _$EnterCollaboratorPoolStore;

abstract class _EnterCollaboratorPoolStoreBase
    extends BaseMobxDBStore<String, CollaboratorPoolEntryStatusEntity>
    with Store {
  final EnterCollaboratorPool logic;

  @observable
  bool hasEntered = false;

  _EnterCollaboratorPoolStoreBase({
    required this.logic,
  });

  @observable
  BaseFutureStore<CollaboratorPoolEntryStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: Right(CollaboratorPoolEntryStatusEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(
        Right(CollaboratorPoolEntryStatusEntity.initial()),
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (entryStatusEntity) {
      hasEntered = entryStatusEntity.isSent;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(logic(
      params,
    ));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
