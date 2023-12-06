// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'update_collaboration_activation_status_store.g.dart';

class UpdateCollaborationActivationStatusStore = _UpdateCollaborationActivationStatusStoreBase
    with _$UpdateCollaborationActivationStatusStore;

abstract class _UpdateCollaborationActivationStatusStoreBase
    extends BaseMobxDBStore<bool, CollaborationActivationStatusEntity>
    with Store {
  @observable
  bool isActivated = false;

  final UpdateCollaborationActivationStatus logic;
  _UpdateCollaborationActivationStatusStoreBase({required this.logic});

  @observable
  BaseFutureStore<CollaborationActivationStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.collaborationActivationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.collaborationActivationStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (activationStatusEntity) {
      isActivated = activationStatusEntity.isSent;
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
