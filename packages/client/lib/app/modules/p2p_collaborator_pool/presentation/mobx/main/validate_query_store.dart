// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:primala/app/core/utilities/utilities.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'validate_query_store.g.dart';

class ValidateQueryStore = _ValidateQueryStoreBase with _$ValidateQueryStore;

abstract class _ValidateQueryStoreBase extends BaseMobxDBStore<
    ValidateQueryParams, CollaboratorPhraseValidationEntity> with Store {
  final ValidateQueryGetterStore validateQueryGetterStore;

  @observable
  bool isNotProperLength = false;

  _ValidateQueryStoreBase({
    required this.validateQueryGetterStore,
  });

  @action
  validateTheLength({required String inputString}) {
    MiscAlgos.validateCollaboratorPhraseLength(inputString)
        ? isNotProperLength = true
        : isNotProperLength = false;
  }

  @observable
  bool isValidated = false;

  @observable
  BaseFutureStore<CollaboratorPhraseValidationEntity> futureStore =
      BaseFutureStore(
    baseEntity: DefaultEntities.collaboratorPhraseValidationEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.collaboratorPhraseValidationEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (validationStatusEntity) {
      isValidated = validationStatusEntity.isSent;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      validateQueryGetterStore(params),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
