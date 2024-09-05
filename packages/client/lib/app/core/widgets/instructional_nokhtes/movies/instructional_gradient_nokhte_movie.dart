import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class InstructionalGradientNokhteMovie {
  static MovieTween scale(
    Size screenSize, {
    required InstructionalNokhtePositions position,
    required GradientNokhteColorways colorway,
    required InstructionalGradientDirections direction,
  }) {
    final offsets = InstructionalNokhteUtils.getOffsets(
      screenSize,
      position: position,
      direction: direction,
    );

    List<ColorAndStop> grad = InstructionalNokhteUtils.getGradient(colorway);
    return gradTransition(grad, grad, MovieTween())
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1, milli: 500),
      )
          .tween(
            'dx',
            Tween<double>(
              begin: offsets.start.dx,
              end: offsets.end.dx,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy',
            Tween<double>(
              begin: offsets.start.dy,
              end: offsets.end.dy,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'radius',
            Tween<double>(
              begin: direction == InstructionalGradientDirections.enlarge
                  ? 4.5
                  : 25,
              end: direction == InstructionalGradientDirections.enlarge
                  ? 25
                  : 4.5,
            ),
          )
      ..scene(
        begin: direction == InstructionalGradientDirections.enlarge
            ? Seconds.get(1, milli: 500)
            : Seconds.get(0),
        end: direction == InstructionalGradientDirections.enlarge
            ? Seconds.get(2)
            : Seconds.get(0, milli: 500),
      ).tween(
          'textOpacity',
          Tween<double>(
            begin: direction == InstructionalGradientDirections.enlarge ? 0 : 1,
            end: direction == InstructionalGradientDirections.enlarge ? 1 : 0,
          ));
  }

  static MovieTween explode(
    Size screenSize, {
    required InstructionalNokhtePositions position,
    required GradientNokhteColorways colorway,
  }) {
    final offsets = InstructionalNokhteUtils.getOffsets(
      screenSize,
      position: position,
      direction: InstructionalGradientDirections.enlarge,
    );

    List<ColorAndStop> grad = InstructionalNokhteUtils.getGradient(colorway);
    List<ColorAndStop> scaledGrad = [];

    switch (colorway) {
      case GradientNokhteColorways.orangeSand:
        scaledGrad = [
          ColorAndStop(grad[0].color, 0),
          ColorAndStop(grad[0].color, 0),
          ColorAndStop(grad[2].color, 0.15),
          ColorAndStop(grad[2].color, 0.15),
        ];
      case GradientNokhteColorways.vibrantBlue:
        scaledGrad = const [
          ColorAndStop(Color(0xFF44D3FE), 0),
          ColorAndStop(Color(0xFF44D3FE), .3),
          ColorAndStop(Color(0xFF6BE9BB), 1.0),
          ColorAndStop(Color(0xFF6BE9BB), 1.0),
        ];
      default:
        break;
    }

    return staticPosition(
      offsets.end,
      gradTransition(
        grad,
        scaledGrad,
        MovieTween(),
      ),
    )
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1, milli: 500),
      ).tween(
        'radius',
        Tween<double>(
          begin: 25,
          end: 800,
        ),
        curve: Curves.easeInOutCubicEmphasized,
      )
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(0, milli: 500),
      ).tween(
        'textOpacity',
        Tween<double>(
          begin: 1,
          end: 0,
        ),
      );
  }

  static MovieTween disappear(
    Size screenSize, {
    required InstructionalNokhtePositions position,
    required GradientNokhteColorways colorway,
  }) {
    final offsets = InstructionalNokhteUtils.getOffsets(
      screenSize,
      position: position,
      direction: InstructionalGradientDirections.enlarge,
    );

    List<ColorAndStop> grad = InstructionalNokhteUtils.getGradient(colorway);
    return gradTransition(
        grad,
        List.generate(4, (i) {
          return ColorAndStop(
            Colors.transparent,
            grad[i].stop,
          );
        }),
        (staticPosition(offsets.end, MovieTween())))
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1),
      )
          .tween(
            'radius',
            Tween<double>(
              begin: 25,
              end: 25,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'textOpacity',
            Tween<double>(
              begin: 1,
              end: 0,
            ),
          );
  }

  static MovieTween staticPosition(Offset offset, MovieTween movie) => movie
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(
        0,
        milli: 1,
      ),
    )
        .tween(
          'dx',
          Tween<double>(
            begin: offset.dx,
            end: offset.dx,
          ),
        )
        .tween(
          'dy',
          Tween<double>(
            begin: offset.dy,
            end: offset.dy,
          ),
        );
  static MovieTween gradTransition(List<ColorAndStop> startingGrad,
          List<ColorAndStop> endingGrad, MovieTween movie) =>
      movie
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(0, milli: 500),
        )
            .tween(
              'color1',
              ColorTween(
                begin: startingGrad[0].color,
                end: endingGrad[0].color,
              ),
            )
            .tween(
              'color2',
              ColorTween(
                begin: startingGrad[1].color,
                end: endingGrad[1].color,
              ),
            )
            .tween(
              'color3',
              ColorTween(
                begin: startingGrad[2].color,
                end: endingGrad[2].color,
              ),
            )
            .tween(
              'color4',
              ColorTween(
                begin: startingGrad[3].color,
                end: endingGrad[3].color,
              ),
            )
            .tween(
              'stop1',
              Tween<double>(
                begin: startingGrad[0].stop,
                end: endingGrad[0].stop,
              ),
            )
            .tween(
              'stop2',
              Tween<double>(
                begin: startingGrad[1].stop,
                end: endingGrad[1].stop,
              ),
            )
            .tween(
              'stop3',
              Tween<double>(
                begin: startingGrad[2].stop,
                end: endingGrad[2].stop,
              ),
            )
            .tween(
              'stop4',
              Tween<double>(
                begin: startingGrad[3].stop,
                end: endingGrad[3].stop,
              ),
            );
}
