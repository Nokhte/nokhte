import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../../../shared/shared_mocks.mocks.dart';
import '../../../../shared/shared_test_utils.dart';
import '../../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late BeachWavesStore beachWaves;
  late MockWifiDisconnectOverlayStore wifiDisconnectOverlay;
  late MockGestureCrossStore gestureCross;
  late SmartTextStore primarySmartText;
  late SmartTextStore secondarySmartText;
  late HomeScreenWidgetsCoordinator testStore;
  late NokhteBlurStore nokhteBlurStore;
  late TimeAlignmentModelCoordinator timeModel;

  prepForNavigationWasCalled() {
    verify(gestureCross.stopBlinking());
    expect(testStore.primarySmartText.showWidget, false);
    expect(testStore.timeModel.showWidget, false);
    expect(beachWaves.movieMode, BeachWaveMovieModes.onShoreToOceanDive);
    expect(beachWaves.movieStatus, MovieStatus.inProgress);
    expect(beachWaves.currentControl, Control.playFromStart);
    verify(gestureCross.initMoveAndRegenerate(CircleOffsets.top));
  }

  group('HomeScreenWidgetsCoordinator', () {
    setUp(() {
      timeModel = TimeAlignmentModelCoordinator(
        clockFace: ClockFaceStore(),
        availabilitySectors: AvailabilitySectorsStore(),
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
        deepLinks: DeepLinksCoordinator(
          getDeepLinkURL: MockGetDeepLinkURL(),
          listenForOpenedDeepLinkStore: MockListenForOpenedDeepLinkStore(),
          sendDeepLink: MockSendDeepLink(),
        ),
        beachWaves: beachWaves,
        wifiDisconnectOverlay: wifiDisconnectOverlay,
        gestureCross: gestureCross,
        primarySmartText: primarySmartText,
        secondarySmartText: secondarySmartText,
      );
    });

    group('Initial values', () {
      test('hasInitiatedBlur', () {
        expect(testStore.hasInitiatedBlur, false);
      });

      test('clockIsVisible', () {
        expect(testStore.clockIsVisible, false);
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
      test('toggleClockIsVisible', () {
        testStore.toggleClockIsVisible();
        expect(testStore.clockIsVisible, true);
        testStore.toggleClockIsVisible();
        expect(testStore.clockIsVisible, false);
      });

      test('onConnected', () {
        testStore.onConnected();
        expect(testStore.isDisconnected, false);
      });

      test('onDisconnected', () {
        testStore.onDisconnected();
        expect(testStore.isDisconnected, true);
      });

      test('Constructor', () async {
        await testStore.constructor();
        expect(primarySmartText.messagesData, MessagesData.firstTimeHomeList);
        expect(secondarySmartText.messagesData,
            MessagesData.firstTimeSecondaryHomeList);
        expect(beachWaves.movieMode, BeachWaveMovieModes.onShore);
      });

      test('InvitationFlowConstructor', () {
        testStore.constructor();
        testStore.invitationFlowConstructor();
        expect(primarySmartText.messagesData, MessagesData.firstTimeHomeList);
        expect(secondarySmartText.messagesData,
            MessagesData.firstTimeSecondaryHomeList);
        expect(beachWaves.movieMode, BeachWaveMovieModes.onShore);
      });

      test('PostInvitationFlowConstructor', () {
        testStore.constructor();
        testStore.postInvitationFlowConstructor();
        expect(primarySmartText.messagesData, MessagesData.firstTimeHomeList);
        expect(secondarySmartText.messagesData,
            MessagesData.firstTimeSecondaryHomeList);
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
          expect(nokhteBlurStore.control, Control.playReverseFromEnd);
          expect(testStore.hasInitiatedBlur, false);
        });

        test('OnInactive', () {
          primarySmartText.currentIndex = 2;
          testStore.onInactive();
          expect(primarySmartText.currentIndex, 0);
        });

        test("prepForNavigation", () {
          testStore.prepForNavigation();
          prepForNavigationWasCalled();
        });

        group("onSwipeUp", () {
          test('''primarySmartText.currentIndex.equals(4) &&
          !hasSwipedUp &&
          !hasCompletedInvitationFlow''', () {
            primarySmartText.setCurrentIndex(4);
            testStore.hasCompletedInvitationFlow = false;
            testStore.hasSwipedUp = false;
            testStore.onSwipeUp();
            prepForNavigationWasCalled();
          });

          test('!hasSwipedUp && hasCompletedInvitationFlow', () {
            testStore.hasSwipedUp = false;
            testStore.hasCompletedInvitationFlow = true;
            testStore.onSwipeUp();
            prepForNavigationWasCalled();
          });
        });

        test('OnAvailabilitySectorMovieStatusFinished', () {
          timeModel.availabilitySectors.setPastControl(Control.playFromStart);
          testStore
              .onAvailabilitySectorMovieStatusFinished(MovieStatus.finished);
          expect(timeModel.clockFace.control, Control.playReverseFromEnd);
          expect(secondarySmartText.control, Control.stop);
          expect(beachWaves.currentControl, Control.mirror);
          expect(testStore.secondarySmartText.showWidget, false);
          expect(nokhteBlurStore.control, Control.stop);
        });

        test('OnClockFaceAnimationFinished', () {
          fakeAsync((async) {
            testStore.onClockFaceAnimationFinished(MovieStatus.finished);
            async.elapse(Seconds.get(10));
            expect(secondarySmartText.control, Control.play);
            expect(testStore.clockIsVisible, true);
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

          test('If clockIsVisible && !secondaryTextIsInProgress', () {
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
  });
}
