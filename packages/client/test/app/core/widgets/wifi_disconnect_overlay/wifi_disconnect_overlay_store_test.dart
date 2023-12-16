import 'package:fake_async/fake_async.dart';
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

    test("disconnectedStopwatch", () {
      expect(testStore.disconnectedStopwatch.elapsedMilliseconds, 0);
    });

    test("rippleCount", () {
      expect(testStore.rippleCount, 0);
    });

    test("showWidget", () {
      expect(testStore.showWidget, false);
    });
  });

  group("actions", () {
    group("attuneWidgetsBasedOnConnection", () {
      test("isConnected", () {
        testStore.attuneWidgetsBasedOnConnection(true, () {}, () {});
        expect(testStore.showWidget, false);
        expect(testStore.control, Control.playReverse);
      });
      test("isNotConnected", () {
        testStore.attuneWidgetsBasedOnConnection(false, () {}, () {});
        expect(testStore.showWidget, false);
        expect(testStore.disconnectedStopwatch.isRunning, true);
        expect(testStore.movieMode, WifiDisconnectMovieModes.placeTheCircle);
        expect(testStore.control, Control.playFromStart);
        expect(testStore.movieStatus, MovieStatus.inProgress);
      });

      test("isNotConnected for 2 seconds then isConnected", () {
        fakeAsync((async) async {
          await testStore.attuneWidgetsBasedOnConnection(false, () {}, () {});
          async.elapse(Seconds.get(2));
          await testStore.attuneWidgetsBasedOnConnection(true, () {}, () {});
          expect(testStore.control, Control.playReverse);
          expect(testStore.movieMode, WifiDisconnectMovieModes.rippleLoop);
          expect(testStore.movieStatus, MovieStatus.inProgress);
        });
      });

      test("isNotConnected for less than 1 second then isConnected", () {
        fakeAsync((async) async {
          await testStore.attuneWidgetsBasedOnConnection(false, () {}, () {});
          async.elapse(Seconds.get(0, milli: 500));
          await testStore.attuneWidgetsBasedOnConnection(true, () {}, () {});
          expect(testStore.control, Control.playReverse);
          expect(testStore.movieMode, WifiDisconnectMovieModes.placeTheCircle);
          expect(testStore.movieStatus, MovieStatus.inProgress);
        });
      });
    });

    test("initPlaceTheCircle", () {
      testStore.initPlaceTheCircle();
      expect(testStore.movieStatus, MovieStatus.inProgress);
      expect(testStore.movie.duration, Seconds.get(2));
      expect(testStore.control, Control.playFromStart);
      expect(testStore.movieMode, WifiDisconnectMovieModes.placeTheCircle);
    });
    test("initLoopMovie", () {
      testStore.initLoopMovie();
      expect(testStore.movieStatus, MovieStatus.inProgress);
      expect(testStore.movie.duration, Seconds.get(4));
      expect(testStore.control, Control.playFromStart);
      expect(testStore.movieMode, WifiDisconnectMovieModes.rippleLoop);
    });
    test("initRemovetheCircle", () {
      testStore.initRemoveTheCircle();
      expect(testStore.movieStatus, MovieStatus.inProgress);
      expect(testStore.movie.duration, Seconds.get(2, milli: 500));
      expect(testStore.control, Control.playFromStart);
      expect(testStore.movieMode, WifiDisconnectMovieModes.removeTheCircle);
    });

    test("incrementRippleCount", () {
      testStore.incrementRippleCount();
      testStore.incrementRippleCount();
      expect(testStore.rippleCount, 2);
    });

    test("resetRippleCount", () {
      testStore.incrementRippleCount();
      testStore.resetRippleCount();
      expect(testStore.rippleCount, 0);
    });
  });
}
