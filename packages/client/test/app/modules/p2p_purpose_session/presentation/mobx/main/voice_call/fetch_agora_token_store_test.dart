// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMFetchAgoraTokenGetterStore mockGetterStore;
  late FetchAgoraTokenStore checkIfUserHasTheQuestionStore;
  const tParams = FetchAgoraTokenParams(channelName: 'hi');

  setUp(() {
    mockGetterStore = MockMFetchAgoraTokenGetterStore();
    checkIfUserHasTheQuestionStore = FetchAgoraTokenStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      checkIfUserHasTheQuestionStore.stateOrErrorUpdater(
        ConstantAgoraCallTokenEntity.wrappedSuccessCase,
      );
      expect(
        checkIfUserHasTheQuestionStore.token,
        'someReturnedToken',
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      checkIfUserHasTheQuestionStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(checkIfUserHasTheQuestionStore.token, "");
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => ConstantAgoraCallTokenEntity.wrappedNotSuccessCase,
      );
      await checkIfUserHasTheQuestionStore(tParams);
      expect(
        checkIfUserHasTheQuestionStore.token,
        "",
      );
      expect(checkIfUserHasTheQuestionStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await checkIfUserHasTheQuestionStore(tParams);
      expect(checkIfUserHasTheQuestionStore.token, "");
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
