import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMCreateCollaborativeDoc mockLogic;
  late CreateCollaborativeDocGetterStore getterStore;
  late Either<Failure, CollaborativeDocCreationStatusEntity>
      tEitherStatusOrFailure;
  const tParams = CreateCollaborativeDocParams(docType: 'purpose');

  setUp(() {
    mockLogic = MockMCreateCollaborativeDoc();
    getterStore = CreateCollaborativeDocGetterStore(logic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure =
          ConstantCollaborativeDocCreationStatusEntity.wrappedSuccessCase;
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(tParams))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore(tParams);
      expect(res, tEitherStatusOrFailure);
    });
  });

  group("❌ Failure Cases", () {
    setUp(() {
      tEitherStatusOrFailure = Left(FailureConstants.dbFailure);
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(tParams))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore(tParams);
      expect(res, tEitherStatusOrFailure);
    });
  });
}
