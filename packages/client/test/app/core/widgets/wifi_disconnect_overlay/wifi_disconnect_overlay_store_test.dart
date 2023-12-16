import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import './wifi_disconnect_mocks.mocks.dart';

void main() {
  late MockGetOnConnectivityChangedStore mockConnectivity;
  late WifiDisconnectOverlayStore testStore;

  setUp(() {
    mockConnectivity = MockGetOnConnectivityChangedStore();
    when(mockConnectivity.callAndListen()).thenAnswer((realInvocation) => null);
    testStore = WifiDisconnectOverlayStore(
      getOnConnectivityChanged: mockConnectivity,
    );
  });

  group("initial values", () {
    test("getOnConnectivityChanged.callAndListen is called", () {
      verify(testStore.getOnConnectivityChanged.callAndListen());
    });

    test("movie", () {
      expect(testStore.movie.duration, Seconds.get(3, milli: 500));
    });

    test("showWidget", () {
      expect(testStore.showWidget, false);
    });
  });

  group("actions", () {
    group("attunWidgetsBasedOnConnection", () {
      test("isConnected", () {
        testStore.attuneWidgetsBasedOnConnection(true, () {}, () {});
        expect(testStore.showWidget, false);
        expect(testStore.control, Control.playReverse);
      });

      test("isNotConnected", () {
        testStore.attuneWidgetsBasedOnConnection(false, () {}, () {});
        expect(testStore.showWidget, false);
        expect(testStore.control, Control.play);
      });

      test("isConnected then isNotConnected", () {
        testStore.attuneWidgetsBasedOnConnection(true, () {}, () {});
        testStore.attuneWidgetsBasedOnConnection(false, () {}, () {});
        expect(testStore.showWidget, false);
        expect(testStore.control, Control.play);
      });
      test("isNotConnected then isConnected", () {
        testStore.attuneWidgetsBasedOnConnection(false, () {}, () {});
        testStore.attuneWidgetsBasedOnConnection(true, () {}, () {});
        expect(testStore.showWidget, false);
        expect(testStore.control, Control.playReverse);
      });
    });
  });
}
