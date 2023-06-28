// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/validate_request.dart';
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/main/validate_request_store.dart';
import '../../../constants/entities.dart';
import '../../../fixtures/p2p_request_sender_mock_gen.mocks.dart';

void main() {
  late MockMValidateRequestGetterStore mockGetterStore;
  late ValidateRequestStore recipientStore;
  const tParams = P2PReqRecipientParams(username: "test");

  setUp(() {
    mockGetterStore = MockMValidateRequestGetterStore();
    recipientStore = ValidateRequestStore(
      validateRequestGetterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ CASE 1: Valid Request is passed", () async {
      //arrange
      // act
      recipientStore.stateOrErrorUpdater(
          Right(ConstantEntities.successfulRecipientEntity));
      // assert
      expect(recipientStore.recipientExists, true);
      expect(recipientStore.duplicateRecipient, false);
      expect(recipientStore.duplicateSender, false);
      expect(recipientStore.errorMessage, "");
    });
    test("❌ CASE 2: Sender Duplicate Request", () async {
      // act
      recipientStore.stateOrErrorUpdater(
        Right(ConstantEntities.alreadySentRequestRecipientEntity),
      );
      // assert
      expect(recipientStore.recipientExists, true);
      expect(recipientStore.duplicateRecipient, false);
      expect(recipientStore.duplicateSender, true);
      expect(recipientStore.errorMessage, "");
    });
    test("❌ CASE 3: Receiver Duplicate Request", () async {
      // act
      recipientStore.stateOrErrorUpdater(
        Right(ConstantEntities.alreadyReceivedRequestRecipientEntity),
      );
      // assert
      expect(recipientStore.recipientExists, true);
      expect(recipientStore.duplicateRecipient, true);
      expect(recipientStore.duplicateSender, false);
      expect(recipientStore.errorMessage, "");
    });
    test("❌ FAILURE CASE: should update accordingly if error is passed",
        () async {
      // act
      recipientStore.stateOrErrorUpdater(Left(FailureConstants.dbFailure));
      // assert
      expect(recipientStore.recipientExists, false);
      expect(recipientStore.errorMessage, FailureConstants.genericFailureMsg);
      expect(recipientStore.state, StoreState.initial);
    });
  });

  group("call", () {
    test("✅ SUCCESS CASE: should update accordingly if state is passed",
        () async {
      //arrange
      expect(recipientStore.state, StoreState.initial);
      when(mockGetterStore(tParams.username)).thenAnswer(
        (_) async => Right(ConstantEntities.successfulRecipientEntity),
      );
      // act
      await recipientStore(tParams);
      // assert
      expect(recipientStore.recipientExists, true);
      expect(recipientStore.errorMessage, "");
      expect(recipientStore.state, StoreState.loaded);
    });
    test("❌ FAILURE CASE: should update accordingly if error is passed",
        () async {
      // arrange

      when(mockGetterStore(tParams.username)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      // act
      await recipientStore(tParams);
      // assert
      expect(recipientStore.recipientExists, false);
      expect(recipientStore.errorMessage, FailureConstants.genericFailureMsg);
      expect(recipientStore.state, StoreState.initial);
    });
  });
}
