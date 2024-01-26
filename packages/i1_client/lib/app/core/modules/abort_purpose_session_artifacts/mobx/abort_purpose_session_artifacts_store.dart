// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'abort_purpose_session_artifacts_store.g.dart';

class AbortPurposeSessionArtifactsStore = _AbortPurposeSessionArtifactsStoreBase
    with _$AbortPurposeSessionArtifactsStore;

abstract class _AbortPurposeSessionArtifactsStoreBase extends BaseMobxDBStore<
    AbortPurposeSessionArtifactsParams,
    PurposeSessionArtifactAbortionStatusEntity> with Store {
  @observable
  bool isAborted = false;

  final AbortPurposeSessionArtifacts logic;
  _AbortPurposeSessionArtifactsStoreBase({required this.logic});

  @observable
  BaseFutureStore<PurposeSessionArtifactAbortionStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.purposeSessionArtifactAbortionStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.purposeSessionArtifactAbortionStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (abortionStatusEntity) {
      isAborted = abortionStatusEntity.isSent;
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
