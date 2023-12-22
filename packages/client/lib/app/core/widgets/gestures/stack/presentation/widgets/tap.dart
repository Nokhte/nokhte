import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/gestures/stack/presentation/mobx/tap_detector.dart';

class Tap extends StatelessWidget {
  final TapDetector store;
  final Widget child;
  const Tap({
    super.key,
    required this.store,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => store.onTap(),
      onTapDown: (details) => store.onTapDown(details.globalPosition),
      child: child,
    );
  }
}
