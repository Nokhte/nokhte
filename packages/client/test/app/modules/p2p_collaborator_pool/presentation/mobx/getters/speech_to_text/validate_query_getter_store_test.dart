// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/getters/getters.dart';
import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMValidateQuery mockLogic;
  late ValidateQueryGetterStore getterStore;
  late Either<Failure, CollaboratorPhraseValidationEntity>
      tEitherStatusOrFailure;
  const params = ValidateQueryParams(query: "some phrase");

  setUp(() {
    mockLogic = MockMValidateQuery();
    getterStore = ValidateQueryGetterStore(validateQueryLogic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure =
          ConstantCollaboratorPhraseValidationEntity.wrappedSuccessCase;
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(params))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore(params);
      expect(res, tEitherStatusOrFailure);
    });
  });

  group("❌ Failure Cases", () {
    setUp(() {
      tEitherStatusOrFailure = Left(FailureConstants.dbFailure);
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(params))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore(params);
      expect(res, tEitherStatusOrFailure);
    });
  });
}
