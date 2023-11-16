// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';
part 'get_existing_collaborations_info_store.g.dart';

class GetExistingCollaborationsInfoStore = _GetExistingCollaborationsInfoStoreBase
    with _$GetExistingCollaborationsInfoStore;

abstract class _GetExistingCollaborationsInfoStoreBase
    extends BaseMobxDBStore<NoParams, ExistingCollaborationsInfoEntity>
    with Store {
  @observable
  bool hasACollaboration = false;

  @observable
  bool hasDonePerspectives = false;

  @observable
  bool hasCommittedAPurpose = false;

  final GetExistingCollaborationsInfoGetterStore getterStore;
  _GetExistingCollaborationsInfoStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<ExistingCollaborationsInfoEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.existingCollaborationsInfoEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.existingCollaborationsInfoEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (infoEntity) {
      hasACollaboration = infoEntity.hasACollaboration;
      hasDonePerspectives = infoEntity.hasDoneThePerspectivesSession;
      hasCommittedAPurpose = infoEntity.hasAPurpose;
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
