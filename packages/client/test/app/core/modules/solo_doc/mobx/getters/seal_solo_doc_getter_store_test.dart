// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/solo_doc_mock_gen.mocks.dart';

void main() {
  late MockMSealSoloDoc mockLogic;
  late SealSoloDocGetterStore getterStore;
  late Either<Failure, SoloDocSealingStatusEntity> tEitherStatusOrFailure;
  final tParams = NoParams();

  setUp(() {
    mockLogic = MockMSealSoloDoc();
    getterStore = SealSoloDocGetterStore(logic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure =
          ConstantSoloDocSealingStatusEntity.wrappedSuccessCase;
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
