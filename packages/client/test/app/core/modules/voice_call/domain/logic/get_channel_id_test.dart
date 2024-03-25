import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockVoiceCallContract mockContract;
  late GetChannelId logic;

  setUp(() {
    mockContract = MockVoiceCallContract();
    logic = GetChannelId(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getChannelId(GetChannelIdParams.forNokhteSession))
        .thenAnswer(
      (_) async => const Right("channelId"),
    );

    final result = await logic(GetChannelIdParams.forNokhteSession);

    expect(result, const Right("channelId"));
    verify(mockContract.getChannelId(GetChannelIdParams.forNokhteSession));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getChannelId(GetChannelIdParams.forNokhteSession))
        .thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(GetChannelIdParams.forNokhteSession);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getChannelId(GetChannelIdParams.forNokhteSession));
    verifyNoMoreInteractions(mockContract);
  });
}
