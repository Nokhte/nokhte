// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/mobx.dart';
import 'package:primala/app/core/modules/local_speech_to_text/constants/types/recording_status.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'stop_recording_store.g.dart';

class StopRecordingStore = _StopRecordingStoreBase with _$StopRecordingStore;

abstract class _StopRecordingStoreBase
    extends BaseMobxDBStore<NoParams, RecordingStatusEntity> with Store {
  @observable
  RecordingStatus recordingStatus = RecordingStatus.initial;

  final StopRecordingGetterStore getterStore;
  _StopRecordingStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<RecordingStatusEntity> futureStore = BaseFutureStore(
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
