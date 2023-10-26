import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/local_speech_to_text_mock_gen.mocks.dart';

void main() {
  late MockMStopRecording mockLogic;
  late StopRecordingGetterStore getterStore;
  late Either<Failure, AudioProcessingEntity> tEitherStatusOrFailure;
  final tParams = NoParams();

  setUp(() {
    mockLogic = MockMStopRecording();
    getterStore = StopRecordingGetterStore(logic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure = ConstantAudioProcessingEntity.wrappedSuccessCase;
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(tParams))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore(tParams);
      expect(res, tEitherStatusOrFailure);
    });
  });

  group("❌ Failure Cases", () {
    setUp(() {
      tEitherStatusOrFailure = Left(FailureConstants.dbFailure);
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(tParams))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore(tParams);
      expect(res, tEitherStatusOrFailure);
    });
  });
}
