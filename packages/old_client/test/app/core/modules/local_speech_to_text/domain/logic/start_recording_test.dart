import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/local_speech_to_text_mock_gen.mocks.dart';

void main() {
  late MockMLocalSpeechToTextContract mockContract;
  late StartRecording logic;
  final tParams = NoParams();

  setUp(() {
    mockContract = MockMLocalSpeechToTextContract();
    logic = StartRecording(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.startRecording(tParams)).thenAnswer(
      (_) async => ConstantRecordingStatusEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantRecordingStatusEntity.wrappedSuccessCase);
    verify(mockContract.startRecording(tParams));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.startRecording(tParams)).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.startRecording(tParams));
    verifyNoMoreInteractions(mockContract);
  });
}
