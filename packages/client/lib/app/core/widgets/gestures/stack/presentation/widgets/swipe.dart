import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/gestures/stack/presentation/mobx/swipe_detector.dart';

class Swipe extends StatelessWidget {
  final SwipeDetector store;
  final Widget child;
  const Swipe({
    super.key,
    required this.store,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => store.onUpdateCallback(
        details.globalPosition,
        DragType.horizontal,
      ),
      onHorizontalDragEnd: (details) => store.onFinishedGestureCallback(),
      onVerticalDragUpdate: (details) => store.onUpdateCallback(
        details.globalPosition,
        DragType.vertical,
      ),
      onVerticalDragEnd: (details) => store.onFinishedGestureCallback(),
      child: child,
    );
  }
}
