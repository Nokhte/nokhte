import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/utilities/gestures/mobx/hold_detector.dart';

class Hold extends HookWidget {
  final HoldDetector store;
  final Widget child;
  const Hold({
    super.key,
    required this.store,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    useEffect(() {
      store.setScreenHeight(height);
      return null;
    }, []);
    return GestureDetector(
      onLongPressStart: (details) {
        store.onHold(details.globalPosition);
      },
      onLongPressEnd: (details) => store.onLetGo(),
      child: child,
    );
  }
}
