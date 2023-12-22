import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';

import '../../../../shared/shared_mocks.mocks.dart';

void main() {
  late MockBeachWavesStore beachWaves;
  late MockWifiDisconnectOverlayStore wifiDisconnectOverlay;
  late MockGestureCrossStore gestureCross;
  late MockSmartTextStore smartText;
  late HomeScreenWidgetsCoordinator testStore;
  late MockNokhteBlurStore nokhteBlurStore;
  late MockClockModelCoordinator mockClockModelCoordinator;

  setUp(() {
    mockClockModelCoordinator = MockClockModelCoordinator();
    beachWaves = MockBeachWavesStore();
    wifiDisconnectOverlay = MockWifiDisconnectOverlayStore();
    gestureCross = MockGestureCrossStore();
    nokhteBlurStore = MockNokhteBlurStore();
    smartText = MockSmartTextStore();

    testStore = HomeScreenWidgetsCoordinator(
      clockModelCoordinator: mockClockModelCoordinator,
      nokhteBlur: nokhteBlurStore,
      beachWaves: beachWaves,
      wifiDisconnectOverlay: wifiDisconnectOverlay,
      gestureCross: gestureCross,
      smartText: smartText,
    );
  });

  group("actions", () {
    test("constructor", () async {
      await testStore.constructor();
      verify(smartText.setMessagesData(MessagesData.firstTimeHomeList));
      verify(smartText.startRotatingText());
      verify(nokhteBlurStore.init());
      verify(beachWaves.setMovieMode(BeachWaveMovieModes.onShore));
      verify(wifiDisconnectOverlay.connectionReactor(
        onConnected: testStore.onConnected,
        onDisconnected: testStore.onDisconnected,
      ));
    });
  });
}
