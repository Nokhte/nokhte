// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
// * Equatable Import
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'cancel_collaborator_stream_store.g.dart';

class CancelCollaboratorStreamStore = _CancelCollaboratorStreamStoreBase
    with _$CancelCollaboratorStreamStore;

abstract class _CancelCollaboratorStreamStoreBase
    extends BaseMobxDBStore<NoParams, CollaboratorStreamStatusEntity>
    with Store {
  final CancelCollaboratorStreamGetterStore getterStore;

  _CancelCollaboratorStreamStoreBase({
    required this.getterStore,
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
      getterStore(),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
