// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'stop_recording_store.g.dart';

class StopRecordingStore = _StopRecordingStoreBase with _$StopRecordingStore;

abstract class _StopRecordingStoreBase
    extends BaseMobxDBStore<NoParams, AudioProcessingEntity> with Store {
  @observable
  String resultingWords = "";

  final StopRecordingGetterStore getterStore;
  _StopRecordingStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<AudioProcessingEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultAudioProcessingEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.defaultAudioProcessingEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (recordingStatusEntity) {
      resultingWords = recordingStatusEntity.resultingWords;
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
