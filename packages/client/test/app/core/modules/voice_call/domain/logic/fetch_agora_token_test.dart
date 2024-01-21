import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockVoiceCallContract mockContract;
  late GetAgoraToken logic;
  const tParams = GetAgoraTokenParams(channelName: 'hi');

  setUp(() {
    mockContract = MockVoiceCallContract();
    logic = GetAgoraToken(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getAgoraToken(channelName: 'hi')).thenAnswer(
      (_) async => Right("token"),
    );

    final result = await logic(tParams);

    expect(result, ConstantAgoraCallTokenEntity.wrappedSuccessCase);
    verify(mockContract.getAgoraToken(channelName: 'hi'));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getAgoraToken(channelName: 'hi')).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getAgoraToken(channelName: 'hi'));
    verifyNoMoreInteractions(mockContract);
  });
}
