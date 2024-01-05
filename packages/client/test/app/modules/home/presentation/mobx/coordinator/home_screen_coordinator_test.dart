import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

import '../../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockAddNameToDatabaseStore mockAddNameToDatabase;
  late MockGetCollaboratorPhraseStore mockGetCollaboratorPhrase;
  late MockGetExistingCollaborationsInfoStore mockGetExistingCollaborationInfo;
  late MockHomeScreenWidgetsCoordinator mockWidgets;
  late HomeScreenCoordinator testStore;
  late UserInformationCoordinator mockUserInformation;

  setUp(() {
    mockAddNameToDatabase = MockAddNameToDatabaseStore();
    mockGetCollaboratorPhrase = MockGetCollaboratorPhraseStore();
    mockGetExistingCollaborationInfo = MockGetExistingCollaborationsInfoStore();
    mockWidgets = MockHomeScreenWidgetsCoordinator();
    mockUserInformation = UserInformationCoordinator(
      getUserInfo: MockGetUserInfoStore(),
      updateHasGoneThroughInvitationFlow:
          MockUpdateHasGoneThroughInvitationFlowStore(),
      updateHasSentAnInvitation: MockUpdateHasSentAnInvitationStore(),
    );

    testStore = HomeScreenCoordinator(
      swipe: SwipeDetector(),
      addNameToDatabaseStore: mockAddNameToDatabase,
      getExistingCollaborationInfo: mockGetExistingCollaborationInfo,
      getCollaboratorPhraseStore: mockGetCollaboratorPhrase,
      userInformation: mockUserInformation,
      widgets: mockWidgets,
    );
  });

  group("actions", () {
    test("constructor", () async {
      when(mockUserInformation.getUserInfo.hasGoneThroughInvitationFlow)
          .thenAnswer((_) => false);
      await testStore.constructor();
      verify(mockWidgets.constructor());
      verify(mockGetExistingCollaborationInfo(NoParams()));
      verify(testStore.userInformation.getUserInfo(NoParams()));
      verify(testStore.widgets.invitationFlowConstructor());
      verify(mockAddNameToDatabase(NoParams()));
      verify(mockGetCollaboratorPhrase(NoParams()));
    });
  });
}
