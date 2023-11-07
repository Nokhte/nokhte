import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/swipe/stack/presentation/mobx/swipe_detector.dart';

class Swipe extends StatelessWidget {
  final SwipeDetector trackerStore;
  final Widget child;
  const Swipe({
    super.key,
    required this.trackerStore,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => trackerStore.onUpdateCallback(
        details.globalPosition,
        DragType.horizontal,
      ),
      onHorizontalDragEnd: (details) =>
          trackerStore.onFinishedGestureCallback(),
      onVerticalDragUpdate: (details) => trackerStore.onUpdateCallback(
        details.globalPosition,
        DragType.vertical,
      ),
      onVerticalDragEnd: (details) => trackerStore.onFinishedGestureCallback(),
      child: child,
    );
  }
}
