import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' hide when;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/data/data.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/deep_link_types.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import '../../../../../home/fixtures/home_stack_mock_gen.mocks.dart';
import 'collaboration_home_coordinator_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CollaborationHomeScreenWidgetsCoordinator>(),
  MockSpec<UserInformationCoordinator>(),
  MockSpec<CollaborationLogicCoordinator>(),
])
void main() {
  late CollaborationHomeScreenCoordinator testStore;

  setUp(() {
    testStore = CollaborationHomeScreenCoordinator(
        widgets: MockCollaborationHomeScreenWidgetsCoordinator(),
        deepLinks: DeepLinksCoordinator(
          getDeepLinkUrlLogic: MockGetDeepLinkURL(),
          listenForOpenedDeepLinkStore: MockListenForOpenedDeepLinkStore(),
          sendDeepLinkLogic: MockSendDeepLink(),
        ),
        userInformation: UserInformationCoordinator(
          getUserInfoStore: MockGetUserInfoStore(),
          updateHasGoneThroughInvitationFlowLogic:
              MockUpdateHasGoneThroughInvitationFlow(),
          updateHasSentAnInvitationLogic: MockUpdateHasSentAnInvitation(),
          updateWantsToRepeatInvitationFlowLogic:
              MockUpdateWantsToRepeatInvitationFlow(),
        ),
        swipe: SwipeDetector(),
        logic: MockCollaborationLogicCoordinator());
  });

  group("actions", () {
    test("setAdditionalRoutingData", () {
      testStore.setAdditionalRoutingData({"key": "value"});
      expect(testStore.additionalRoutingData, {"key": "value"});
    });

    test("toggleIsNavigatingAway", () {
      testStore.toggleIsNavigatingAway();
      expect(testStore.isNavigatingAway, true);
    });

    test("constructor", () async {
      when(testStore.deepLinks
          .getDeepLink(DeepLinkTypes.collaboratorInvitation));
      await testStore.constructor();
      verify(testStore.deepLinks.listenForOpenedDeepLinkStore(NoParams()));
      expect(testStore.additionalRoutingData, {});
      verify(testStore.widgets.constructor());
      verify(testStore.widgets.initReactors(
        testStore.onGradientTreeNodeTap,
        testStore.onFlowCompleted,
        testStore.onEnterCollaboratorPool,
      ));
      verify(testStore.userInformation.getUserInfoStore(NoParams()));
      verify(testStore.deepLinks
          .getDeepLink(DeepLinkTypes.collaboratorInvitation));
    });

    test("onEnterCollaboratorPool", () {
      testStore.setAdditionalRoutingData({"collaboratorUID": "value"});
      testStore.onEnterCollaboratorPool();
      verify(testStore.logic.enter(testStore
          .additionalRoutingData[CollaborationCodeKeys.collaboratorUID]));
    });

    test("onDeepLinkOpened", () {
      when(testStore.deepLinks.listenForOpenedDeepLinkStore.additionalMetadata)
          .thenReturn(ObservableMap.of({}));
      testStore.onDeepLinkOpened("/collaboration/");
      verify(testStore.widgets.initCollaboratorPoolWidgets());
    });

    test("onSwipe", () {
      testStore.onSwipe(GestureDirections.down);
      expect(testStore.isNavigatingAway, true);
      verify(testStore.widgets.onSwipeDown());
      expect(testStore.disableAllTouchFeedback, true);
    });
  });
}
