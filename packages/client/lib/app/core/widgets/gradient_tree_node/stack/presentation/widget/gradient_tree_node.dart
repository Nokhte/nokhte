import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/gradient_tree_node_painter.dart';

class GradientTreeNode extends StatelessWidget {
  final NokhteGradient gradient;
  final GradientTreeNodeStore store;
  final EdgeInsets padding;
  final Size size;
  const GradientTreeNode({
    super.key,
    required this.store,
    required this.gradient,
    required this.size,
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
                    child: SizedBox(
                      height: size.height,
                      width: size.width,
                      child: GestureDetector(
                        onTapDown: (details) => store.incrementTapCount(),
                        child: CustomPaint(
                          painter: GradientTreeNodePainter(
                            strokeWidth: value.get('strokeWidth'),
                            radius: value.get('radius'),
                            offset: Offset(
                              value.get('x1'),
                              value.get('y1'),
                            ),
                            gradient: NokhteGradient(
                              colors: [
                                value.get('color1'),
                                value.get('color2'),
                                value.get('color3')
                              ],
                              stops: const [0.0, .3, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ));
}
