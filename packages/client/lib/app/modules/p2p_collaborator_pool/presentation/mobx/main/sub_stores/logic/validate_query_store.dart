// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:primala/app/core/utilities/utilities.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import 'package:primala_backend/phrase_components.dart';
// * Mobx Codegen Inclusion
part 'validate_query_store.g.dart';

/// TODO test this one this is high priority
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

  /// these will need to be passed with the validation entity
  /// so add that in the entity & the model infra

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
