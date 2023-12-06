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
  late GetChannelId logic;

  setUp(() {
    mockContract = MockMVoiceCallContract();
    logic = GetChannelId(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getChannelId()).thenAnswer(
      (_) async => ConstantChannelIdEntity.wrappedSuccessCase,
    );

    final result = await logic(NoParams());

    expect(result, ConstantChannelIdEntity.wrappedSuccessCase);
    verify(mockContract.getChannelId());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getChannelId()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(NoParams());

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getChannelId());
    verifyNoMoreInteractions(mockContract);
  });
}
