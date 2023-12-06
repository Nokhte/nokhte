import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/gestures/stack/presentation/mobx/hold_detector.dart';

class Hold extends StatelessWidget {
  final HoldDetector trackerStore;
  final Widget child;
  const Hold({
    super.key,
    required this.trackerStore,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) => trackerStore.onHold(),
      onLongPressEnd: (details) => trackerStore.onLetGo(),
      child: child,
    );
  }
}
