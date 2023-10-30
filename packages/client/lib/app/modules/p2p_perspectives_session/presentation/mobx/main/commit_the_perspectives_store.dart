// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'commit_the_perspectives_store.g.dart';

class CommitThePerspectivesStore = _CommitThePerspectivesStoreBase
    with _$CommitThePerspectivesStore;

abstract class _CommitThePerspectivesStoreBase
    extends BaseMobxDBStore<List<String>, PerspectivesCommitStatusEntity>
    with Store {
  @observable
  bool isCommitted = false;

  final CommitThePerspectivesGetterStore getterStore;
  _CommitThePerspectivesStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<PerspectivesCommitStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.perspectivesCommitStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.perspectivesCommitStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (perspectivesCommitStatusEntity) {
      isCommitted = perspectivesCommitStatusEntity.isSent;
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
