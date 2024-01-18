import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockVoiceCallContract mockContract;
  late JoinCall logic;
  const JoinCallParams tParams =
      JoinCallParams(token: "someReturnToken", channelId: "someChannelId");

  setUp(() {
    mockContract = MockVoiceCallContract();
    logic = JoinCall(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.joinCall(tParams.token, tParams.channelId)).thenAnswer(
      (_) async => ConstantCallStatusEntity.wrappedJoiningCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantCallStatusEntity.wrappedJoiningCase);
    verify(mockContract.joinCall(tParams.token, tParams.channelId));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.joinCall(tParams.token, tParams.channelId)).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.joinCall(tParams.token, tParams.channelId));
    verifyNoMoreInteractions(mockContract);
  });
}
