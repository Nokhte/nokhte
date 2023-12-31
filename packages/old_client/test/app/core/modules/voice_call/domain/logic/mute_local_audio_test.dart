import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockMVoiceCallContract mockContract;
  late MuteLocalAudio logic;

  setUp(() {
    mockContract = MockMVoiceCallContract();
    logic = MuteLocalAudio(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.muteLocalAudio()).thenAnswer(
      (_) async => ConstantLocalAudioStreamStatusEntity.wrappedMutedCase,
    );

    final result = await logic(NoParams());

    expect(result, ConstantLocalAudioStreamStatusEntity.wrappedMutedCase);
    verify(mockContract.muteLocalAudio());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.muteLocalAudio()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(NoParams());

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.muteLocalAudio());
    verifyNoMoreInteractions(mockContract);
  });
}
