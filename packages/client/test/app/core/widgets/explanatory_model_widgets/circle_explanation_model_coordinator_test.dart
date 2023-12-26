import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import './explanatory_model_widgets_mock_gen.mocks.dart';

void main() {
  late MockDumbGradientCircleStore userCircle;
  late MockDumbGradientCircleStore collaboratorCircle;
  late MockAccompanyingTextStore userText;
  late MockAccompanyingTextStore collaboratorText;
  late CircleExplanationModelCoordinator testStore;

  setUp(() {
    userCircle = MockDumbGradientCircleStore();
    collaboratorCircle = MockDumbGradientCircleStore();
    userText = MockAccompanyingTextStore();
    collaboratorText = MockAccompanyingTextStore();
    testStore = CircleExplanationModelCoordinator(
        collaboratorCircle: collaboratorCircle,
        collaboratorAccompanyingText: collaboratorText,
        userCircle: userCircle,
        userAccompanyingText: userText);
  });

  group("initial values", () {
    test("hasCompletedExplanation", () {
      expect(testStore.hasCompletedExplanation, false);
    });
  });

  group("actions", () {
    test("toggleAllWidgetVisibilites", () {
      testStore.toggleAllWidgetVisibilities();
      expect(userText.showWidget, false);
      expect(collaboratorText.showWidget, false);
      expect(userCircle.showWidget, false);
      expect(collaboratorCircle.showWidget, false);
    });

    test("toggleHasCompletedExplanation", () {
      testStore.toggleHasCompletedExplanation();
      expect(testStore.hasCompletedExplanation, true);
    });
  });
}
