import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/local_speech_to_text_mock_gen.mocks.dart';

void main() {
  late MockMStopRecording mockGetterStore;
  late StopRecordingStore mainStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMStopRecording();
    mainStore = StopRecordingStore(
      logic: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      mainStore.stateOrErrorUpdater(
        ConstantAudioProcessingEntity.wrappedSuccessCase,
      );
      expect(
        mainStore.resultingWords,
        "resulting words",
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      mainStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(mainStore.resultingWords, "");
      expect(mainStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => ConstantAudioProcessingEntity.wrappedNotSuccessCase,
      );
      await mainStore(tParams);
      expect(
        mainStore.resultingWords,
        "",
      );
      expect(mainStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await mainStore(tParams);
      expect(mainStore.resultingWords, "");
      expect(mainStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
