import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' hide when;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/mobx/mobx.dart';
import '../../../../../shared/shared_mocks.mocks.dart';
import './collaboration_home_screen_widgets_coordinator_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GradientTreeNodeStore>(),
])
void main() {
  late CollaborationHomeScreenWidgetsCoordinator testStore;

  setUp(() {
    testStore = CollaborationHomeScreenWidgetsCoordinator(
      beachWaves: MockBeachWavesStore(),
      gradientTreeNode: MockGradientTreeNodeStore(),
      smartText: MockSmartTextStore(),
      wifiDisconnectOverlay: MockWifiDisconnectOverlayStore(),
      gestureCross: MockGestureCrossStore(),
    );
  });

  test("initial values", () {
    expect(testStore.invitationIsSent, false);
    expect(testStore.shouldEnterCollaboratorPool, false);
  });

  test(
      'toggleShouldEnterCollaboratorPool should toggle shouldEnterCollaboratorPool observable',
      () {
    testStore.toggleShouldEnterCollaboratorPool();
    expect(testStore.shouldEnterCollaboratorPool, true);
  });

  test('toggleInvitationIsSent should toggle invitationIsSent observable', () {
    testStore.toggleInvitationIsSent();
    expect(testStore.invitationIsSent, true);
  });

  test("constructor", () {
    testStore.constructor();
    verify(
        testStore.beachWaves.setMovieMode(BeachWaveMovieModes.staticOceanDive));
    verify(testStore.gestureCross.setCollaborationHomeScreen());
    verify(testStore.smartText
        .setMessagesData(MessagesData.firstTimeCollaborationList));
    verify(testStore.gradientTreeNode.setWidgetVisibility(false));
  });

  group("smartTextDependent", () {
    setUp(() {
      when(testStore.smartText.messagesData).thenReturn(
          ObservableList.of(MessagesData.firstTimeCollaborationList));
    });
    test("onResumed", () {
      testStore.onResumed();
      verify(testStore.smartText.reset());
      verify(testStore.smartText.startRotatingText());
    });

    test("onInactive", () {
      testStore.onInactive();
      verify(testStore.smartText.pause());
    });
  });

  test("invitationFlowConstructor", () {
    fakeAsync((async) async {
      await testStore.invitationFlowConstructor();
      verify(testStore.smartText.startRotatingText());
    });
  });

  // test("enterCollaboratorPoolConstructor", () {
  //   testStore.enterCollaboratorPoolConstructor();
  //   verify(testStore.gradientTreeNode.setWidgetVisibility(false));
  //   expect(testStore.shouldEnterCollaboratorPool, true);
  // });

  test("postInvitationFlowConstructor", () {
    fakeAsync((async) async {
      await testStore.postInvitationFlowConstructor();
      verify(testStore.smartText.setCurrentIndex(1));
      verify(testStore.smartText.startRotatingText());
    });
  });

  test("onNokhteSessionLinkOpened", () {
    when(testStore.beachWaves.currentStore)
        .thenAnswer((_) => OceanDiveToTimesUpStartMovieStore());
    testStore.onNokhteSessionLinkOpened();
    verify(testStore.beachWaves
        .setMovieMode(BeachWaveMovieModes.oceanDiveToVibrantBlueGradient));
    verify(testStore.gestureCross.toggleAll());
  });

  // test("initCollaboratorPoolWidgets", () {
  //   testStore.initCollaboratorPoolWidgets();
  //   expect(testStore.shouldEnterCollaboratorPool, true);
  //   verify(testStore.gradientTreeNode.initMovie(NoParams()));
  //   verify(testStore.gestureCross.toggleAll());
  // });

  test("onSwipeDown", () {
    when(testStore.beachWaves.currentStore)
        .thenAnswer((_) => OceanDiveToTimesUpStartMovieStore());
    testStore.onSwipeDown();
    verify(testStore.smartText.pause());
    verify(testStore.smartText.setWidgetVisibility(false));
    verify(testStore.gestureCross.initMoveAndRegenerate(CircleOffsets.bottom));
    verify(testStore.beachWaves
        .setMovieMode(BeachWaveMovieModes.oceanDiveToOnShore));
  });
}
