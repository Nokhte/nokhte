import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/gestures/stack/presentation/mobx/hold_detector.dart';

class Hold extends StatelessWidget {
  final HoldDetector store;
  final Widget child;
  const Hold({
    super.key,
    required this.store,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) => store.onHold(),
      onLongPressEnd: (details) => store.onLetGo(),
      child: child,
    );
  }
}
