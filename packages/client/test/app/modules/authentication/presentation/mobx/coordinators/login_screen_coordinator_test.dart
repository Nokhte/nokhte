import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import '../../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  late MockLoginScreenWidgetsCoordinator mockWidgetsStore;
  late MockSignInWithAuthProviderStore mockAuthProviderStore;
  late MockGetAuthStateStore mockAuthStateStore;
  late SwipeDetector mockSwipeDetector;
  late TapDetector mockTapDetector;
  late LoginScreenCoordinator testStore;
  const tCoordinates = Offset(1, 1);

  setUp(() {
    mockWidgetsStore = MockLoginScreenWidgetsCoordinator();
    mockAuthStateStore = MockGetAuthStateStore();
    mockAuthProviderStore = MockSignInWithAuthProviderStore();
    mockSwipeDetector = SwipeDetector();
    mockTapDetector = TapDetector();
    testStore = LoginScreenCoordinator(
      widgets: mockWidgetsStore,
      signInWithAuthProvider: mockAuthProviderStore,
      authStateStore: mockAuthStateStore,
      tap: mockTapDetector,
      swipe: mockSwipeDetector,
    );
  });

  group("initial values", () {
    test("authProvider", () {
      expect(testStore.authProvider, AuthProvider.apple);
    });
  });

  group("actions", () {
    test("screenConstructor", () {
      testStore.screenConstructor(tCoordinates);
      verify(mockWidgetsStore.constructor(tCoordinates));
    });

    test("logTheUserIn", () {
      testStore.logTheUserIn(AuthProvider.apple);
      verify(
          mockAuthProviderStore.routeAuthProviderRequest(AuthProvider.apple));
    });
  });

  group("reactors", () {
    test("swipeReactor", () {
      testStore.swipeReactor();
      mockSwipeDetector.setDirectionsType(GestureDirections.up);
      verifyNever(testStore.logTheUserIn(AuthProvider.apple));
    });

    test("tapReactor", () {
      testStore.tapReactor();
      mockTapDetector.tapCount++;
      verify(mockWidgetsStore.onTap(Offset.zero));
    });
  });
}
