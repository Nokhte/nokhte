// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'submit_solo_doc_store.g.dart';

class SubmitSoloDocStore = _SubmitSoloDocStoreBase with _$SubmitSoloDocStore;

abstract class _SubmitSoloDocStoreBase
    extends BaseMobxDBStore<SubmitSoloDocParams, SoloDocSubmissionStatusEntity>
    with Store {
  final SubmitSoloDocGetterStore getterStore;

  _SubmitSoloDocStoreBase({required this.getterStore});

  @observable
  bool isSubmitted = false;

  @observable
  BaseFutureStore<SoloDocSubmissionStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultSoloDocSubmissionStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultSoloDocSubmissionStatusEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      //
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (soloDocCreationEntity) {
      isSubmitted = soloDocCreationEntity.isSent;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      getterStore(params),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [
// some items
      ];
}
