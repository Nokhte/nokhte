// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMInitiateSpeechToTextGetterStore mockInitiateSpeechToTextGetterStore;
  late MockMStartListeningGetterStore mockStartListeningGetterStore;
  late MockMStopListeningGetterStore mockStopListeningGetterStore;
  late SpeechToTextStore speechToTextStore;

  setUp(() {
    mockInitiateSpeechToTextGetterStore =
        MockMInitiateSpeechToTextGetterStore();
    mockStartListeningGetterStore = MockMStartListeningGetterStore();
    mockStopListeningGetterStore = MockMStopListeningGetterStore();
    speechToTextStore = SpeechToTextStore(
      initSpeechToTextGetterStore: mockInitiateSpeechToTextGetterStore,
      startListeningGetterStore: mockStartListeningGetterStore,
      stopListeningGetterStore: mockStopListeningGetterStore,
    );
  });

  group("initSpeechStateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      speechToTextStore.initSpeechStateOrErrorUpdater(
        ConstantSpeechToTextInitializerStatusEntity.wrappedSuccessCase,
      );
      expect(
        speechToTextStore.isAllowed,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      speechToTextStore.initSpeechStateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(speechToTextStore.isAllowed, false);
      expect(
          speechToTextStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("listeningStateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      speechToTextStore.listeningStateOrErrorUpdater(
        ConstantListeningStatusEntity.wrappedSuccessCase,
      );
      expect(
        speechToTextStore.isListening,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      speechToTextStore.listeningStateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(speechToTextStore.isListening, false);
      expect(
          speechToTextStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("initSpeech", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockInitiateSpeechToTextGetterStore()).thenAnswer(
        (_) async =>
            ConstantSpeechToTextInitializerStatusEntity.wrappedNotSuccessCase,
      );
      await speechToTextStore(NoParams());
      expect(
        speechToTextStore.isAllowed,
        false,
      );
      expect(speechToTextStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockInitiateSpeechToTextGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await speechToTextStore.initSpeech();
      expect(speechToTextStore.isAllowed, false);
      expect(
          speechToTextStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("startListening", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockStartListeningGetterStore()).thenAnswer(
        (_) async => ConstantListeningStatusEntity.wrappedNotSuccessCase,
      );
      await speechToTextStore.startListening();
      expect(
        speechToTextStore.isListening,
        false,
      );
      expect(speechToTextStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockStartListeningGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await speechToTextStore.startListening();
      expect(speechToTextStore.isListening, false);
      expect(
          speechToTextStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("stopListening", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockStopListeningGetterStore()).thenAnswer(
        (_) async => ConstantListeningStatusEntity.wrappedNotSuccessCase,
      );
      await speechToTextStore.stopListening();
      expect(
        speechToTextStore.isListening,
        false,
      );
      expect(speechToTextStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockStopListeningGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await speechToTextStore.stopListening();
      expect(speechToTextStore.isListening, false);
      expect(
          speechToTextStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
