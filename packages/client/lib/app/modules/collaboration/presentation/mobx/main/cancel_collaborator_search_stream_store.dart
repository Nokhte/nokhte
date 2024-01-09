// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
part 'cancel_collaborator_stream_store.g.dart';

class CancelCollaboratorSearchStreamStore = _CancelCollaboratorSearchStreamStoreBase
    with _$CancelCollaboratorSearchStreamStore;

abstract class _CancelCollaboratorSearchStreamStoreBase extends BaseMobxDBStore<
    NoParams, CollaboratorStreamCancellationStatusEntity> with Store {
  final CancelCollaboratorSearchStream logic;

  _CancelCollaboratorSearchStreamStoreBase({
    required this.logic,
  });

  @observable
  bool isListening = false;

  @observable
  BaseFutureStore<CollaboratorStreamCancellationStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: Right(CollaboratorStreamCancellationStatusEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(CollaboratorStreamCancellationStatusEntity.initial())),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (entryStatusEntity) {
      isListening = entryStatusEntity.isSent;
    });
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

  @override
  List<Object> get props => [];
}
