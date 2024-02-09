import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../../../shared/shared_mocks.mocks.dart';
import '../../../../shared/shared_test_utils.dart';

void main() {
  late BeachWavesStore beachWaves;
  late MockWifiDisconnectOverlayStore wifiDisconnectOverlay;
  late MockGestureCrossStore gestureCross;
  late SmartTextStore primarySmartText;
  late HomeScreenWidgetsCoordinator testStore;
  late NokhteBlurStore nokhteBlurStore;

  group('HomeScreenWidgetsCoordinator', () {
    setUp(() {
      beachWaves = SharedTestUtils.getBeachWaves();
      wifiDisconnectOverlay = MockWifiDisconnectOverlayStore();
      gestureCross = MockGestureCrossStore();
      nokhteBlurStore = NokhteBlurStore();
      primarySmartText = SmartTextStore();

      testStore = HomeScreenWidgetsCoordinator(
        nokhteBlur: nokhteBlurStore,
        beachWaves: beachWaves,
        wifiDisconnectOverlay: wifiDisconnectOverlay,
        gestureCross: gestureCross,
        primarySmartText: primarySmartText,
      );
    });

    group('Initial values', () {
      test('hasInitiatedBlur', () {
        expect(testStore.hasInitiatedBlur, false);
      });

      test('isDisconnected', () {
        expect(testStore.isDisconnected, false);
      });
    });

    group('Actions', () {
      test("toggleWantsToRepeatInvitationFlow", () {
        testStore.toggleWantsToRepeatInvitationFlow();
        expect(testStore.wantsToRepeatInvitationFlow, true);
      });

      test("toggleHasCompletedInvitationFlow", () {
        testStore.toggleHasCompletedInvitationFlow();
        expect(testStore.hasCompletedInvitationFlow, true);
      });

      test("toggleGracePeriodHasExpired", () {
        testStore.toggleGracePeriodHasExpired();
        expect(testStore.gracePeriodHasExpired, true);
      });

      test('Constructor', () async {
        await testStore.constructor();
        expect(primarySmartText.messagesData, MessagesData.firstTimeHomeList);
        expect(beachWaves.movieMode, BeachWaveMovieModes.onShore);
      });

      test('InvitationFlowConstructor', () {
        testStore.constructor();
        testStore.invitationFlowConstructor();
        expect(primarySmartText.messagesData, MessagesData.firstTimeHomeList);
        expect(beachWaves.movieMode, BeachWaveMovieModes.onShore);
      });

      test('PostInvitationFlowConstructor', () {
        testStore.constructor();
        testStore.postInvitationFlowConstructor(hasDoneASession: false);
        expect(primarySmartText.messagesData, MessagesData.firstTimeHomeList);
        expect(beachWaves.movieMode, BeachWaveMovieModes.onShore);
      });

      group('Constructor dependent', () {
        setUp(() {
          testStore.constructor();
          beachWaves.setCurrentAnimationValues([1.0]);
        });

        test('OnResumed', () {
          testStore.toggleHasInitiatedBlur();
          testStore.onResumed();
          expect(primarySmartText.isPaused, false);
          expect(beachWaves.currentControl, Control.mirror);
          expect(nokhteBlurStore.control, Control.stop);
          expect(testStore.hasInitiatedBlur, true);
        });

        test('OnInactive', () {
          primarySmartText.currentIndex = 2;
          testStore.onInactive();
          expect(primarySmartText.currentIndex, 0);
        });

        test("prepForNavigation", () {
          testStore.prepForNavigation();
          verify(gestureCross.stopBlinking());
          expect(testStore.primarySmartText.showWidget, false);
          expect(beachWaves.movieMode, BeachWaveMovieModes.onShoreToOceanDive);
          expect(beachWaves.movieStatus, MovieStatus.idle);
          expect(beachWaves.currentControl, Control.playFromStart);
          verify(gestureCross.initMoveAndRegenerate(CircleOffsets.top));
        });

        group("onSwipeUp", () {
          test('''primarySmartText.currentIndex.equals(1) &&
          !hasSwipedUp &&
          !hasCompletedInvitationFlow''', () {
            primarySmartText.setCurrentIndex(1);
            testStore.hasCompletedInvitationFlow = false;
            testStore.hasSwipedUp = false;
            testStore.onSwipeUp();
            verify(gestureCross.stopBlinking());
            expect(testStore.primarySmartText.showWidget, true);
            expect(
                beachWaves.movieMode, BeachWaveMovieModes.onShoreToOceanDive);
            expect(beachWaves.movieStatus, MovieStatus.idle);
            expect(beachWaves.currentControl, Control.playFromStart);
            verify(gestureCross.initMoveAndRegenerate(CircleOffsets.top));
          });

          test('!hasSwipedUp && hasCompletedInvitationFlow', () {
            testStore.hasSwipedUp = false;
            testStore.hasCompletedInvitationFlow = true;
            testStore.onSwipeUp();
            verify(gestureCross.stopBlinking());
            expect(testStore.primarySmartText.showWidget, false);
            expect(
                beachWaves.movieMode, BeachWaveMovieModes.onShoreToOceanDive);
            expect(beachWaves.movieStatus, MovieStatus.idle);
            expect(beachWaves.currentControl, Control.playFromStart);
            verify(gestureCross.initMoveAndRegenerate(CircleOffsets.top));
          });
        });

        group('OnGestureCrossTap', () {
          test('If !isDisconnected + !hasInitiatedBlur', () {
            fakeAsync((async) async {
              await testStore.onGestureCrossTap(() {});
              async.elapse(Seconds.get(10));
              expect(nokhteBlurStore.control, Control.playFromStart);
              expect(primarySmartText.control, Control.playFromStart);
              expect(beachWaves.currentControl, Control.playFromStart);
            });
          });
        });
      });
    });
  });
}
