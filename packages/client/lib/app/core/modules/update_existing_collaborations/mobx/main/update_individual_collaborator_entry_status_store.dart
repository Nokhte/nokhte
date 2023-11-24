// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'update_individual_collaborator_entry_status_store.g.dart';

class UpdateIndividualCollaboratorEntryStatusStore = _UpdateIndividualCollaboratorEntryStatusStoreBase
    with _$UpdateIndividualCollaboratorEntryStatusStore;

abstract class _UpdateIndividualCollaboratorEntryStatusStoreBase
    extends BaseMobxDBStore<bool, IndividualCollaboratorEntryStatusEntity>
    with Store {
  @observable
  bool hasEntered = false;

  final UpdateIndividualCollaboratorEntryStatus logic;
  _UpdateIndividualCollaboratorEntryStatusStoreBase({required this.logic});

  @observable
  BaseFutureStore<IndividualCollaboratorEntryStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.individualCollaboratorEntryStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.individualCollaboratorEntryStatusEntity),
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
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
