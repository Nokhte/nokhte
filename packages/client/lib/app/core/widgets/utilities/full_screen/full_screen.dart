import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';

class FullScreen extends HookWidget {
  final Widget child;

  const FullScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final fullScreen = useFullScreenSize();
    return SizedBox(
      width: fullScreen.width,
      height: fullScreen.height,
      child: child,
    );
  }
}
