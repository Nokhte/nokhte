import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:nokhte/app/core/hooks/use_full_screen_size.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class Callout extends HookWidget {
  final String content;
  const Callout(
    this.content, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fullScreenSize = useFullScreenSize();
    return LoopAnimationBuilder(
      tween: CalloutMovie.movie,
      duration: CalloutMovie.movie.duration,
      builder: (context, value, child) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              child: Chivo(
                'Unique Feature:',
                fontSize: 28,
              ),
            ),
            Container(
              width: fullScreenSize.width * 0.8,
              decoration: BoxDecoration(
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: List.generate(
                        8, (index) => value.get('color${8 - index}')),
                    stops: const [
                      0.0, // 0%
                      0.11, // 11%
                      0.22, // 22%
                      0.33, // 33%
                      0.50, // 50%
                      0.70, // 70%
                      0.86, // 86%
                      1.0, // 100%
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                child: Jost(
                  content,
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  shouldCenter: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
