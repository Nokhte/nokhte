// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/mobx.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'process_audio_store.g.dart';

class ProcessAudioStore = _ProcessAudioStoreBase with _$ProcessAudioStore;

abstract class _ProcessAudioStoreBase
    extends BaseMobxDBStore<ProcessAudioParams, AudioProcessingEntity>
    with Store {
  @observable
  String resultingWords = "";

  final ProcessAudioGetterStore getterStore;
  _ProcessAudioStoreBase({required this.getterStore});

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
    }, (audioProcessingEntity) {
      resultingWords = audioProcessingEntity.resultingWords;
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
