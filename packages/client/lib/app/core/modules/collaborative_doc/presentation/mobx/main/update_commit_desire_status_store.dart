// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/mobx.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/logic/update_commit_desire_status.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'update_commit_desire_status_store.g.dart';

class UpdateCommitDesireStatusStore = _UpdateCommitDesireStatusStoreBase
    with _$UpdateCommitDesireStatusStore;

abstract class _UpdateCommitDesireStatusStoreBase extends BaseMobxDBStore<
    UpdateCommitDesireStatusParams,
    CollaborativeDocUpdateCommitDesireStatusEntity> with Store {
  @observable
  bool isUpdated = false;

  final UpdateCommitDesireStatusGetterStore getterStore;
  _UpdateCommitDesireStatusStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<CollaborativeDocUpdateCommitDesireStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.collaborativeDocUpdateCommitDesireEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.collaborativeDocUpdateCommitDesireEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (updateStatusEntity) {
      isUpdated = updateStatusEntity.isSent;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(getterStore(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
