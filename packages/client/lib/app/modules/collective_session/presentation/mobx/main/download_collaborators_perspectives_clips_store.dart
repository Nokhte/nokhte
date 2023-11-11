// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
part 'download_collaborators_perspectives_clips_store.g.dart';

class DownloadCollaboratorsPerspectivesClipsStore = _DownloadCollaboratorsPerspectivesClipsStoreBase
    with _$DownloadCollaboratorsPerspectivesClipsStore;

abstract class _DownloadCollaboratorsPerspectivesClipsStoreBase
    extends BaseMobxDBStore<CollectiveSessionAudioExtrapolationInfo,
        CollaboratorsAudioClipsPathsAndFilesEntity> with Store {
  @observable
  CollaboratorsAudioClipsPathsAndFilesEntity filesAndPaths =
      DefaultEntities.unwrappedCollaboratorsAudioCLipsAndFilesEntity;

  final DownloadCollaboratorsPerspectivesClipsGetterStore getterStore;
  _DownloadCollaboratorsPerspectivesClipsStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<CollaboratorsAudioClipsPathsAndFilesEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.collaboratorsAudioCLipsAndFilesEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.collaboratorsAudioCLipsAndFilesEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (downloadsEntity) {
      filesAndPaths = downloadsEntity;
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
