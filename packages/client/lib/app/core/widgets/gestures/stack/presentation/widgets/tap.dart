import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/gestures/stack/presentation/mobx/tap_detector.dart';

class Tap extends StatelessWidget {
  final TapDetector trackerStore;
  final Widget child;
  const Tap({
    super.key,
    required this.trackerStore,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => trackerStore.onTap(),
      child: child,
    );
  }
}
