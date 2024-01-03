import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

import '../../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockAddNameToDatabaseStore mockAddNameToDatabase;
  late MockGetCollaboratorPhraseStore mockGetCollaboratorPhrase;
  late MockGetExistingCollaborationsInfoStore mockGetExistingCollaborationInfo;
  late MockGetInvitationURLStore mockGetInvitationURLStore;
  late MockGetUserInfoStore mockGetUserInfoStore;
  late MockShareCollaborationInvitationStore mockShareCollaborationInvitation;
  late MockHomeScreenWidgetsCoordinator mockWidgets;
  late MockUpdateHasGoneThroughInvitationFlowStore
      mockUpdateHasGoneThroughInvitationFlow;
  late MockUpdateHasSentAnInvitationStore mockUpdateHasSentAnInvitationStore;
  late HomeScreenCoordinator testStore;

  setUp(() {
    mockAddNameToDatabase = MockAddNameToDatabaseStore();
    mockGetCollaboratorPhrase = MockGetCollaboratorPhraseStore();
    mockGetExistingCollaborationInfo = MockGetExistingCollaborationsInfoStore();
    mockGetInvitationURLStore = MockGetInvitationURLStore();
    mockGetUserInfoStore = MockGetUserInfoStore();
    mockShareCollaborationInvitation = MockShareCollaborationInvitationStore();
    mockWidgets = MockHomeScreenWidgetsCoordinator();
    mockUpdateHasGoneThroughInvitationFlow =
        MockUpdateHasGoneThroughInvitationFlowStore();
    mockUpdateHasSentAnInvitationStore = MockUpdateHasSentAnInvitationStore();

    testStore = HomeScreenCoordinator(
      addNameToDatabaseStore: mockAddNameToDatabase,
      getInvitationURL: mockGetInvitationURLStore,
      getUserInfo: mockGetUserInfoStore,
      getExistingCollaborationInfo: mockGetExistingCollaborationInfo,
      getCollaboratorPhraseStore: mockGetCollaboratorPhrase,
      shareCollaborationInvitation: mockShareCollaborationInvitation,
      updateHasGoneThroughInvitationFlow:
          mockUpdateHasGoneThroughInvitationFlow,
      updateHasSentAnInvitation: mockUpdateHasSentAnInvitationStore,
      widgets: mockWidgets,
    );
  });

  group("actions", () {
    test("constructor", () async {
      await testStore.constructor();
      verify(mockWidgets.constructor());
      verify(mockGetExistingCollaborationInfo(NoParams()));
      verify(mockAddNameToDatabase(NoParams()));
      verify(mockGetCollaboratorPhrase(NoParams()));
    });
  });
}
