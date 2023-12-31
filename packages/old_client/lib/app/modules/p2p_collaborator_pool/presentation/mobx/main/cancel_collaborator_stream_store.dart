// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
part 'cancel_collaborator_stream_store.g.dart';

class CancelCollaboratorStreamStore = _CancelCollaboratorStreamStoreBase
    with _$CancelCollaboratorStreamStore;

abstract class _CancelCollaboratorStreamStoreBase
    extends BaseMobxDBStore<NoParams, CollaboratorStreamStatusEntity>
    with Store {
  final CancelCollaboratorStream logic;

  _CancelCollaboratorStreamStoreBase({
    required this.logic,
  });

  @observable
  bool isListening = false;

  @observable
  BaseFutureStore<CollaboratorStreamStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.collaboratorStreamStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.collaboratorStreamStatusEntity),
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
