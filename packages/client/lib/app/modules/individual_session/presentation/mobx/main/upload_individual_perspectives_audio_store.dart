// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/domain/logic/upload_individual_perspectives_audio.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'upload_individual_perspectives_audio_store.g.dart';

class UploadIndividualPerspectivesAudioStore = _UploadIndividualPerspectivesAudioStoreBase
    with _$UploadIndividualPerspectivesAudioStore;

abstract class _UploadIndividualPerspectivesAudioStoreBase
    extends BaseMobxDBStore<UploadIndividualPerspectivesAudioParams,
        IndividualPerspectivesAudioUploadStatusEntity> with Store {
  @observable
  bool isUploaded = false;

  final UploadIndividualPerspectivesAudioGetterStore getterStore;
  _UploadIndividualPerspectivesAudioStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<IndividualPerspectivesAudioUploadStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.individualPerspectivesAudioUploadStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
          DefaultEntities.individualPerspectivesAudioUploadStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (uploadStatusEntity) {
      isUploaded = uploadStatusEntity.isSent;
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
