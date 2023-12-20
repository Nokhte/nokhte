import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/home_screen_coordinator.dart';

import '../../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockHomeScreenWidgetsCoordinator mockWidgets;
  late SwipeDetector mockSwipe;
  late HoldDetector mockHold;
  late MockAddNameToDatabaseStore mockAddNameToDatabase;
  late MockGetCollaboratorPhraseStore mockGetCollaboratorPhrase;
  late MockGetExistingCollaborationsInfoStore mockGetExistingCollaborationInfo;
  late HomeScreenCoordinator testStore;

  setUp(() {
    mockWidgets = MockHomeScreenWidgetsCoordinator();
    mockGetExistingCollaborationInfo = MockGetExistingCollaborationsInfoStore();
    mockSwipe = SwipeDetector();
    mockHold = HoldDetector();
    mockAddNameToDatabase = MockAddNameToDatabaseStore();
    mockGetCollaboratorPhrase = MockGetCollaboratorPhraseStore();
    testStore = HomeScreenCoordinator(
      widgets: mockWidgets,
      swipe: mockSwipe,
      hold: mockHold,
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
