import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class PresetDiagramMovies with MovieUtils {
  MovieTween get appear => _staticWhiteCircle(_staticNoBlur(MovieTween()))
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'c1.dx',
          Tween<double>(
            begin: .5,
            end: .5,
          ),
        )
        .tween(
          'c1.dy',
          Tween<double>(
            begin: 1.2,
            end: 0.5,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'c1.rad',
          Tween<double>(
            begin: 10,
            end: 23,
          ),
        );

  MovieTween get showSecondCircle =>
      _staticWhiteCircle(_staticSingleCircle(_staticNoBlur(MovieTween())))
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(0, milli: 500),
        )
            .tween(
              'c2.dx',
              Tween<double>(
                begin: 0.5,
                end: 0.5,
              ),
            )
            .tween(
              'c2.dy',
              Tween<double>(
                begin: .5,
                end: .34,
              ),
              curve: Curves.decelerate,
            )
            .tween(
              'c2.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            );

  MovieTween get showLeftTalkingPhone =>
      _staticWhiteCircle(_staticNoBlur((_staticTwoCircles(MovieTween()))))
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(0, milli: 500),
        )
            .tween(
              'l1.width',
              Tween<double>(
                begin: .015,
                end: .015,
              ),
            )
            .tween(
              'l1.dx.start',
              Tween<double>(
                begin: 0.48,
                end: 0.48,
              ),
            )
            .tween(
              'l1.dy.start',
              Tween<double>(
                begin: .46,
                end: .46,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l1.dx.end',
              Tween<double>(
                begin: 0.48,
                end: 0.48,
              ),
            )
            .tween(
              'l1.dy.end',
              Tween<double>(
                begin: .46,
                end: .38,
              ),
              curve: Curves.easeInOutCubic,
            );

  MovieTween get showRightNotesPhone => _staticWhiteCircle(
      _staticTalkingPhone(_staticNoBlur((_staticTwoCircles(MovieTween())))))
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 500),
    )
        .tween(
          'l2.width',
          Tween<double>(
            begin: .015,
            end: .015,
          ),
        )
        .tween(
          'l2.dx.start',
          Tween<double>(
            begin: 0.52,
            end: 0.52,
          ),
        )
        .tween(
          'l2.dy.start',
          Tween<double>(
            begin: .46,
            end: .46,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'l2.dx.end',
          Tween<double>(
            begin: 0.52,
            end: 0.52,
          ),
        )
        .tween(
          'l2.dy.end',
          Tween<double>(
            begin: .46,
            end: .38,
          ),
          curve: Curves.easeInOutCubic,
        );

  MovieTween get consolidateThePair =>
      _staticWhiteCircle(_staticSingleCircle(_staticNoBlur(MovieTween())))
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(0, milli: 500),
        )
            .tween(
              'l1.width',
              Tween<double>(
                begin: .015,
                end: .015,
              ),
            )
            .tween(
              'l1.dx.start',
              Tween<double>(
                begin: 0.48,
                end: 0.48,
              ),
            )
            .tween(
              'l1.dy.start',
              Tween<double>(
                begin: .46,
                end: .46,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l1.dx.end',
              Tween<double>(
                begin: 0.48,
                end: 0.48,
              ),
            )
            .tween(
              'l1.dy.end',
              Tween<double>(
                begin: .38,
                end: .46,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l2.width',
              Tween<double>(
                begin: .015,
                end: .015,
              ),
            )
            .tween(
              'l2.dx.start',
              Tween<double>(
                begin: 0.52,
                end: 0.52,
              ),
            )
            .tween(
              'l2.dy.start',
              Tween<double>(
                begin: .46,
                end: .46,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l2.dx.end',
              Tween<double>(
                begin: 0.52,
                end: 0.52,
              ),
            )
            .tween(
              'l2.dy.end',
              Tween<double>(
                begin: .38,
                end: .46,
              ),
              curve: Curves.easeInOutCubic,
            )
        ..scene(
          begin: Seconds.get(0, milli: 500),
          end: Seconds.get(1),
        )
            .tween(
              'c2.dx',
              Tween<double>(
                begin: 0.5,
                end: 0.5,
              ),
            )
            .tween(
              'c2.dy',
              Tween<double>(
                begin: .34,
                end: .5,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'c2.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            );

  MovieTween get trioExpansion => _staticNoBlur(MovieTween())
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'c1.dx',
          Tween<double>(
            begin: .5,
            end: .3,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'c1.dy',
          Tween<double>(
            begin: .5,
            end: 0.5,
          ),
        )
        .tween(
          'c1.rad',
          Tween<double>(
            begin: 23,
            end: 23,
          ),
        )
        .tween(
          'c2.dx',
          Tween<double>(
            begin: 0.5,
            end: 0.7,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'c2.dy',
          Tween<double>(
            begin: .5,
            end: .5,
          ),
        )
        .tween(
          'c2.rad',
          Tween<double>(
            begin: 21,
            end: 21,
          ),
        )
        .tween(
          'c3.dx',
          Tween<double>(
            begin: 0.5,
            end: 0.5,
          ),
        )
        .tween(
          'c3.dy',
          Tween<double>(
            begin: .5,
            end: .35,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'c3.rad',
          Tween<double>(
            begin: 21,
            end: 21,
          ),
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    )
        .tween(
          'l1.width',
          Tween<double>(
            begin: .02,
            end: .02,
          ),
        )
        .tween(
          'l1.dx.start',
          Tween<double>(
            begin: 0.345,
            end: 0.345,
          ),
        )
        .tween(
          'l1.dy.start',
          Tween<double>(
            begin: .465,
            end: .465,
          ),
        )
        .tween(
          'l1.dx.end',
          Tween<double>(
            begin: 0.345,
            end: 0.45,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'l1.dy.end',
          Tween<double>(
            begin: .465,
            end: .385,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'l2.width',
          Tween<double>(
            begin: .02,
            end: .02,
          ),
        )
        .tween(
          'l2.dx.start',
          Tween<double>(
            begin: 0.398,
            end: 0.398,
          ),
        )
        .tween(
          'l2.dy.start',
          Tween<double>(
            begin: .501,
            end: .501,
          ),
        )
        .tween(
          'l2.dx.end',
          Tween<double>(
            begin: 0.398,
            end: 0.605,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'l2.dy.end',
          Tween<double>(
            begin: .501,
            end: .501,
          ),
          curve: Curves.easeInOutCubic,
        )
        //
        .tween(
          'l3.width',
          Tween<double>(
            begin: .02,
            end: .02,
          ),
        )
        .tween(
          'l3.dx.start',
          Tween<double>(
            begin: 0.656,
            end: 0.656,
          ),
        )
        .tween(
          'l3.dy.start',
          Tween<double>(
            begin: .465,
            end: .465,
          ),
        )
        .tween(
          'l3.dx.end',
          Tween<double>(
            begin: 0.656,
            end: 0.55,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'l3.dy.end',
          Tween<double>(
            begin: .465,
            end: .385,
          ),
          curve: Curves.easeInOutCubic,
        );

  MovieTween get trioConsolidation =>
      _staticWhiteCircle(_staticNoBlur(MovieTween()))
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1),
        )
            .tween(
              'l1.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l1.dx.start',
              Tween<double>(
                begin: 0.345,
                end: 0.345,
              ),
            )
            .tween(
              'l1.dy.start',
              Tween<double>(
                begin: .465,
                end: .465,
              ),
            )
            .tween(
              'l1.dx.end',
              Tween<double>(
                begin: 0.45,
                end: 0.345,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l1.dy.end',
              Tween<double>(
                begin: .385,
                end: .465,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l2.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l2.dx.start',
              Tween<double>(
                begin: 0.398,
                end: 0.398,
              ),
            )
            .tween(
              'l2.dy.start',
              Tween<double>(
                begin: .501,
                end: .501,
              ),
            )
            .tween(
              'l2.dx.end',
              Tween<double>(
                begin: 0.605,
                end: 0.398,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l2.dy.end',
              Tween<double>(
                begin: .501,
                end: .501,
              ),
              curve: Curves.easeInOutCubic,
            )
            //
            .tween(
              'l3.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l3.dx.start',
              Tween<double>(
                begin: 0.656,
                end: 0.656,
              ),
            )
            .tween(
              'l3.dy.start',
              Tween<double>(
                begin: .465,
                end: .465,
              ),
            )
            .tween(
              'l3.dx.end',
              Tween<double>(
                begin: 0.55,
                end: 0.656,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l3.dy.end',
              Tween<double>(
                begin: .385,
                end: .465,
              ),
              curve: Curves.easeInOutCubic,
            )
        ..scene(
          begin: Seconds.get(1),
          end: Seconds.get(2),
        )
            .tween(
              'c1.dx',
              Tween<double>(
                begin: .3,
                end: .5,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c1.dy',
              Tween<double>(
                begin: 0.5,
                end: .5,
              ),
            )
            .tween(
              'c1.rad',
              Tween<double>(
                begin: 23,
                end: 23,
              ),
            )
            .tween(
              'c2.dx',
              Tween<double>(
                begin: 0.7,
                end: 0.5,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c2.dy',
              Tween<double>(
                begin: .5,
                end: .5,
              ),
            )
            .tween(
              'c2.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            )
            .tween(
              'c3.dx',
              Tween<double>(
                begin: 0.5,
                end: 0.5,
              ),
            )
            .tween(
              'c3.dy',
              Tween<double>(
                begin: .35,
                end: .5,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c3.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            );

  MovieTween get fourWayExpansion =>
      _staticWhiteCircle(_staticNoBlur(MovieTween()))
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1),
        )
            .tween(
              'c1.dx',
              Tween<double>(
                begin: .5,
                end: .3,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c1.dy',
              Tween<double>(
                begin: .5,
                end: 0.5,
              ),
            )
            .tween(
              'c1.rad',
              Tween<double>(
                begin: 23,
                end: 23,
              ),
            )
            .tween(
              'c2.dx',
              Tween<double>(
                begin: 0.5,
                end: 0.68,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c2.dy',
              Tween<double>(
                begin: .5,
                end: .5,
              ),
            )
            .tween(
              'c2.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            )
            .tween(
              'c3.dx',
              Tween<double>(
                begin: 0.5,
                end: 0.3,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c3.dy',
              Tween<double>(
                begin: .5,
                end: .32,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c3.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            )
            .tween(
              'c4.dx',
              Tween<double>(
                begin: 0.5,
                end: 0.68,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c4.dy',
              Tween<double>(
                begin: .5,
                end: .32,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c4.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            )
        ..scene(
          begin: Seconds.get(1),
          end: Seconds.get(2),
        )
            .tween(
              'l1.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l1.dx.start',
              Tween<double>(
                begin: 0.3,
                end: 0.3,
              ),
            )
            .tween(
              'l1.dy.start',
              Tween<double>(
                begin: .46,
                end: .46,
              ),
            )
            .tween(
              'l1.dx.end',
              Tween<double>(
                begin: 0.3,
                end: 0.3,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l1.dy.end',
              Tween<double>(
                begin: .46,
                end: .362,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l2.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l2.dx.start',
              Tween<double>(
                begin: 0.39,
                end: 0.39,
              ),
            )
            .tween(
              'l2.dy.start',
              Tween<double>(
                begin: .498,
                end: .498,
              ),
            )
            .tween(
              'l2.dx.end',
              Tween<double>(
                begin: 0.39,
                end: 0.595,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l2.dy.end',
              Tween<double>(
                begin: .498,
                end: .498,
              ),
              curve: Curves.easeInOutCubic,
            )
            //
            .tween(
              'l3.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l3.dx.start',
              Tween<double>(
                begin: 0.68,
                end: 0.68,
              ),
            )
            .tween(
              'l3.dy.start',
              Tween<double>(
                begin: .46,
                end: .46,
              ),
            )
            .tween(
              'l3.dx.end',
              Tween<double>(
                begin: 0.68,
                end: 0.68,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l3.dy.end',
              Tween<double>(
                begin: .46,
                end: .362,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l4.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l4.dx.start',
              Tween<double>(
                begin: 0.39,
                end: 0.39,
              ),
            )
            .tween(
              'l4.dy.start',
              Tween<double>(
                begin: .32,
                end: .32,
              ),
            )
            .tween(
              'l4.dx.end',
              Tween<double>(
                begin: 0.39,
                end: 0.595,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l4.dy.end',
              Tween<double>(
                begin: .32,
                end: .32,
              ),
              curve: Curves.easeInOutCubic,
            );

  MovieTween get fourWayConsolidation =>
      _staticWhiteCircle(_staticNoBlur(MovieTween()))
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1),
        )
            .tween(
              'l1.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l1.dx.start',
              Tween<double>(
                begin: 0.3,
                end: 0.3,
              ),
            )
            .tween(
              'l1.dy.start',
              Tween<double>(
                begin: .46,
                end: .46,
              ),
            )
            .tween(
              'l1.dx.end',
              Tween<double>(
                begin: 0.3,
                end: 0.3,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l1.dy.end',
              Tween<double>(
                begin: .362,
                end: .46,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l2.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l2.dx.start',
              Tween<double>(
                begin: 0.39,
                end: 0.39,
              ),
            )
            .tween(
              'l2.dy.start',
              Tween<double>(
                begin: .498,
                end: .498,
              ),
            )
            .tween(
              'l2.dx.end',
              Tween<double>(
                begin: 0.595,
                end: 0.39,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l2.dy.end',
              Tween<double>(
                begin: .498,
                end: .498,
              ),
              curve: Curves.easeInOutCubic,
            )
            //
            .tween(
              'l3.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l3.dx.start',
              Tween<double>(
                begin: 0.68,
                end: 0.68,
              ),
            )
            .tween(
              'l3.dy.start',
              Tween<double>(
                begin: .46,
                end: .46,
              ),
            )
            .tween(
              'l3.dx.end',
              Tween<double>(
                begin: 0.68,
                end: 0.68,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l3.dy.end',
              Tween<double>(
                begin: .362,
                end: .46,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l4.width',
              Tween<double>(
                begin: .02,
                end: .02,
              ),
            )
            .tween(
              'l4.dx.start',
              Tween<double>(
                begin: 0.39,
                end: 0.39,
              ),
            )
            .tween(
              'l4.dy.start',
              Tween<double>(
                begin: .32,
                end: .32,
              ),
            )
            .tween(
              'l4.dx.end',
              Tween<double>(
                begin: 0.595,
                end: 0.39,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'l4.dy.end',
              Tween<double>(
                begin: .32,
                end: .32,
              ),
              curve: Curves.easeInOutCubic,
            )
        ..scene(
          begin: Seconds.get(1),
          end: Seconds.get(2),
        )
            .tween(
              'c1.dx',
              Tween<double>(
                begin: .3,
                end: .5,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c1.dy',
              Tween<double>(
                begin: .5,
                end: 0.5,
              ),
            )
            .tween(
              'c1.rad',
              Tween<double>(
                begin: 23,
                end: 23,
              ),
            )
            .tween(
              'c2.dx',
              Tween<double>(
                begin: 0.68,
                end: 0.5,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c2.dy',
              Tween<double>(
                begin: .5,
                end: .5,
              ),
            )
            .tween(
              'c2.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            )
            .tween(
              'c3.dx',
              Tween<double>(
                begin: 0.3,
                end: 0.5,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c3.dy',
              Tween<double>(
                end: .5,
                begin: .32,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c3.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            )
            .tween(
              'c4.dx',
              Tween<double>(
                begin: 0.68,
                end: 0.5,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c4.dy',
              Tween<double>(
                begin: .32,
                end: .5,
              ),
              curve: Curves.easeInOutCubic,
            )
            .tween(
              'c4.rad',
              Tween<double>(
                begin: 21,
                end: 21,
              ),
            );

  MovieTween get whiteToHalfAndHalfCircle => _staticSingleCircle(MovieTween())
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'c1.co1',
          ColorTween(
            begin: Colors.white,
            end: const Color(0xFFF5DC91),
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.co2',
          ColorTween(
            begin: Colors.white,
            end: const Color(0xFFFFFFDC),
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.co3',
          ColorTween(
            begin: Colors.white,
            end: const Color(0xFFFAF2C3),
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.co4',
          ColorTween(
            begin: Colors.white,
            end: const Color(0xFFF9EFB7),
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.co5',
          ColorTween(
            begin: Colors.white,
            end: const Color(0xFF53DCE3),
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.co6',
          ColorTween(
            begin: Colors.white,
            end: const Color(0xFF4FD9E8),
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.co7',
          ColorTween(
            begin: Colors.white,
            end: const Color(0xFF49D6EF),
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.co8',
          ColorTween(
            begin: Colors.white,
            end: const Color(0xFF43D3F5),
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.st1',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.st2',
          Tween<double>(
            begin: 0,
            end: 0.19,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.st3',
          Tween<double>(
            begin: 0,
            end: 0.38,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.st4',
          Tween<double>(
            begin: 0,
            end: 0.47,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.st5',
          Tween<double>(
            begin: 0,
            end: 0.68,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.st6',
          Tween<double>(
            begin: 0,
            end: 0.79,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.st7',
          Tween<double>(
            begin: 0,
            end: 0.9,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'c1.st8',
          Tween<double>(
            begin: 0,
            end: 1.00,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        );
}

mixin MovieUtils {
  _staticSingleCircle(MovieTween movie) => movie
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 1),
    )
        .tween(
          'c1.dx',
          Tween<double>(
            begin: 0.5,
            end: 0.5,
          ),
        )
        .tween(
          'c1.dy',
          Tween<double>(
            begin: .5,
            end: .5,
          ),
        )
        .tween(
          'c1.rad',
          Tween<double>(
            begin: 23,
            end: 23,
          ),
        );

  _staticWhiteCircle(MovieTween movie) => movie
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 1),
    )
        .tween(
          'c1.co1',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        )
        .tween(
          'c1.co2',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        )
        .tween(
          'c1.co3',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        )
        .tween(
          'c1.co4',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        )
        .tween(
          'c1.co5',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        )
        .tween(
          'c1.co6',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        )
        .tween(
          'c1.co7',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        )
        .tween(
          'c1.co8',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        )
        .tween(
          'c1.st1',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          'c1.st2',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          'c1.st3',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          'c1.st4',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          'c1.st5',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          'c1.st6',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          'c1.st7',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          'c1.st8',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        );

  _staticTwoCircles(MovieTween movie) => _staticSingleCircle(movie)
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 1),
    )
        .tween(
          'c1.dx',
          Tween<double>(
            begin: 0.5,
            end: 0.5,
          ),
        )
        .tween(
          'c1.dy',
          Tween<double>(
            begin: .5,
            end: .5,
          ),
        )
        .tween(
          'c1.rad',
          Tween<double>(
            begin: 23,
            end: 23,
          ),
        )
        .tween(
          'c2.dx',
          Tween<double>(
            begin: 0.5,
            end: 0.5,
          ),
        )
        .tween(
          'c2.dy',
          Tween<double>(
            begin: .34,
            end: .34,
          ),
        )
        .tween(
          'c2.rad',
          Tween<double>(
            begin: 21,
            end: 21,
          ),
        );

  _staticNoBlur(MovieTween movie) => movie
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 1),
    ).tween(
      'blur',
      Tween<double>(
        begin: 0,
        end: 0,
      ),
    );

  _staticTalkingPhone(MovieTween movie) => movie
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 1),
    )
        .tween(
          'l1.width',
          Tween<double>(
            begin: .015,
            end: .015,
          ),
        )
        .tween(
          'l1.dx.start',
          Tween<double>(
            begin: 0.48,
            end: 0.48,
          ),
        )
        .tween(
          'l1.dy.start',
          Tween<double>(
            begin: .46,
            end: .46,
          ),
          curve: Curves.easeInOutCubic,
        )
        .tween(
          'l1.dx.end',
          Tween<double>(
            begin: 0.48,
            end: 0.48,
          ),
        )
        .tween(
          'l1.dy.end',
          Tween<double>(
            begin: .38,
            end: .38,
          ),
          curve: Curves.easeInOutCubic,
        );
}




  // static MovieTween get expandLeftMostTalking => _staticTwoCircles(MovieTween())
  //   ..scene(
  //     begin: Seconds.get(0),
  //     end: Seconds.get(1),
  //   )
  //       .tween(
  //         'l1.width',
  //         Tween<double>(
  //           begin: .015,
  //           end: 1.1,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //       .tween(
  //         'l.dx1.start',
  //         Tween<double>(
  //           begin: 0.48,
  //           end: .5,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //       .tween(
  //         'l.dy1.start',
  //         Tween<double>(
  //           begin: .46,
  //           end: 1.0,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //       .tween(
  //         'l.dx1.end',
  //         Tween<double>(
  //           begin: 0.48,
  //           end: 0.5,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //       .tween(
  //         'l.dy1.end',
  //         Tween<double>(
  //           begin: .38,
  //           end: 0,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //   ..scene(
  //     begin: Seconds.get(0, milli: 500),
  //     end: Seconds.get(1),
  //   ).tween(
  //     'blur',
  //     Tween<double>(
  //       begin: 0,
  //       end: 40,
  //     ),
  //   );

  // static MovieTween get shrinkLeftMostTalking => _staticTwoCircles(MovieTween())
  //   ..scene(
  //     begin: Seconds.get(0),
  //     end: Seconds.get(1),
  //   )
  //       .tween(
  //         'l1.width',
  //         Tween<double>(
  //           begin: 1.1,
  //           end: .015,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //       .tween(
  //         'l.dx1.start',
  //         Tween<double>(
  //           begin: .5,
  //           end: 0.48,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //       .tween(
  //         'l.dy1.start',
  //         Tween<double>(
  //           begin: 1.0,
  //           end: .46,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //       .tween(
  //         'l.dx1.end',
  //         Tween<double>(
  //           begin: 0.5,
  //           end: 0.48,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //       .tween(
  //         'l.dy1.end',
  //         Tween<double>(
  //           begin: 0,
  //           end: .38,
  //         ),
  //         curve: Curves.easeInOut,
  //       )
  //   ..scene(
  //     begin: Seconds.get(0),
  //     end: Seconds.get(1),
  //   ).tween(
  //     'blur',
  //     Tween<double>(
  //       end: 0,
  //       begin: 40,
  //     ),
  //   );