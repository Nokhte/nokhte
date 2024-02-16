import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/domain/logic/logic.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import '../../../../../../core/mobx/base_coordinator_test.mocks.dart';
import '../../../../../home/fixtures/home_stack_mock_gen.mocks.dart';
import 'collaboration_home_coordinator_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CollaborationHomeScreenWidgetsCoordinator>(),
  MockSpec<UserInformationCoordinator>(),
  MockSpec<CollaborationLogicCoordinator>(),
  MockSpec<CaptureShareNokhteSessionInvitation>(),
])
void main() {
  late CollaborationHomeScreenCoordinator testStore;

  setUp(() {
    testStore = CollaborationHomeScreenCoordinator(
        captureScreen: MockCaptureScreen(),
        captureShareNokhteSessionInvitation:
            MockCaptureShareNokhteSessionInvitation(),
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

    test("onEnterCollaboratorPool", () {
      testStore.setAdditionalRoutingData({"collaboratorUID": "value"});
      testStore.onEnterCollaboratorPool();
      verify(testStore.logic.enter(const EnterCollaboratorPoolParams(
          collaboratorUID: "value",
          invitationType: InvitationType.nokhteSession)));
    });

    test("onSwipe", () {
      testStore.onSwipe(GestureDirections.down);
      expect(testStore.isNavigatingAway, true);
      verify(testStore.widgets.onSwipeDown());
      expect(testStore.disableAllTouchFeedback, true);
    });
  });
}
