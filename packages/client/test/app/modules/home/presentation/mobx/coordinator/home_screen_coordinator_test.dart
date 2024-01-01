import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

import '../../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockHomeScreenWidgetsCoordinator mockWidgets;
  late MockAddNameToDatabaseStore mockAddNameToDatabase;
  late MockGetCollaboratorPhraseStore mockGetCollaboratorPhrase;
  late MockGetExistingCollaborationsInfoStore mockGetExistingCollaborationInfo;
  late MockShareCollaborationInvitationStore shareCollaborationInvitation;
  late HomeScreenCoordinator testStore;

  setUp(() {
    mockWidgets = MockHomeScreenWidgetsCoordinator();
    shareCollaborationInvitation = MockShareCollaborationInvitationStore();
    mockGetExistingCollaborationInfo = MockGetExistingCollaborationsInfoStore();
    mockAddNameToDatabase = MockAddNameToDatabaseStore();
    mockGetCollaboratorPhrase = MockGetCollaboratorPhraseStore();
    testStore = HomeScreenCoordinator(
      shareCollaborationInvitation: shareCollaborationInvitation,
      widgets: mockWidgets,
      getExistingCollaborationInfo: mockGetExistingCollaborationInfo,
      addNameToDatabaseStore: mockAddNameToDatabase,
      getCollaboratorPhraseStore: mockGetCollaboratorPhrase,
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
