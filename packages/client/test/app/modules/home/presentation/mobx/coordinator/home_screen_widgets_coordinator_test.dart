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
  late MockTimeAlignmentModelCoordinator mockTimeModel;
  late MockCircleExplanationModelCoordinator circleModel;
  setUp(() {
    circleModel = MockCircleExplanationModelCoordinator();
    mockTimeModel = MockTimeAlignmentModelCoordinator();
    beachWaves = MockBeachWavesStore();
    wifiDisconnectOverlay = MockWifiDisconnectOverlayStore();
    gestureCross = MockGestureCrossStore();
    nokhteBlurStore = MockNokhteBlurStore();
    smartText = MockSmartTextStore();

    testStore = HomeScreenWidgetsCoordinator(
      circleModel: circleModel,
      timeModel: mockTimeModel,
      nokhteBlur: nokhteBlurStore,
      beachWaves: beachWaves,
      wifiDisconnectOverlay: wifiDisconnectOverlay,
      gestureCross: gestureCross,
      smartText: smartText,
    );
  });

  group("initial values", () {
    test("hasInitiatedBlur", () {
      expect(testStore.hasInitiatedBlur, false);
    });

    test("isDisconnected", () {
      expect(testStore.isDisconnected, false);
    });
  });

  group("actions", () {
    test("onConnected", () {
      testStore.onConnected();
      expect(testStore.isDisconnected, false);
    });

    test("onDisconnected", () {
      testStore.onDisconnected();
      expect(testStore.isDisconnected, true);
    });
    test("constructor", () async {
      await testStore.constructor();
      verify(smartText.setMessagesData(MessagesData.firstTimeHomeList));
      verify(smartText.startRotatingText());
      verify(beachWaves.setMovieMode(BeachWaveMovieModes.onShore));
      verify(circleModel.constructor());
      verify(wifiDisconnectOverlay.connectionReactor(
        onConnected: testStore.onConnected,
        onDisconnected: testStore.onDisconnected,
      ));
    });
  });
}
