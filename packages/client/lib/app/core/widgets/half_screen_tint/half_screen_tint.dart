import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'half_screen_tint_store.dart';

class HalfScreenTint extends HookWidget {
  final HalfScreenTintStore store;
  const HalfScreenTint({
    super.key,
    required this.store,
  });

  @override
  Widget build(context) {
    final size = useFullScreenSize();
    final halfHeight = size.height.half();
    final halfWidth = size.width;
    return Observer(
      builder: (context) => CustomAnimationBuilder(
        tween: store.movie,
        duration: store.movie.duration,
        control: store.control,
        builder: (context, value, child) => Transform.flip(
          flipY: store.shouldCoverBottom ? true : false,
          child: FullScreen(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        store.tintcolor.withOpacity(
                          value.get('opacity1'),
                        ),
                        store.tintcolor.withOpacity(
                          value.get('opacity2'),
                        ),
                      ],
                    ),
                  ),
                  height: halfHeight,
                  width: halfWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
