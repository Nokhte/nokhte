import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';

import '../mocks/connectivity_mocks.mocks.dart';

void main() {
  late GetOnConnectivityChangedStore testStore;
  late MockGetOnConnectivityChanged mockLogic;

  setUp(() {
    mockLogic = MockGetOnConnectivityChanged();
    when(mockLogic(NoParams()))
        .thenAnswer((_) => Stream.value(ConnectivityResult.mobile));
    testStore = GetOnConnectivityChangedStore(logic: mockLogic);
  });

  group("initial values", () {
    test("mostRecentResult", () {
      expect(testStore.isConnected, true);
    });
  });

  group("actions", () {
    group("setMostRecentResult", () {
      test("initial outage", () {
        testStore.setMostRecentResult(ConnectivityResult.none);
        expect(testStore.isConnected, false);
      });

      test("offline, then goes online", () {
        testStore.setMostRecentResult(ConnectivityResult.none);
        expect(testStore.isConnected, false);
        testStore.setMostRecentResult(ConnectivityResult.wifi);
        expect(testStore.isConnected, true);
      });
    });
    test("callAndListen", () async {
      when(mockLogic(NoParams())).thenAnswer(
          (realInvocation) => Stream.value(ConnectivityResult.mobile));
      await testStore.callAndListen();
      expect(testStore.isConnected, true);
    });
  });
}
