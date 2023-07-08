// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
// * 3rd Party Libs
import 'package:flutter_modular/flutter_modular.dart';
// * Core Imports
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/validate_request.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/send_a_request.dart';
// * The p2p request sender module
import 'package:primala/app/modules/p2p_request_sender/p2p_request_sender_module.dart';
// * Remote Source
import 'package:primala/app/modules/p2p_request_sender/data/sources/p2p_request_sender_remote_source.dart';
// * Main MobX Stores
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/main/send_a_request_store.dart';
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/main/validate_request_store.dart';
// * Local Mocks
import './fixtures/p2p_request_sender_mock_gen.mocks.dart';
// * Helpers
import '../_helpers/module_setup.dart';
import './constants/supabase_responses.dart';

void main() {
  late MockMP2PRequestSenderRemoteSourceImpl mockRemoteSource;
  late ValidateRequestStore validateRequestStore;

  void teeItUp({required bool isOnline, required Function body}) {
    group(
      "${isOnline == true ? 'Online' : 'Offline'} INTEGRATION BLOCK",
      () {
        setUp(() {
          mockRemoteSource = MockMP2PRequestSenderRemoteSourceImpl();
          ModuleHelpers.dependentModulesSetup(isOnline);
          initModule(
            P2PRequestSenderModule(),
            replaceBinds: [
              Bind.instance<P2PRequestSenderRemoteSourceImpl>(
                mockRemoteSource,
              ),
            ],
          );
        });
        body();

        tearDown(() {
          Modular.destroy();
        });
      },
    );
  }

  teeItUp(
      isOnline: true,
      body: () {
        group("ValidateARequestStore", () {
          setUp(() {
            validateRequestStore = Modular.get<ValidateRequestStore>();
          });
          group("USERNAME EXISTS", () {
            setUp(() {
              when(mockRemoteSource.checkIfRecipientExists("test"))
                  .thenAnswer((_) async => [
                        {"uid": "test"}
                      ]);
            });
            test(
              "✅ CASE 1: Valid Request Is Made",
              () async {
                // ARRANGE
                when(mockRemoteSource.checkForRecipientDuplicate('test'))
                    .thenAnswer(
                        (_) async => SupabaseResponseConstants.emptyResponse);
                when(mockRemoteSource.checkForSenderDuplicate('test'))
                    .thenAnswer(
                        (_) async => SupabaseResponseConstants.emptyResponse);
                // ACT
                await validateRequestStore(
                    const P2PReqRecipientParams(username: 'test'));
                // ASSERT
                expect(validateRequestStore.recipientExists, true);
                expect(validateRequestStore.duplicateRecipient, false);
                expect(validateRequestStore.duplicateSender, false);
                expect(validateRequestStore.errorMessage, "");
              },
            );
            test(
              "❌ CASE 2: Sender Duplicate Request is Attempted",
              () async {
                // ARRANGE
                when(mockRemoteSource.checkForRecipientDuplicate('test'))
                    .thenAnswer(
                        (_) async => SupabaseResponseConstants.emptyResponse);
                when(mockRemoteSource.checkForSenderDuplicate('test'))
                    .thenAnswer((_) async =>
                        SupabaseResponseConstants.nonEmptyResponse);
                // ACT
                await validateRequestStore(
                    const P2PReqRecipientParams(username: 'test'));
                // ASSERT
                expect(validateRequestStore.recipientExists, true);
                expect(validateRequestStore.duplicateRecipient, false);
                expect(validateRequestStore.duplicateSender, true);
                expect(validateRequestStore.errorMessage, "");
              },
            );
            test(
              "❌ CASE 3: Sender Receiver Request is Attempted",
              () async {
                // ARRANGE
                when(mockRemoteSource.checkForRecipientDuplicate('test'))
                    .thenAnswer((_) async =>
                        SupabaseResponseConstants.nonEmptyResponse);
                when(mockRemoteSource.checkForSenderDuplicate('test'))
                    .thenAnswer(
                        (_) async => SupabaseResponseConstants.emptyResponse);
                // ACT
                await validateRequestStore(
                    const P2PReqRecipientParams(username: 'test'));
                // ASSERT
                expect(validateRequestStore.recipientExists, true);
                expect(validateRequestStore.duplicateRecipient, true);
                expect(validateRequestStore.duplicateSender, false);
                expect(validateRequestStore.errorMessage, "");
              },
            );
          });
          group("USERNAME DOESN'T EXIST", () {
            test(
              "Invalid Nonexistent User Request is Attempted",
              () async {
                // ARRANGE
                when(mockRemoteSource.checkIfRecipientExists("test"))
                    .thenAnswer(
                        (_) async => SupabaseResponseConstants.emptyResponse);
                when(mockRemoteSource.checkForRecipientDuplicate('test'))
                    .thenAnswer(
                        (_) async => SupabaseResponseConstants.emptyResponse);
                when(mockRemoteSource.checkForSenderDuplicate('test'))
                    .thenAnswer(
                        (_) async => SupabaseResponseConstants.emptyResponse);
                // ACT
                await validateRequestStore(
                    const P2PReqRecipientParams(username: 'test'));
                // ASSERT
                expect(validateRequestStore.recipientExists, false);
                expect(validateRequestStore.duplicateRecipient, false);
                expect(validateRequestStore.duplicateSender, false);
                expect(validateRequestStore.errorMessage, "");
              },
            );
          });
        });
        group("SendARequestStore", () {
          test(
            "✅SUCCESS CASE: SendARequest Successfully Runs",
            () async {
              // arrange
              when(mockRemoteSource.sendARequest('test')).thenAnswer(
                (realInvocation) async =>
                    SupabaseResponseConstants.nonEmptyResponse,
              );
              final sendARequestStore = Modular.get<SendARequestStore>();
              // act
              await sendARequestStore(const P2PSendReqParams(username: "test"));
              // assert
              expect(sendARequestStore.isSent, true);
              expect(sendARequestStore.errorMessage, "");
            },
          );
        });
      });

  teeItUp(
      isOnline: false,
      body: () {
        test("❌FAILURE CASE: SendARequest is called offline", () async {
          // arrange
          final sendARequestStore = Modular.get<SendARequestStore>();
          // act
          await sendARequestStore(const P2PSendReqParams(username: "test"));
          // assert
          expect(sendARequestStore.errorMessage,
              FailureConstants.internetConnectionFailureMsg);
        });
        test("❌FAILURE CASE: validateRequest is called offline", () async {
          // arrange
          final validateRequestStore = Modular.get<ValidateRequestStore>();
          // act
          await validateRequestStore(
              const P2PReqRecipientParams(username: "test"));
          // assert
          expect(validateRequestStore.errorMessage,
              FailureConstants.internetConnectionFailureMsg);
        });
      });
}
