// ignore_for_file: unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/coordinators/coordinators.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

import '../../../../shared/shared_mocks.mocks.dart';
import '../../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockAddNameToDatabaseStore mockAddNameToDatabase;
  late MockGetExistingCollaborationsInfoStore mockGetExistingCollaborationInfo;
  late HomeScreenWidgetsCoordinator mockWidgets;
  late HomeScreenCoordinator testStore;
  late UserInformationCoordinator mockUserInformation;
  late MockDeepLinksCoordinator mockDeepLinks;
  late MockDeleteUnconsecratedCollaborationsCoordinator mockDelete;
  late BeachWavesStore beachWaves;
  late MockWifiDisconnectOverlayStore wifiDisconnectOverlay;
  late MockGestureCrossStore gestureCross;
  late SmartTextStore primarySmartText;
  late SmartTextStore secondarySmartText;
  late HomeScreenWidgetsCoordinator widgetsStoreStore;
  late NokhteBlurStore nokhteBlurStore;
  late TimeAlignmentModelCoordinator timeModel;

  setUp(() {
    mockAddNameToDatabase = MockAddNameToDatabaseStore();
    mockDelete = MockDeleteUnconsecratedCollaborationsCoordinator();
    mockDeepLinks = MockDeepLinksCoordinator();
    mockGetExistingCollaborationInfo = MockGetExistingCollaborationsInfoStore();
    timeModel = TimeAlignmentModelCoordinator(
      clockFace: ClockFaceStore(),
      availabilitySectors: AvailabilitySectorsStore(),
    );
    secondarySmartText = SmartTextStore();
    beachWaves = BeachWavesStore();
    wifiDisconnectOverlay = MockWifiDisconnectOverlayStore();
    gestureCross = MockGestureCrossStore();
    nokhteBlurStore = NokhteBlurStore();
    primarySmartText = SmartTextStore();
    mockWidgets = HomeScreenWidgetsCoordinator(
      timeModel: timeModel,
      nokhteBlur: nokhteBlurStore,
      deepLinks: DeepLinksCoordinator(
        getDeepLinkUrlLogic: MockGetDeepLinkURL(),
        listenForOpenedDeepLinkStore: MockListenForOpenedDeepLinkStore(),
        sendDeepLinkLogic: MockSendDeepLink(),
      ),
      beachWaves: beachWaves,
      wifiDisconnectOverlay: wifiDisconnectOverlay,
      gestureCross: gestureCross,
      primarySmartText: primarySmartText,
      secondarySmartText: secondarySmartText,
    );
    mockUserInformation = UserInformationCoordinator(
      getUserInfoStore: MockGetUserInfoStore(),
      updateHasGoneThroughInvitationFlowLogic:
          MockUpdateHasGoneThroughInvitationFlow(),
      updateHasSentAnInvitationLogic: MockUpdateHasSentAnInvitation(),
      updateWantsToRepeatInvitationFlowLogic:
          MockUpdateWantsToRepeatInvitationFlow(),
    );

    testStore = HomeScreenCoordinator(
      deleteUnconsecratedCollaborations: mockDelete,
      swipe: SwipeDetector(),
      addNameToDatabaseStore: mockAddNameToDatabase,
      getExistingCollaborationInfo: mockGetExistingCollaborationInfo,
      userInformation: mockUserInformation,
      widgets: mockWidgets,
    );
  });

  group('constructor', () {
    test("hasGoneThroughInvitationFlow", () async {
      when(mockUserInformation.getUserInfoStore.hasGoneThroughInvitationFlow)
          .thenAnswer((realInvocation) => true);
      await testStore.constructor();
      verify(testStore.deleteUnconsecratedCollaborations(NoParams()));
      verify(mockUserInformation.getUserInfoStore(NoParams()));
      verify(mockGetExistingCollaborationInfo(NoParams()));
      verify(mockAddNameToDatabase(NoParams()));
    });

    test("!hasGoneThroughInvitationFlow", () async {
      when(mockUserInformation.getUserInfoStore.hasGoneThroughInvitationFlow)
          .thenAnswer((realInvocation) => false);
      await testStore.constructor();
      verify(testStore.deleteUnconsecratedCollaborations(NoParams()));
      verify(mockUserInformation.getUserInfoStore(NoParams()));
      verify(mockGetExistingCollaborationInfo(NoParams()));
      verify(mockAddNameToDatabase(NoParams()));
    });
  });
}
