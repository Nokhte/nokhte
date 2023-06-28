// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
// * Contract Impl
import 'package:primala/app/modules/p2p_scheduling_sender/data/contracts/p2p_scheduling_sender_contract_impl.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';
// * Mocks
import '../../../_module_helpers/shared_mocks_gen.mocks.dart'
    show MockMNetworkInfo;
import '../../constants/param/send_param_entities.dart';
import '../../constants/return/send/send_scheduling_request_status_models.dart';
import '../../constants/return/confirm/confirm_scheduling_time_status_models.dart';
import '../../constants/sample_data.dart';
import '../../fixtures/p2p_scheduling_sender_mock_gen.mocks.dart';
// * Constants

void main() {
  late P2PSchedulingSenderContractImpl schedulingContract;
  late MockMP2PSchedulingSenderRemoteSource mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;
  final tNetworkConnectionFailure =
      Left<Failure, P2PSchedulingRequestStatusEntity>(
    FailureConstants.internetConnectionFailure,
  );

  setUp(() {
    mockRemoteSource = MockMP2PSchedulingSenderRemoteSource();
    mockNetworkInfo = MockMNetworkInfo();
    schedulingContract = P2PSchedulingSenderContractImpl(
      networkInfo: mockNetworkInfo,
      remoteSource: mockRemoteSource,
    );
  });

  group("device is online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    group('sendSchedulingRequest', () {
      test("✅ Successfully returns right entity w/ successful request",
          () async {
        // arrange
        when(
          mockRemoteSource.sendSchedulingRequest(
              SampleData.randomUID, SampleData.jsonTimeRanges),
        ).thenAnswer((_) async => [
              {"someData": "isSuccessful"}
            ]);
        // act
        final res = await schedulingContract.sendSchedulingRequest(
          schedulingInfoEntity:
              ConstantSendParamEntities.sendScheduleParamEntity,
        );
        // assert
        expect(res,
            ConstantSendSchedulingRequestStatusEntities.wrappedSuccessCase);
      });
      test("✅ Successfully returns right entity w/ unsuccessful request",
          () async {
        // arrange
        when(
          mockRemoteSource.sendSchedulingRequest(
              SampleData.randomUID, SampleData.jsonTimeRanges),
        ).thenAnswer((_) async => []);
        // act
        final res = await schedulingContract.sendSchedulingRequest(
          schedulingInfoEntity:
              ConstantSendParamEntities.sendScheduleParamEntity,
        );
        // assert
        expect(res,
            ConstantSendSchedulingRequestStatusEntities.wrappedNotSuccessCase);
      });
    });
    // % End of sendSchedulingRequest
    group('confirmSchedulingTime', () {
      test("✅ Successfully returns right entity w/ successful request",
          () async {
        // arrange
        when(
          mockRemoteSource.confirmSchedulingTime(SampleData.randomUID),
        ).thenAnswer((_) async => [SampleData.successConfirmResponse]);
        // act
        final res = await schedulingContract.confirmSchedulingTime(
          receiverUID: SampleData.randomUID,
        );
        // assert
        expect(
            res, ConstantConfirmSchedulingTimeStatusModels.wrappedSuccessCase);
      });
      test("✅ Successfully returns right entity w/ unsuccessful request",
          () async {
        // arrange
        when(
          mockRemoteSource.confirmSchedulingTime(SampleData.randomUID),
        ).thenAnswer((_) async => []);
        // act
        final res = await schedulingContract.confirmSchedulingTime(
          receiverUID: SampleData.randomUID,
        );
        // assert
        expect(res,
            ConstantConfirmSchedulingTimeStatusModels.wrappedNotSuccessCase);
      });
    });
  });

  group("device is offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test('❌ sendSchedulingRequest should send the internet connection failure',
        () async {
      final res = await schedulingContract.sendSchedulingRequest(
        schedulingInfoEntity: ConstantSendParamEntities.sendScheduleParamEntity,
      );
      expect(res, tNetworkConnectionFailure);
    });
    test('❌ confirmSchedulingTime should send the internet connection failure',
        () async {
      final res = await schedulingContract.confirmSchedulingTime(
        receiverUID: SampleData.randomUID,
      );
      expect(res, tNetworkConnectionFailure);
    });
  });
}
