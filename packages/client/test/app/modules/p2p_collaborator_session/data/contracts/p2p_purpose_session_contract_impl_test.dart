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
}
