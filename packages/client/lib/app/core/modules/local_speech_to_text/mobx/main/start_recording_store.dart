// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/constants/types/recording_status.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'start_recording_store.g.dart';

class StartRecordingStore = _StartRecordingStoreBase with _$StartRecordingStore;

abstract class _StartRecordingStoreBase
    extends BaseMobxDBStore<NoParams, SpeechToTextRecordingStatusEntity>
    with Store {
  @observable
  SpeechToTextRecordingStatus recordingStatus =
      SpeechToTextRecordingStatus.initial;

  final StartRecordingGetterStore getterStore;
  _StartRecordingStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<SpeechToTextRecordingStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.defaultRecordingStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.defaultRecordingStatusEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (recordingStatusEntity) {
      recordingStatus = recordingStatusEntity.recordingStatus;
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
