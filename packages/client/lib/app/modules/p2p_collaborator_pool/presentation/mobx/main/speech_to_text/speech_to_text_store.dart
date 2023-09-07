// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
// * Equatable Import
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'speech_to_text_store.g.dart';

class SpeechToTextStore = _SpeechToTextStoreBase with _$SpeechToTextStore;

abstract class _SpeechToTextStoreBase extends BaseMobxDBStore with Store {
  final InitiateSpeechToTextGetterStore initSpeechToTextGetterStore;
  final StartListeningGetterStore startListeningGetterStore;
  final StopListeningGetterStore stopListeningGetterStore;

  @observable
  bool isListening = false;

  @observable
  bool isAllowed = false;

  @observable
  BaseFutureStore<ListeningStatusEntity> stopListeningFutureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.listeningStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.listeningStatusEntity),
    ),
  );

  @observable
  BaseFutureStore<ListeningStatusEntity> startListeningFutureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.listeningStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.listeningStatusEntity),
    ),
  );

  @observable
  BaseFutureStore<SpeechToTextInitializerStatusEntity>
      speechToTextInitFutureStore = BaseFutureStore(
    baseEntity: DefaultEntities.speechToTextInitializerStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.speechToTextInitializerStatusEntity),
    ),
  );

  _SpeechToTextStoreBase({
    required this.initSpeechToTextGetterStore,
    required this.startListeningGetterStore,
    required this.stopListeningGetterStore,
  });

  initSpeechStateOrErrorUpdater(
    Either<Failure, SpeechToTextInitializerStatusEntity> result,
  ) {
    return result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (speechToTextEntity) {
      isAllowed = speechToTextEntity.isSent;
    });
  }

  listeningStateOrErrorUpdater(
    Either<Failure, ListeningStatusEntity> result,
  ) {
    return result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (listeningStatusEntity) {
      isListening = listeningStatusEntity.isSent;
    });
  }

  @action
  Future<void> initSpeech() async {
    state = StoreState.loading;
    speechToTextInitFutureStore.entityOrFailureFuture = ObservableFuture(
      initSpeechToTextGetterStore(),
    );
    speechToTextInitFutureStore.unwrappedEntityOrFailure =
        await speechToTextInitFutureStore.entityOrFailureFuture;
    initSpeechStateOrErrorUpdater(
      speechToTextInitFutureStore.unwrappedEntityOrFailure,
    );
    state = StoreState.loaded;
  }

  @action
  Future<void> startListening() async {
    state = StoreState.loading;
    startListeningFutureStore.entityOrFailureFuture = ObservableFuture(
      startListeningGetterStore(),
    );
    startListeningFutureStore.unwrappedEntityOrFailure =
        await startListeningFutureStore.entityOrFailureFuture;
    listeningStateOrErrorUpdater(
      startListeningFutureStore.unwrappedEntityOrFailure,
    );
    state = StoreState.loaded;
  }

  @action
  Future<void> stopListening() async {
    state = StoreState.loading;
    stopListeningFutureStore.entityOrFailureFuture = ObservableFuture(
      stopListeningGetterStore(),
    );
    stopListeningFutureStore.unwrappedEntityOrFailure =
        await stopListeningFutureStore.entityOrFailureFuture;
    listeningStateOrErrorUpdater(
      stopListeningFutureStore.unwrappedEntityOrFailure,
    );
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [
// some items
      ];
}
