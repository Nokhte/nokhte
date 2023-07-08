// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/logic/respond_to_a_request.dart';
import 'package:primala/app/modules/p2p_request_recipient/presentation/mobx/main/respond_to_a_request_store.dart';
import '../../../constants/entities.dart';
import '../../../fixtures/p2p_request_recipient_stack_mock_gen.mocks.dart';

void main() {
  late MockMRespondToARequestGetterStore mockGetterStore;
  late RespondToARequestStore respondToARequestStore;
  const tParams = P2PRespondToReqParams(senderUsername: 'tester');

  setUp(() {
    mockGetterStore = MockMRespondToARequestGetterStore();
    respondToARequestStore =
        RespondToARequestStore(respondToRequestGetterStore: mockGetterStore);
  });
  group("stateOrErrorUpdater", () {
    test("✅ SUCCESS CASE: should update accordingly if state is passed",
        () async {
      //arrange
      // act
      respondToARequestStore.stateOrErrorUpdater(Right(
          ConstantEntities.successfulP2PRequestRecipientResponseStatusEntity));
      // assert
      expect(respondToARequestStore.isSent, true);
      expect(respondToARequestStore.errorMessage, "");
    });
    test("❌ FAILURE CASE: should update accordingly if error is passed",
        () async {
      // arrange

      // act
      respondToARequestStore
          .stateOrErrorUpdater(Left(FailureConstants.dbFailure));
      // assert
      expect(respondToARequestStore.isSent, false);
      expect(respondToARequestStore.errorMessage,
          FailureConstants.genericFailureMsg);
      expect(respondToARequestStore.state, StoreState.initial);
    });
  });

  group("call", () {
    test("✅ SUCCESS CASE: should update accordingly if state is passed",
        () async {
      //arrange
      expect(respondToARequestStore.state, StoreState.initial);
      when(mockGetterStore(tParams.senderUsername)).thenAnswer(
        (_) async => Right(
          ConstantEntities.successfulP2PRequestRecipientResponseStatusEntity,
        ),
      );
      // act
      await respondToARequestStore(tParams);
      // assert
      expect(respondToARequestStore.isSent, true);
      expect(respondToARequestStore.errorMessage, "");
      expect(respondToARequestStore.state, StoreState.loaded);
    });
    test("❌ FAILURE CASE: should update accordingly if error is passed",
        () async {
      // arrange

      when(mockGetterStore(tParams.senderUsername)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      // act
      await respondToARequestStore(tParams);
      // assert
      expect(respondToARequestStore.isSent, false);
      expect(respondToARequestStore.errorMessage,
          FailureConstants.genericFailureMsg);
      expect(respondToARequestStore.state, StoreState.initial);
    });
  });
}
