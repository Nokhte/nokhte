import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';

import '../../../_module_helpers/shared_mocks_gen.mocks.dart';
import '../../constants/models/models.dart';
import '../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';
import '../../constants/response/response.dart';

void main() {
  late P2PPurposeSessionContractImpl contractImpl;
  late MockMP2PPurposeSessionRemoteSourceImpl mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockMNetworkInfo();
    mockRemoteSource = MockMP2PPurposeSessionRemoteSourceImpl();
    contractImpl = P2PPurposeSessionContractImpl(
      networkInfo: mockNetworkInfo,
      remoteSource: mockRemoteSource,
    );
  });

  group('Method No. 1: fetchAgoraToken ', () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online & a good API query is made it should proper model",
          () async {
        // arrange
        when(mockRemoteSource.fetchAgoraToken(channelName: 'hi')).thenAnswer(
            (realInvocation) async => TokenServerResponse.successfulResponse);
        // act
        final res = await contractImpl.fetchAgoraToken(channelName: 'hi');
        // assert
        expect(res, ConstantAgoraCallTokenModel.wrappedSuccessCase);
      });

      test("when online and not approved should return a proper model",
          () async {
        // arrange
        when(mockRemoteSource.fetchAgoraToken(channelName: 'hi')).thenAnswer(
            (realInvocation) async =>
                TokenServerResponse.notSuccessfulResponse);
        // act
        final res = await contractImpl.fetchAgoraToken(channelName: 'hi');
        // assert
        expect(res, ConstantAgoraCallTokenModel.wrappedNotSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.fetchAgoraToken(channelName: 'hi');
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group('Method No. 2:  `FetchChannelId`', () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online & collaboration exists should return the proper model",
          () async {
        // arrange
        when(mockRemoteSource.fetchChannelId()).thenAnswer(
          (realInvocation) async => ExistingCollaboratorsTable.response,
        );
        // act
        final res = await contractImpl.fetchChannelId();
        // assert
        expect(res, ConstantChannelIdModel.wrappedSuccessCase);
      });

      test(
          "when online and collaboration doesn't exist should return empty model",
          () async {
        // arrange
        when(mockRemoteSource.fetchChannelId())
            .thenAnswer((realInvocation) async => []);
        // act
        final res = await contractImpl.fetchChannelId();
        // assert
        expect(res, ConstantChannelIdModel.wrappedNotSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.fetchChannelId();
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
        // arrange
        when(mockRemoteSource.instantiateAgoraSDK()).thenAnswer((_) async {});
        // act
        final res = await contractImpl.instantiateAgoraSdk();
        // assert
        expect(res, ConstantAgoraSdkStatusModel.wrappedSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.instantiateAgoraSdk();
        expect(res, Left(FailureConstants.internetConnectionFailure));
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
        // arrange
        when(mockRemoteSource.joinCall(
          token: 'someTokenId',
          channelId: 'someChannelId',
        )).thenAnswer((_) async {});
        // act
        final res = await contractImpl.joinCall('someTokenId', 'someChannelId');
        // assert
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
        // arrange
        when(mockRemoteSource.leaveCall()).thenAnswer((_) async {});
        // act
        final res = await contractImpl.leaveCall();
        // assert
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
        // arrange
        when(mockRemoteSource.muteLocalAudioStream()).thenAnswer((_) async {});
        // act
        final res = await contractImpl.muteLocalAudioStream();
        // assert
        expect(res, ConstantLocalAudioStreamStatusModel.wrappedMutedCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.muteLocalAudioStream();
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
        // arrange
        when(mockRemoteSource.unmuteLocalAudioStream())
            .thenAnswer((_) async {});
        // act
        final res = await contractImpl.unmuteLocalAudioStream();
        // assert
        expect(res, ConstantLocalAudioStreamStatusModel.wrappedUnmutedCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await contractImpl.unmuteLocalAudioStream();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
}
