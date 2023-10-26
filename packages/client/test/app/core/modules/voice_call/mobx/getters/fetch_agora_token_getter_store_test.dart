// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockMFetchAgoraToken mockLogic;
  late FetchAgoraTokenGetterStore getterStore;
  late Either<Failure, AgoraCallTokenEntity> tEitherStatusOrFailure;
  const FetchAgoraTokenParams tParams =
      FetchAgoraTokenParams(channelName: 'hi');

  setUp(() {
    mockLogic = MockMFetchAgoraToken();
    getterStore = FetchAgoraTokenGetterStore(logic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure = ConstantAgoraCallTokenEntity.wrappedSuccessCase;
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
