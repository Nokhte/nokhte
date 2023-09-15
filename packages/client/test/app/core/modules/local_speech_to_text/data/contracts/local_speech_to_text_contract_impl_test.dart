import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
import '../../constants/models/models.dart';
import '../../fixtures/local_speech_to_text_mock_gen.mocks.dart';
import '../../../../../modules/_module_helpers/shared_mocks_gen.mocks.dart'
    show MockMNetworkInfo;
import 'package:dartz/dartz.dart';

void main() {
  late LocalSpeechToTextContractImpl contract;
  late MockLocalSpeechToTextRemoteSource mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteSource = MockLocalSpeechToTextRemoteSource();
    mockNetworkInfo = MockMNetworkInfo();
    contract = LocalSpeechToTextContractImpl(
      remoteSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
  });
  group("Method No. 1: initLeopard", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.initLeopard())
            .thenAnswer((realInvocation) async => true);
        // act
        final res = await contract.initLeopard(NoParams());
        // assert
        expect(
          res,
          ConstantInitLeopardStatusModel.wrappedSuccessCase,
        );
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.initLeopard())
            .thenAnswer((realInvocation) async => false);
        // act
        final res = await contract.initLeopard(NoParams());
        // assert
        expect(res, ConstantInitLeopardStatusModel.wrappedNotSuccessCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await contract.initLeopard(NoParams());
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 2: processAudio", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.processAudio(File('')))
            .thenAnswer((realInvocation) async => []);
        // act
        final res = await contract
            .processAudio(ProcessAudioParams(recordedFile: File('')));
        // assert
        expect(res, ConstantAudioProcessingModel.wrappedNotSuccessCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await contract
            .processAudio(ProcessAudioParams(recordedFile: File('')));
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });

  group("Method No. 3: startRecording", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.startRecording())
            .thenAnswer((realInvocation) async => RecordingStatus.started);
        // act
        final res = await contract.startRecording(NoParams());
        // assert
        expect(
          res,
          ConstantRecordingStatusModel.wrappedStartedCase,
        );
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.startRecording())
            .thenAnswer((realInvocation) async => RecordingStatus.error);
        // act
        final res = await contract.startRecording(NoParams());
        // assert
        expect(res, ConstantRecordingStatusModel.wrappedErrorCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await contract.startRecording(NoParams());
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 4: stopRecording", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.stopRecording())
            .thenAnswer((realInvocation) async => RecordingStatus.stopped);
        // act
        final res = await contract.stopRecording(NoParams());
        // assert
        expect(
          res,
          ConstantRecordingStatusModel.wrappedStoppedCase,
        );
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.stopRecording())
            .thenAnswer((realInvocation) async => RecordingStatus.error);
        // act
        final res = await contract.stopRecording(NoParams());
        // assert
        expect(res, ConstantRecordingStatusModel.wrappedErrorCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await contract.stopRecording(NoParams());
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
}
