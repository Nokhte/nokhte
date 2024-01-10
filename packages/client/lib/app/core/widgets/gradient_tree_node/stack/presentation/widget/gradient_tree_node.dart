import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:touchable/touchable.dart';
import 'canvas/gradient_tree_node_painter.dart';

class GradientTreeNode extends StatelessWidget {
  final NokhteGradient gradient;
  final GradientTreeNodeStore store;
  final EdgeInsets padding;
  const GradientTreeNode({
    super.key,
    required this.store,
    required this.gradient,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) => Observer(
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
                  return Padding(
                    padding: padding,
                    child: FullScreen(
                      child: CanvasTouchDetector(
                        gesturesToOverride: const [
                          GestureType.onTapDown,
                          GestureType.onTapUp,
                        ],
                        builder: (context) {
                          return CustomPaint(
                            painter: GradientTreeNodePainter(
                              strokeWidth: value.get('strokeWidth'),
                              radius: value.get('radius'),
                              offset: Offset(
                                value.get('x1'),
                                value.get('y1'),
                              ),
                              onTap: () => store.incrementTapCount(),
                              gradient: NokhteGradient(
                                colors: [
                                  value.get('color1'),
                                  value.get('color2'),
                                  value.get('color3')
                                ],
                                stops: const [0.0, .3, 1.0],
                              ),
                              context: context,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
          ));
}
