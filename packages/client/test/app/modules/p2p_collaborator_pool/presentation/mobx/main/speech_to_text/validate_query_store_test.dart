// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import '../../../../constants/entities/entities.dart';
import '../../../../constants/responses/responses.dart';
import '../../../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMValidateQueryGetterStore mockGetterStore;
  late ValidateQueryStore validateQueryStore;
  const tParams = ValidateQueryParams(query: 'big cake');

  setUp(() {
    mockGetterStore = MockMValidateQueryGetterStore();
    validateQueryStore = ValidateQueryStore(
      validateQueryGetterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      validateQueryStore.stateOrErrorUpdater(
        ConstantCollaboratorPhraseValidationEntity.wrappedSuccessCase,
      );
      expect(
        validateQueryStore.isValidated,
        ValidationStatus.valid,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      validateQueryStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(validateQueryStore.isValidated, ValidationStatus.idle);
      expect(
          validateQueryStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });

  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async =>
            ConstantCollaboratorPhraseValidationEntity.wrappedSuccessCase,
      );
      await validateQueryStore(tParams);
      expect(
        validateQueryStore.isValidated,
        ValidationStatus.valid,
      );
      expect(validateQueryStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await validateQueryStore(tParams);
      expect(validateQueryStore.isValidated, ValidationStatus.idle);
      expect(
          validateQueryStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });

  test("resetCheckerFields", () {
    validateQueryStore.isProperLength = ValidationStatus.invalid;
    validateQueryStore.isValidated = ValidationStatus.invalid;
    validateQueryStore.phraseIDs = PhraseIDs.phraseID;
    validateQueryStore.resetCheckerFields();
    expect(validateQueryStore.isProperLength, ValidationStatus.idle);
    expect(validateQueryStore.isValidated, ValidationStatus.idle);
    expect(validateQueryStore.phraseIDs,
        DefaultEntities.defaultCollaboratorPhraseIDs);
  });
  test("validateTheLength", () {
    validateQueryStore.validateTheLength(inputString: "hi hi hi");
    expect(validateQueryStore.isProperLength, ValidationStatus.invalid);
    validateQueryStore.validateTheLength(inputString: "hi hi");
    expect(validateQueryStore.isProperLength, ValidationStatus.valid);
  });
}
