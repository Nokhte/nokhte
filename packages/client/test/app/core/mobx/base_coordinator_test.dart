import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';

void main() {
  late BaseCoordinator testStore;

  setUp(() => testStore = BaseCoordinator());

  group("initial values", () {
    test("disableAllTouchFeedback", () {
      expect(testStore.disableAllTouchFeedback, false);
    });

    test("appState", () {
      expect(testStore.appState, AppLifecycleState.resumed);
    });
  });

  group("actions", () {
    test("toggleDisableAllTouchFeedback", () {
      testStore.toggleDisableAllTouchFeedback();
      expect(testStore.disableAllTouchFeedback, true);
    });

    test("setAppState", () {
      testStore.setAppState(AppLifecycleState.detached);
      expect(testStore.appState, AppLifecycleState.detached);
    });
  });
}
