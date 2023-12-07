import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/coordinator/login_screen_coordinator.dart';

import '../../../../shared/shared_mocks.mocks.dart';
import '../../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  late MockBeachWavesStore mockBeachWavesStore;
  late MockSmartTextStore mockSmartTextStore;
  late MockAuthProviderStore mockAuthProviderStore;
  late MockAuthStateStore mockAuthStateStore;
  late SwipeDetector mockSwipeDetector;
  late TapDetector mockTapDetector;
  late LoginScreenCoordinator testStore;

  setUp(() {
    mockBeachWavesStore = MockBeachWavesStore();
    mockSmartTextStore = MockSmartTextStore();
    mockAuthStateStore = MockAuthStateStore();
    mockAuthProviderStore = MockAuthProviderStore();
    mockSwipeDetector = SwipeDetector();
    mockTapDetector = TapDetector();
    testStore = LoginScreenCoordinator(
      authProviderStore: mockAuthProviderStore,
      smartTextStore: mockSmartTextStore,
      beachWaves: mockBeachWavesStore,
      authStateStore: mockAuthStateStore,
      tap: mockTapDetector,
      swipe: mockSwipeDetector,
    );
  });

  group("initial values", () {
    test("authProvider", () {
      expect(testStore.authProvider, AuthProvider.apple);
    });
    test("hasNotMadeTheDot", () {
      expect(testStore.hasNotMadeTheDot, true);
    });
  });

  group("actions", () {
    test("toggleHasMadeTheDot", () {
      testStore.toggleHasMadeTheDot();
      expect(testStore.hasNotMadeTheDot, false);
    });

    test("screenConstructor", () {
      testStore.screenConstructor();
      verify(mockSmartTextStore.setMessagesData(MessagesData.loginList));
      verify(mockSmartTextStore.startRotatingText());
    });

    test("logTheUserIn", () {
      testStore.logTheUserIn(AuthProvider.apple);
      verify(
          mockAuthProviderStore.routeAuthProviderRequest(AuthProvider.apple));
    });
  });

  group("listeners", () {
    test("gestureListener", () {
      testStore.gestureListener();
      mockSwipeDetector.setDirectionsType(GestureDirections.up);
      verifyNever(testStore.logTheUserIn(AuthProvider.apple));
    });

    test("tapListener", () {
      testStore.tapListener();
      mockTapDetector.tapCount++;
      verifyNever(mockSmartTextStore.startRotatingText());
    });
  });
}
