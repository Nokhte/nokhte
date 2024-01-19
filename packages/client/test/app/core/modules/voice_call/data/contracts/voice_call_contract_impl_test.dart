import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import '../../../../../modules/_module_helpers/shared_mocks_gen.mocks.dart';
import '../../constants/models/models.dart';
import '../../constants/response/response.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late VoiceCallContractImpl contractImpl;
  late MockVoiceCallRemoteSourceImpl mockRemoteSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteSource = MockVoiceCallRemoteSourceImpl();
    contractImpl = VoiceCallContractImpl(
      networkInfo: mockNetworkInfo,
      remoteSource: mockRemoteSource,
    );
  });

  group('Method No. 1: getAgoraToken ', () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online & a good API query is made it should proper model",
          () async {
        when(mockRemoteSource.getAgoraToken(channelName: 'hi')).thenAnswer(
            (realInvocation) async => TokenServerResponse.successfulResponse);
        final res = await contractImpl.getAgoraToken(channelName: 'hi');
        expect(res, ConstantAgoraCallTokenModel.wrappedSuccessCase);
      });

      test("when online and not approved should return a proper model",
          () async {
        when(mockRemoteSource.getAgoraToken(channelName: 'hi')).thenAnswer(
            (realInvocation) async =>
                TokenServerResponse.notSuccessfulResponse);
        final res = await contractImpl.getAgoraToken(channelName: 'hi');
        expect(res, ConstantAgoraCallTokenModel.wrappedNotSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.getAgoraToken(channelName: 'hi');
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group('Method No. 2:  `GetChannelId`', () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online & collaboration exists should return the proper model",
          () async {
        when(mockRemoteSource.getCollaboratorInfo()).thenAnswer(
          (realInvocation) async => ExistingCollaboratorsTable.response,
        );
        final res = await contractImpl.getChannelId();
        expect(res, ConstantChannelIdModel.wrappedSuccessCase);
      });

      test(
          "when online and collaboration doesn't exist should return empty model",
          () async {
        when(mockRemoteSource.getCollaboratorInfo())
            .thenAnswer((realInvocation) async => []);
        final res = await contractImpl.getChannelId();
        expect(res, ConstantChannelIdModel.wrappedNotSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.getChannelId();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group('Method No. 3:  `instantiateAgoraSdk`', () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test(
          "when online & no exceptions / errors are thrown should return a successful model",
          () async {
        when(mockRemoteSource.initAgoraSdk())
            .thenAnswer((_) async => createAgoraRtcEngine());
        final res = await contractImpl.initAgoraSdk(NoParams());
        expect(res, createAgoraRtcEngine());
      });
    });
  });

  group('Method No. 4:  `joinCall`', () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test(
          "when online & everything is valid should return an in progress model",
          () async {
        when(mockRemoteSource.joinCall(
          token: 'someTokenId',
          channelId: 'someChannelId',
        )).thenAnswer((_) async {});
        final res = await contractImpl.joinCall('someTokenId', 'someChannelId');
        expect(res, ConstantCallStatusModel.wrappedInProgressCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        when(mockRemoteSource.joinCall(
          token: 'someTokenId',
          channelId: 'someChannelId',
        )).thenAnswer((_) async {});
        final res = await contractImpl.joinCall('someTokenId', 'someChannelId');
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group('Method No. 5:  `leaveCall`', () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test(
          "when online & everything is valid should return a model w/ leaving status",
          () async {
        when(mockRemoteSource.leaveCall()).thenAnswer((_) async {});
        final res = await contractImpl.leaveCall();
        expect(res, ConstantCallStatusModel.wrappedLeavingInProgressCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.leaveCall();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group('Method No. 6:  `muteLocalAudioStream`', () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test(
          "when online & everything is valid should return a model w/ leaving status",
          () async {
        when(mockRemoteSource.muteLocalAudio()).thenAnswer((_) async {});
        final res = await contractImpl.muteLocalAudio();
        expect(res, const Right(true));
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.muteLocalAudio();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group('Method No. 7:  `unmuteLocalAudioStream`', () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test(
          "when online & everything is valid should return a model w/ leaving status",
          () async {
        when(mockRemoteSource.unmuteLocalAudio()).thenAnswer((_) async {});
        final res = await contractImpl.unmuteLocalAudio();
        expect(res, const Right(false));
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.unmuteLocalAudio();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
}
