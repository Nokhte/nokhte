// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';
part 'consecrate_the_collaboration_store.g.dart';

class ConsecrateTheCollaborationStore = _ConsecrateTheCollaborationStoreBase
    with _$ConsecrateTheCollaborationStore;

abstract class _ConsecrateTheCollaborationStoreBase
    extends BaseMobxDBStore<NoParams, CollaborationConsecrationStatusEntity>
    with Store {
  @observable
  bool isConsecrated = false;

  final ConsecrateTheCollaboration logic;
  _ConsecrateTheCollaborationStoreBase({required this.logic});

  @observable
  BaseFutureStore<CollaborationConsecrationStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.collaborationConsecrationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.collaborationConsecrationStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (consecrationStatusEntity) {
      isConsecrated = consecrationStatusEntity.isSent;
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
