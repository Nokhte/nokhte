import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/local_speech_to_text_mock_gen.mocks.dart';

void main() {
  late MockMLocalSpeechToTextContract mockContract;
  late ProcessAudio logic;
  final tParams = ProcessAudioParams(recordedFile: File(''));

  setUp(() {
    mockContract = MockMLocalSpeechToTextContract();
    logic = ProcessAudio(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.processAudio(tParams)).thenAnswer(
      (_) async => ConstantAudioProcessingEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantAudioProcessingEntity.wrappedSuccessCase);
    verify(mockContract.processAudio(tParams));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.processAudio(tParams)).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.processAudio(tParams));
    verifyNoMoreInteractions(mockContract);
  });
}
