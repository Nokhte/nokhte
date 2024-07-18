import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';

mixin SwipeNavigationUtils {
  final _swipeDirection = Observable(GestureDirections.initial);

  bool hasSwiped() => _swipeDirection.value != GestureDirections.initial;

  GestureDirections get swipeDirection => _swipeDirection.value;

  _setSwipeDirection(GestureDirections value) => _swipeDirection.value = value;

  Action actionSetSwipeDirection = Action(() {});

  initSwipeNavigationUtils() {
    actionSetSwipeDirection = Action(_setSwipeDirection);
  }

  setSwipeDirection(GestureDirections value) {
    actionSetSwipeDirection([value]);
  }
}
