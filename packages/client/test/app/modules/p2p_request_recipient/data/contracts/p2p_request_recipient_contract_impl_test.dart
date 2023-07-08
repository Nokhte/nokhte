// what needs to be bocked
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_request_recipient/data/contracts/p2p_request_recipient_contract_impl.dart';
import '../../../_module_helpers/shared_mocks_gen.mocks.dart';
import '../../constants/models.dart';
import '../../constants/sample_data_source_responses.dart';
import '../../fixtures/p2p_request_recipient_stack_mock_gen.mocks.dart';

void main() {
  late P2PRequestRecipientContractImpl p2pContract;
  late MockMP2PRequestRecipientRemoteSource mockRS;
  late MockMNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRS = MockMP2PRequestRecipientRemoteSource();
    mockNetworkInfo = MockMNetworkInfo();
    p2pContract = P2PRequestRecipientContractImpl(
      networkInfo: mockNetworkInfo,
      remoteSource: mockRS,
    );
  });

  group("Online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    group("loadTheRequests", () {
      test("Should return the proper model when passed a non-empty response",
          () async {
        // arrange
        when(mockRS.loadRequests()).thenAnswer(
          (_) async => SampleDataSourceResonses.recipientRequestList,
        );
        // act
        final res = await p2pContract.loadTheRequests();
        // assert
        expect(res, ConstantModels.wrappedNonEmptyP2PRecipReqModel);
      });
      test("Should return the proper model when passed an empty response",
          () async {
        // arrange
        when(mockRS.loadRequests()).thenAnswer(
          (_) async => SampleDataSourceResonses.emptyResponse,
        );
        // act
        final res = await p2pContract.loadTheRequests();
        // assert
        expect(res, ConstantModels.wrappedEmptyP2PRecipReqModel);
      });
    });
    group("respondToARequest", () {
      test("should send a proper request and return the proper model",
          () async {
        when(mockRS.respondToARequest('test'))
            .thenAnswer((realInvocation) async => [{}]);
        // act
        final res = await p2pContract.respondToARequest('test');
        // assert
        expect(
          res,
          ConstantModels.wrappedSuccessfulEmptyP2PRecipReqResStatusModel,
        );
      });
    });
  });
  group("Offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
    test("loadTheRequests", () async {
      final res = await p2pContract.loadTheRequests();
      expect(res, Left(FailureConstants.internetConnectionFailure));
    });
    test("respondToARequest", () async {
      final res = await p2pContract.respondToARequest('test');
      expect(res, Left(FailureConstants.internetConnectionFailure));
    });
  });
}
