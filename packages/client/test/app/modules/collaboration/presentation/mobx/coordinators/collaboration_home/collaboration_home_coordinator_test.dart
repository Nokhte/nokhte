import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' hide when;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/data/data.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/deep_link_types.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
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
  MockSpec<EnterCollaboratorPoolStore>(),
])
void main() {
  late CollaborationHomeScreenCoordinator testStore;

  setUp(() {
    testStore = CollaborationHomeScreenCoordinator(
      widgets: MockCollaborationHomeScreenWidgetsCoordinator(),
      deepLinks: DeepLinksCoordinator(
        getDeepLinkURL: MockGetDeepLinkURLStore(),
        listenForOpenedDeepLink: MockListenForOpenedDeepLinkStore(),
        sendDeepLink: MockSendDeepLinkStore(),
      ),
      userInformation: UserInformationCoordinator(
        getUserInfo: MockGetUserInfoStore(),
        updateHasGoneThroughInvitationFlow:
            MockUpdateHasGoneThroughInvitationFlowStore(),
        updateHasSentAnInvitation: MockUpdateHasSentAnInvitationStore(),
        updateWantsToRepeatInvitationFlow:
            MockUpdateWantsToRepeatInvitationFlowStore(),
      ),
      swipe: SwipeDetector(),
      enterCollaboratorPool: MockEnterCollaboratorPoolStore(),
    );
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
      await testStore.constructor();
      verify(testStore.deepLinks.listenForOpenedDeepLink(NoParams()));
      expect(testStore.additionalRoutingData, {});
      verify(testStore.widgets.constructor());
      verify(testStore.widgets.initReactors(
        testStore.onGradientTreeNodeTap,
        testStore.onFlowCompleted,
        testStore.onEnterCollaboratorPool,
      ));
      verify(testStore.userInformation.getUserInfo(NoParams()));
      verify(testStore.deepLinks.getDeepLinkURL(
        const GetDeepLinkURLParams(type: DeepLinkTypes.collaboratorInvitation),
      ));
    });

    test("onFlowCompleted", () {
      testStore.onFlowCompleted();
      verify(
          testStore.userInformation.updateHasGoneThroughInvitationFlow(true));
    });

    test("onEnterCollaboratorPool", () {
      testStore.setAdditionalRoutingData({"collaboratorUID": "value"});
      testStore.onEnterCollaboratorPool();
      verify(testStore.enterCollaboratorPool(testStore
          .additionalRoutingData[CollaborationCodeKeys.collaboratorUID]));
    });

    test("onDeepLinkOpened", () {
      when(testStore.deepLinks.listenForOpenedDeepLink.additionalMetadata)
          .thenReturn(ObservableMap.of({}));
      testStore.onDeepLinkOpened("/collaboration/");
      verify(testStore.widgets.initCollaboratorPoolWidgets());
    });

    test("onInvitationShared", () {
      testStore.setAdditionalRoutingData({"collaboratorUID": "value"});
      testStore.onInvitationShared(true);
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
