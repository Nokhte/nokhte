// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/validate_request.dart';

import '../../fixtures/p2p_request_sender_mock_gen.mocks.dart';
import '../../constants/entities.dart';

void main() {
  late MockMP2PRequestSenderContract mockContract;
  late ValidateRequest validateRequestLogic;
  final dbFailure = FailureConstants.dbFailure;

  setUp(() {
    mockContract = MockMP2PRequestSenderContract();
    validateRequestLogic = ValidateRequest(contract: mockContract);
  });
  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.validateRequest('test')).thenAnswer((_) async =>
        Right(ConstantEntities.alreadyReceivedRequestRecipientEntity));
    final result = await validateRequestLogic(
        const P2PReqRecipientParams(username: 'test'));
    expect(
        result, Right(ConstantEntities.alreadyReceivedRequestRecipientEntity));
    verify(mockContract.validateRequest('test'));
    verifyNoMoreInteractions(mockContract);
  });
  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.validateRequest('test')).thenAnswer(
      (_) async => Left(dbFailure),
    );
    final result = await validateRequestLogic(
        const P2PReqRecipientParams(username: 'test'));
    expect(result, Left(dbFailure));
    verify(mockContract.validateRequest('test'));
    verifyNoMoreInteractions(mockContract);
  });
}
