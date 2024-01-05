import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../../../../core/widgets/wifi_disconnect_overlay/wifi_disconnect_mocks.mocks.dart';
import '../../../../shared/shared_mocks.mocks.dart';
import '../../../../shared/shared_test_utils.dart';

void main() {
  late BeachWavesStore beachWaves;
  late MockWifiDisconnectOverlayStore wifiDisconnectOverlay;
  late MockGestureCrossStore gestureCross;
  late SmartTextStore primarySmartText;
  late SmartTextStore secondarySmartText;
  late HomeScreenWidgetsCoordinator testStore;
  late NokhteBlurStore nokhteBlurStore;
  late TimeAlignmentModelCoordinator timeModel;
  late MockGetOnConnectivityChangedStore mockConnectivity;
  setUp(() {
    mockConnectivity = MockGetOnConnectivityChangedStore();
    timeModel = TimeAlignmentModelCoordinator(
      clockFace: ClockFaceStore(),
      availabilitySectors: AvailabilitySectorsStore(
        connectivity: mockConnectivity,
      ),
    );
    secondarySmartText = SmartTextStore();
    beachWaves = SharedTestUtils.getBeachWaves();
    wifiDisconnectOverlay = MockWifiDisconnectOverlayStore();
    gestureCross = MockGestureCrossStore();
    nokhteBlurStore = NokhteBlurStore();
    primarySmartText = SmartTextStore();

    testStore = HomeScreenWidgetsCoordinator(
      timeModel: timeModel,
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

    test("clockIsVisible", () {
      expect(testStore.clockIsVisible, false);
    });

    test("isDisconnected", () {
      expect(testStore.isDisconnected, false);
    });
  });

  group("actions", () {
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
      expect(primarySmartText.messagesData, MessagesData.firstTimeHomeList);
      expect(secondarySmartText.messagesData,
          MessagesData.firstTimeSecondaryHomeList);
      expect(beachWaves.movieMode, BeachWaveMovieModes.onShore);
    });

    test("invitationFlowConstructor", () {
      testStore.constructor();
      testStore.invitationFlowConstructor();
      expect(primarySmartText.messagesData, MessagesData.firstTimeHomeList);
      expect(secondarySmartText.messagesData,
          MessagesData.firstTimeSecondaryHomeList);
      expect(beachWaves.movieMode, BeachWaveMovieModes.onShore);
    });

    test("postInvitationFlowConstuctor", () {
      testStore.constructor();
      testStore.postInvitationFlowConstructor();
      expect(primarySmartText.messagesData, MessagesData.firstTimeHomeList);
      expect(secondarySmartText.messagesData,
          MessagesData.firstTimeSecondaryHomeList);
      expect(beachWaves.movieMode, BeachWaveMovieModes.onShore);
    });

    group("constructor dependendent", () {
      setUp(() => testStore.constructor());

      test("onResumed", () {
        testStore.toggleHasInitiatedBlur();
        testStore.onResumed();
        expect(primarySmartText.isPaused, false);
        expect(beachWaves.currentControl, Control.mirror);
        expect(nokhteBlurStore.control, Control.playReverseFromEnd);
        expect(testStore.hasInitiatedBlur, false);
      });

      test("onInactive", () {
        primarySmartText.currentIndex = 2;
        testStore.onInactive();
        expect(primarySmartText.currentIndex, 0);
      });
      test("onAvailabilitySectorMovieStatusFinished", () {
        timeModel.availabilitySectors.setPastControl(Control.playFromStart);
        testStore.onAvailabilitySectorMovieStatusFinished(MovieStatus.finished);
        expect(timeModel.clockFace.control, Control.playReverseFromEnd);
        expect(secondarySmartText.control, Control.stop);
        expect(beachWaves.currentControl, Control.mirror);
        expect(testStore.secondarySmartText.showWidget, false);
        expect(nokhteBlurStore.control, Control.stop);
      });

      test("onClockFaceAnimationFinished", () {
        fakeAsync((async) {
          testStore.onClockFaceAnimationFinished(MovieStatus.finished);
          async.elapse(Seconds.get(10));
          expect(secondarySmartText.control, Control.play);
          expect(testStore.clockIsVisible, true);
        });
      });
      group("onGestureCrossTap", () {
        test("if !isDisconnected + !hasInitiatedBlur", () {
          fakeAsync((async) async {
            await testStore.onGestureCrossTap(() {});
            async.elapse(Seconds.get(10));
            expect(nokhteBlurStore.control, Control.playFromStart);
            expect(primarySmartText.control, Control.playFromStart);
            expect(beachWaves.currentControl, Control.playFromStart);
          });
        });
        test("if clockIsVisible && !secondaryTextIsInProgress", () {
          testStore.toggleClockIsVisible();
          fakeAsync((async) async {
            await testStore.onGestureCrossTap(() {});
            async.elapse(Seconds.get(10));
            expect(secondarySmartText.control, Control.playReverse);
          });
        });
      });
    });
  });
}
