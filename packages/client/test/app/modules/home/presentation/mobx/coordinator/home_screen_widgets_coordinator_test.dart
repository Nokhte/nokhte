import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';

import '../../../../shared/shared_mocks.mocks.dart';

void main() {
  late MockBeachWavesStore beachWaves;
  late MockWifiDisconnectOverlayStore wifiDisconnectOverlay;
  late MockGestureCrossStore gestureCross;
  late MockSmartTextStore primarySmartText;
  late MockSmartTextStore secondarySmartText;
  late HomeScreenWidgetsCoordinator testStore;
  late MockNokhteBlurStore nokhteBlurStore;
  late MockTimeAlignmentModelCoordinator mockTimeModel;
  setUp(() {
    mockTimeModel = MockTimeAlignmentModelCoordinator();
    secondarySmartText = MockSmartTextStore();
    beachWaves = MockBeachWavesStore();
    wifiDisconnectOverlay = MockWifiDisconnectOverlayStore();
    gestureCross = MockGestureCrossStore();
    nokhteBlurStore = MockNokhteBlurStore();
    primarySmartText = MockSmartTextStore();

    testStore = HomeScreenWidgetsCoordinator(
      timeModel: mockTimeModel,
      nokhteBlur: nokhteBlurStore,
      beachWaves: beachWaves,
      wifiDisconnectOverlay: wifiDisconnectOverlay,
      gestureCross: gestureCross,
      primarySmartText: primarySmartText,
      secondarySmartText: secondarySmartText,
    );
  });

  group("initial values", () {
    test("hasInitiatedBlur", () {
      expect(testStore.hasInitiatedBlur, false);
    });

    test("secondaryTextIsInProgress", () {
      expect(testStore.secondaryTextIsInProgress, false);
    });

    test("clockIsVisible", () {
      expect(testStore.clockIsVisible, false);
    });

    test("isDisconnected", () {
      expect(testStore.isDisconnected, false);
    });
  });

  group("actions", () {
    test("toggleSecondaryTextIsInProgress", () {
      testStore.toggleSecondaryTextIsInProgress();
      expect(testStore.secondaryTextIsInProgress, true);
      testStore.toggleSecondaryTextIsInProgress();
      expect(testStore.secondaryTextIsInProgress, false);
    });

    test("toggleClockIsVisible", () {
      testStore.toggleClockIsVisible();
      expect(testStore.clockIsVisible, true);
      testStore.toggleClockIsVisible();
      expect(testStore.clockIsVisible, false);
    });
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
      verify(primarySmartText.setMessagesData(MessagesData.firstTimeHomeList));
      verify(primarySmartText.startRotatingText());
      verify(beachWaves.setMovieMode(BeachWaveMovieModes.onShore));
      verify(wifiDisconnectOverlay.connectionReactor(
        onConnected: testStore.onConnected,
        onDisconnected: testStore.onDisconnected,
      ));
    });
  });
}
