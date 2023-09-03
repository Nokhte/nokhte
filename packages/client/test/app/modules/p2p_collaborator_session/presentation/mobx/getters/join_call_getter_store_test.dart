// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/presentation.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMJoinCall mockLogic;
  late JoinCallGetterStore getterStore;
  late Either<Failure, CallStatusEntity> tEitherStatusOrFailure;
  const tParams = JoinCallParams(token: 'hi', channelId: 'hi');

  setUp(() {
    mockLogic = MockMJoinCall();
    getterStore = JoinCallGetterStore(logic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure = ConstantCallStatusEntity.wrappedSuccessCase;
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(tParams))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore(
        channelId: tParams.channelId,
        token: tParams.channelId,
      );
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
      final res = await getterStore(
        channelId: tParams.channelId,
        token: tParams.channelId,
      );
      expect(res, tEitherStatusOrFailure);
    });
  });
}
