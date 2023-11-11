import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockMVoiceCallContract mockContract;
  late FetchAgoraToken logic;
  const tParams = FetchAgoraTokenParams(channelName: 'hi');

  setUp(() {
    mockContract = MockMVoiceCallContract();
    logic = FetchAgoraToken(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.fetchAgoraToken(channelName: 'hi')).thenAnswer(
      (_) async => ConstantAgoraCallTokenEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantAgoraCallTokenEntity.wrappedSuccessCase);
    verify(mockContract.fetchAgoraToken(channelName: 'hi'));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.fetchAgoraToken(channelName: 'hi')).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.fetchAgoraToken(channelName: 'hi'));
    verifyNoMoreInteractions(mockContract);
  });
}
