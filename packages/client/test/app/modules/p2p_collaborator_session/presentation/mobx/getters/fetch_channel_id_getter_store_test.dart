// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/presentation.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMFetchChannelId mockLogic;
  late FetchChannelIdGetterStore getterStore;
  late Either<Failure, ChannelIdEntity> tEitherStatusOrFailure;

  setUp(() {
    mockLogic = MockMFetchChannelId();
    getterStore = FetchChannelIdGetterStore(logic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure = ConstantChannelIdEntity.wrappedSuccessCase;
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(NoParams()))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore();
      expect(res, tEitherStatusOrFailure);
    });
  });

  group("❌ Failure Cases", () {
    setUp(() {
      tEitherStatusOrFailure = Left(FailureConstants.dbFailure);
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(NoParams()))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore();
      expect(res, tEitherStatusOrFailure);
    });
  });
}
