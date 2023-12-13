import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/connectivity/mobx/get_on_connectivity_changed_store.dart';

import '../mocks/connectivity_mocks.mocks.dart';

void main() {
  late GetOnConnectivityChangedStore testStore;
  late MockGetOnConnectivityChanged mockLogic;

  setUp(() {
    mockLogic = MockGetOnConnectivityChanged();
    testStore = GetOnConnectivityChangedStore(logic: mockLogic);
  });

  group("initial values", () {
    test("connectivityStream", () {
      expect(testStore.connectivityStream, emitsDone);
    });

    test("mostRecentResult", () {
      expect(testStore.mostRecentResult, ConnectivityResult.none);
    });
  });

  group("actions", () {
    test("setMostRecentResult", () {
      testStore.setMostRecentResult(ConnectivityResult.bluetooth);
      expect(testStore.mostRecentResult, ConnectivityResult.bluetooth);
    });
    test("callAndListen", () async {
      when(mockLogic(NoParams())).thenAnswer(
          (realInvocation) => Stream.value(ConnectivityResult.mobile));
      await testStore.callAndListen();
      expect(testStore.mostRecentResult, ConnectivityResult.mobile);
    });
  });
}
