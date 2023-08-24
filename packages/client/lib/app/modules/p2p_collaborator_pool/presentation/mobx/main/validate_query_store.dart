// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/core/types/validation_enum.dart';
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
  ValidationStatus isProperLength = ValidationStatus.idle;

  @observable
  ValidationStatus isValidated = ValidationStatus.idle;

  _ValidateQueryStoreBase({
    required this.validateQueryGetterStore,
  });

  @action
  resetCheckerFields() {
    isProperLength = ValidationStatus.idle;
    isValidated = ValidationStatus.idle;
  }

  @action
  validateTheLength({required String inputString}) {
    // print('LENGTH CHECKER =========+> ${MiscAlgos.isTwoWords(inputString)}');
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
      // print(
      //     "${validationStatusEntity.isSent} THE STORE BOOL TRUE MEANS ITS VALID");
      if (validationStatusEntity.isSent) {
        isValidated = ValidationStatus.valid;
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
