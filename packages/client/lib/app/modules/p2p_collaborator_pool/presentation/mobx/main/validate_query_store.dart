// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:nokhte/app/core/utilities/utilities.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import 'package:nokhte_backend/tables/phrase_components.dart';
part 'validate_query_store.g.dart';

class ValidateQueryStore = _ValidateQueryStoreBase with _$ValidateQueryStore;

abstract class _ValidateQueryStoreBase extends BaseMobxDBStore<
    ValidateQueryParams, CollaboratorPhraseValidationEntity> with Store {
  final ValidateQueryGetterStore validateQueryGetterStore;

  @observable
  ValidationStatus isProperLength = ValidationStatus.idle;

  @observable
  ValidationStatus isValidated = ValidationStatus.idle;

  CollaboratorPhraseIDs phraseIDs =
      const CollaboratorPhraseIDs(adjectiveID: -1, nounID: -1);

  _ValidateQueryStoreBase({
    required this.validateQueryGetterStore,
  });

  @action
  resetCheckerFields() {
    isProperLength = ValidationStatus.idle;
    isValidated = ValidationStatus.idle;
    phraseIDs = DefaultEntities.defaultCollaboratorPhraseIDs;
  }

  @action
  validateTheLength({required String inputString}) {
    MiscAlgos.isTwoWords(inputString)
        ? isProperLength = ValidationStatus.valid
        : isProperLength = ValidationStatus.invalid;
  }

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
      if (validationStatusEntity.isSent) {
        isValidated = ValidationStatus.valid;
        phraseIDs = validationStatusEntity.phraseIDs;
      } else {
        isValidated = ValidationStatus.invalid;
      }
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
