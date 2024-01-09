import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/gradient_tree_node/stack/stack.dart';
import 'package:simple_animations/simple_animations.dart';

class ChangeColorGlowAndMoveUpMovies {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'color1',
          ColorTween(
            begin: TreeNodeGradients.yellowColors[0],
            end: TreeNodeGradients.blueColors[1],
          ),
        )
        .tween(
          'color2',
          ColorTween(
            begin: TreeNodeGradients.yellowColors[1],
            end: TreeNodeGradients.blueColors[1],
          ),
        )
        .tween(
          'color3',
          ColorTween(
            begin: TreeNodeGradients.yellowColors[2],
            end: TreeNodeGradients.blueColors[2],
          ),
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(1, milli: 810),
    )
        .tween(
          'x1',
          Tween<double>(
            begin: 0,
            end: 0.0,
          ),
        )
        .tween(
          'y1',
          Tween<double>(
            begin: 0,
            end: -200.0,
          ),
        )
        .tween(
          'radius',
          Tween<double>(
            begin: 25.0,
            end: 500.0,
          ),
        )
        .tween(
          'strokeWidth',
          Tween<double>(
            begin: 2.0,
            end: 0.0,
          ),
        );
}
