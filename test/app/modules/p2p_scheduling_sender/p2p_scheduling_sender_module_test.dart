// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
// * 3rd Party Libs
import 'package:flutter_modular/flutter_modular.dart';
// * Core Imports
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/mobx/store_state.dart';
// * The p2p request sender module
import 'package:primala/app/modules/p2p_scheduling_sender/p2p_scheduling_sender_module.dart';
// * Remote Source
import 'package:primala/app/modules/p2p_scheduling_sender/data/sources/p2p_scheduling_sender_remote_source.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/main/confirm_scheduling_time_store.dart';
// * Main MobX Stores
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/main/send_scheduling_request_store.dart';
// * Local Mocks
import 'constants/param/confirm_param_entities.dart';
import 'constants/param/send_param_entities.dart';
import './fixtures/p2p_scheduling_sender_mock_gen.mocks.dart';
// * Helpers
import '../_helpers/module_setup.dart';
import 'constants/sample_data.dart';

void main() {
  late MockMP2PSchedulingSenderRemoteSourceImpl mockRemoteSource;
  late SendSchedulingRequestStore sendSchedulingRequestStore;
  late ConfirmSchedulingTimeStore confirmSchedulingTimeStore;

  void teeItUp({required bool isOnline, required Function body}) {
    group(
      "${isOnline == true ? 'Online' : 'Offline'} INTEGRATION BLOCK",
      () {
        setUp(() {
          mockRemoteSource = MockMP2PSchedulingSenderRemoteSourceImpl();
          ModuleHelpers.dependentModulesSetup(isOnline);
          initModule(
            P2PSchedulingSenderModule(),
            replaceBinds: [
              Bind.instance<P2PSchedulingSenderRemoteSourceImpl>(
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
        group('sendSchedulingRequestStore', () {
          setUp(() {
            sendSchedulingRequestStore =
                Modular.get<SendSchedulingRequestStore>();
          });
          test("✅ SUCCESS CASE: Successful Request is made", () async {
            when(mockRemoteSource.sendSchedulingRequest(
                    SampleData.randomUID,
                    ConstantSendParamEntities.sendScheduleParamEntity
                        .timeRangesToJson()))
                .thenAnswer((_) async => [{}]);
            await sendSchedulingRequestStore(
                ConstantSendParamEntities.sendScheduleParamEntity);
            expect(sendSchedulingRequestStore.isSent, true);
            expect(sendSchedulingRequestStore.errorMessage, "");
            expect(sendSchedulingRequestStore.state, StoreState.loaded);
          });
        });
        group('confirmSchedulingTimeStore', () {
          setUp(() {
            confirmSchedulingTimeStore =
                Modular.get<ConfirmSchedulingTimeStore>();
          });
          test("✅ SUCCESS CASE: Successful Request is made", () async {
            when(mockRemoteSource.confirmSchedulingTime(SampleData.randomUID))
                .thenAnswer((_) async => [SampleData.successConfirmResponse]);
            await confirmSchedulingTimeStore(
              ConstantConfirmParamEntities.entity,
            );
            expect(confirmSchedulingTimeStore.isSent, true);
            expect(confirmSchedulingTimeStore.errorMessage, "");
            expect(confirmSchedulingTimeStore.state, StoreState.loaded);
          });
        });
      });

  teeItUp(
      isOnline: false,
      body: () {
        group('sendSchedulingRequestStore', () {
          setUp(() {
            sendSchedulingRequestStore =
                Modular.get<SendSchedulingRequestStore>();
          });
          test("❌ FAILURE CASE: Request is attempted when off the grid",
              () async {
            await sendSchedulingRequestStore(
                ConstantSendParamEntities.sendScheduleParamEntity);
            expect(sendSchedulingRequestStore.isSent, false);
            expect(sendSchedulingRequestStore.errorMessage,
                FailureConstants.internetConnectionFailureMsg);
            expect(sendSchedulingRequestStore.state, StoreState.initial);
          });
        });
        group('confirmSchedulingTimeStore', () {
          setUp(() {
            confirmSchedulingTimeStore =
                Modular.get<ConfirmSchedulingTimeStore>();
          });
          test("❌ FAILURE CASE: Request is attempted when off the grid",
              () async {
            await confirmSchedulingTimeStore(
              ConstantConfirmParamEntities.entity,
            );

            expect(confirmSchedulingTimeStore.isSent, false);
            expect(confirmSchedulingTimeStore.errorMessage,
                FailureConstants.internetConnectionFailureMsg);
            expect(confirmSchedulingTimeStore.state, StoreState.initial);
          });
        });
      });
}
