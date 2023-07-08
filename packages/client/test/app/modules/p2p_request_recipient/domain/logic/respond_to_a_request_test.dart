// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/logic/respond_to_a_request.dart';
import '../../fixtures/p2p_request_recipient_stack_mock_gen.mocks.dart';
import '../../constants/entities.dart';

void main() {
  late MockMP2PRequestRecipientContract mockContract;
  late RespondToARequest respondToARequest;

  setUp(() {
    mockContract = MockMP2PRequestRecipientContract();
    respondToARequest = RespondToARequest(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.respondToARequest('test')).thenAnswer(
      (_) async => Right(
        ConstantEntities.successfulP2PRequestRecipientResponseStatusEntity,
      ),
    );
    final result = await respondToARequest(
        const P2PRespondToReqParams(senderUsername: 'test'));
    expect(
      result,
      Right(
        ConstantEntities.successfulP2PRequestRecipientResponseStatusEntity,
      ),
    );
    verify(mockContract.respondToARequest('test'));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.respondToARequest('test')).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );
    final result = await respondToARequest(
        const P2PRespondToReqParams(senderUsername: 'test'));
    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.respondToARequest('test'));
    verifyNoMoreInteractions(mockContract);
  });
}
