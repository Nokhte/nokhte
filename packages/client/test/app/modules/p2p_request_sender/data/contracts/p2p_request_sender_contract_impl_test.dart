// * Mocks
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_request_sender/data/contracts/p2p_request_sender_contract_impl.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_recipient_entity.dart';
import '../../../_module_helpers/shared_mocks_gen.mocks.dart';
import '../../constants/models.dart';
import '../../fixtures/p2p_request_sender_mock_gen.mocks.dart';
import '../../constants/supabase_responses.dart';

void main() {
  late P2PRequestSenderContractImpl p2pContract;
  late MockMP2PRequestSenderRemoteSource mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteSource = MockMP2PRequestSenderRemoteSource();
    mockNetworkInfo = MockMNetworkInfo();
    p2pContract = P2PRequestSenderContractImpl(
      remoteSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    group("SendRequest", () {
      test("Send Request should send a request properly", () async {
        when(mockRemoteSource.sendARequest('test')).thenAnswer(
            (realInvocation) async =>
                SupabaseResponseConstants.nonEmptyResponse);
        final res = await p2pContract.sendARequest('test');
        expect(res, ConstantModels.successfulP2PRequestStatusModel);
      });
    });
    group('validateRequest', () {
      group("Username Exists Block", () {
        setUp(() {
          // arrange
          when(mockRemoteSource.checkIfRecipientExists('test'))
              .thenAnswer((_) async => [
                    {"uid": "test", "username": "test"},
                  ]);
        });
        test("CASE 1 ✅: Valid Request", () async {
          when(mockRemoteSource.checkForRecipientDuplicate('test'))
              .thenAnswer((_) async => []);
          when(mockRemoteSource.checkForSenderDuplicate('test'))
              .thenAnswer((_) async => []);
          final res = await p2pContract.validateRequest('test');
          expect(res, ConstantModels.successfulRecipientModel);
        });
        test("CASE 2 ❌: Invalid b/c it's a sender duplicate", () async {
          when(mockRemoteSource.checkForRecipientDuplicate('test'))
              .thenAnswer((_) async => []);
          when(mockRemoteSource.checkForSenderDuplicate('test'))
              .thenAnswer((_) async => [{}]);
          final Either<Failure, P2PRequestRecipientEntity> res =
              await p2pContract.validateRequest('test');
          expect(res, ConstantModels.senderDuplicateRecipientModel);
        });

        test("CASE 3 ❌: Invalid b/c it's a receiver duplicate", () async {
          when(mockRemoteSource.checkForRecipientDuplicate('test'))
              .thenAnswer((_) async => [{}]);
          when(mockRemoteSource.checkForSenderDuplicate('test'))
              .thenAnswer((_) async => []);
          final res = await p2pContract.validateRequest('test');
          expect(res, ConstantModels.recipientDuplicateRecipientModel);
        });
      });

      group("Username Doesn't Exist Block", () {
        test("CASE 1 ❌: Requested User Doesn't Exist", () {});
      });
    });

    group('sendARequest', () {
      test("When passed an non-empty array it returns the proper model",
          () async {
        when(mockRemoteSource.sendARequest('test')).thenAnswer((_) async => [
              {"uid": "test"}
            ]);
        final res = await p2pContract.sendARequest('test');
        expect(res, ConstantModels.successfulP2PRequestStatusModel);
      });
      test("When passed an empty array it returns the proper model", () async {
        when(mockRemoteSource.sendARequest('test')).thenAnswer((_) async => []);
        final res = await p2pContract.sendARequest('test');
        expect(res, ConstantModels.notSuccessfulP2PRequestStatusModel);
      });
    });
  });
  group('device is offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
    test('sendARequest should send an internet error', () async {
      final res = await p2pContract.sendARequest('test');
      expect(res, Left(FailureConstants.internetConnectionFailure));
    });
    test('validateRequest should send an internet error', () async {
      final res = await p2pContract.validateRequest('test');
      expect(res, Left(FailureConstants.internetConnectionFailure));
    });
  });
}
