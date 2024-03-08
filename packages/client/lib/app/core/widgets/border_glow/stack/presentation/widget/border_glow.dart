import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:ui';

class BorderGlow extends HookWidget {
  final BorderGlowStore store;
  const BorderGlow({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
        onEnd: () => store.toggleHasFadedIn(),
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
          tween: store.movie,
          control: store.control,
          duration: store.movie.duration,
          onCompleted: () => store.onCompleted(),
          builder: (context, value, child) {
            store.setAnimationValues(
              color: value.get('color'),
              width: value.get('width'),
            );
            return ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: value.get('color'),
                    width: value.get('width'),
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 40,
                    sigmaY: 40,
                  ),
                  child: Container(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
