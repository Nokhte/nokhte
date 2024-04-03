import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/mobx/mobx.dart';
import '../../../../../shared/shared_mocks.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GradientTreeNodeStore>(),
])
void main() {
  late CollaborationHomeScreenWidgetsCoordinator testStore;

  setUp(() {
    testStore = CollaborationHomeScreenWidgetsCoordinator(
      primaryBeachWaves: BeachWavesStore(),
      secondaryBeachWaves: BeachWavesStore(),
      smartText: MockSmartTextStore(),
      wifiDisconnectOverlay: MockWifiDisconnectOverlayStore(),
      gestureCross: MockGestureCrossStore(),
      touchRipple: TouchRippleStore(),
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
    expect(testStore.primaryBeachWaves.movieMode,
        BeachWaveMovieModes.anyToOnShore);
    verify(testStore.gestureCross.setCollaborationHomeScreen());
    verify(
        testStore.smartText.setMessagesData(MessagesData.sessionSparkerList));
  });

  test("invitationFlowConstructor", () {
    fakeAsync((async) async {
      await testStore.invitationFlowConstructor();
      verify(testStore.smartText.startRotatingText());
    });
  });

  test("postInvitationFlowConstructor", () {
    fakeAsync((async) async {
      await testStore.postInvitationFlowConstructor();
      verify(testStore.smartText.setCurrentIndex(1));
      verify(testStore.smartText.startRotatingText());
    });
  });

  test("onNokhteSessionLinkOpened", () {
    testStore.primaryBeachWaves
        .setMovieMode(BeachWaveMovieModes.oceanDiveToTimesUp);
    testStore.onNokhteSessionLinkOpened();
    expect(testStore.primaryBeachWaves.movieMode,
        BeachWaveMovieModes.oceanDiveToVibrantBlueGradient);
    verify(testStore.gestureCross.toggleAll());
  });
}
