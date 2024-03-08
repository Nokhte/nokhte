import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class SequenceTransitionMovie {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie(
    List<List<ColorAndStop>> sequence, {
    required Duration movieLength,
  }) {
    final durationsArr = TimeAllocator.generateDurations(
        duration: movieLength, numIncrements: 8);
    return MovieTween()
      ..scene(
        begin: durationsArr.first.begin,
        end: durationsArr.first.end,
      )
          .tween(
            BeachWaveAnimationKeys.waterMovement,
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color1,
            ColorTween(
              begin: sequence[0].first.color,
              end: sequence[0].first.color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color2,
            ColorTween(
              begin: sequence[0][1].color,
              end: sequence[0][1].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color3,
            ColorTween(
              begin: sequence[0][2].color,
              end: sequence[0][2].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color4,
            ColorTween(
              begin: sequence[0][3].color,
              end: sequence[0][3].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color5,
            ColorTween(
              begin: sequence[0][4].color,
              end: sequence[0][4].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color6,
            ColorTween(
              begin: sequence[0][5].color,
              end: sequence[0][5].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color7,
            ColorTween(
              begin: sequence[0][6].color,
              end: sequence[0][6].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color8,
            ColorTween(
              begin: sequence[0][7].color,
              end: sequence[0][7].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop1,
            Tween<double>(
              begin: sequence[0].first.stop,
              end: sequence[0].first.stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop2,
            Tween<double>(
              begin: sequence[0][1].stop,
              end: sequence[0][1].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop3,
            Tween<double>(
              begin: sequence[0][2].stop,
              end: sequence[0][2].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop4,
            Tween<double>(
              begin: sequence[0][3].stop,
              end: sequence[0][3].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop5,
            Tween<double>(
              begin: sequence[0][4].stop,
              end: sequence[0][4].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop6,
            Tween<double>(
              begin: sequence[0][5].stop,
              end: sequence[0][5].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop7,
            Tween<double>(
              begin: sequence[0][6].stop,
              end: sequence[0][6].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop8,
            Tween<double>(
              begin: sequence[0][7].stop,
              end: sequence[0][7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[1].begin,
        end: durationsArr[1].end,
      )
          .tween(
            BeachWaveAnimationKeys.waterMovement,
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color1,
            ColorTween(
              begin: sequence[1].first.color,
              end: sequence[1].first.color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color2,
            ColorTween(
              begin: sequence[1][1].color,
              end: sequence[1][1].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color3,
            ColorTween(
              begin: sequence[1][2].color,
              end: sequence[1][2].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color4,
            ColorTween(
              begin: sequence[1][3].color,
              end: sequence[1][3].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color5,
            ColorTween(
              begin: sequence[1][4].color,
              end: sequence[1][4].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color6,
            ColorTween(
              begin: sequence[1][5].color,
              end: sequence[1][5].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color7,
            ColorTween(
              begin: sequence[1][6].color,
              end: sequence[1][6].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color8,
            ColorTween(
              begin: sequence[1][7].color,
              end: sequence[1][7].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop1,
            Tween<double>(
              begin: sequence[1].first.stop,
              end: sequence[1].first.stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop2,
            Tween<double>(
              begin: sequence[1][1].stop,
              end: sequence[1][1].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop3,
            Tween<double>(
              begin: sequence[1][2].stop,
              end: sequence[1][2].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop4,
            Tween<double>(
              begin: sequence[1][3].stop,
              end: sequence[1][3].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop5,
            Tween<double>(
              begin: sequence[1][4].stop,
              end: sequence[1][4].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop6,
            Tween<double>(
              begin: sequence[1][5].stop,
              end: sequence[1][5].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop7,
            Tween<double>(
              begin: sequence[1][6].stop,
              end: sequence[1][6].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop8,
            Tween<double>(
              begin: sequence[1][7].stop,
              end: sequence[1][7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[2].begin,
        end: durationsArr[2].end,
      )
          .tween(
            BeachWaveAnimationKeys.waterMovement,
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color1,
            ColorTween(
              begin: sequence[2].first.color,
              end: sequence[2].first.color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color2,
            ColorTween(
              begin: sequence[2][1].color,
              end: sequence[2][1].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color3,
            ColorTween(
              begin: sequence[2][2].color,
              end: sequence[2][2].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color4,
            ColorTween(
              begin: sequence[2][3].color,
              end: sequence[2][3].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color5,
            ColorTween(
              begin: sequence[2][4].color,
              end: sequence[2][4].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color6,
            ColorTween(
              begin: sequence[2][5].color,
              end: sequence[2][5].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color7,
            ColorTween(
              begin: sequence[2][6].color,
              end: sequence[2][6].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color8,
            ColorTween(
              begin: sequence[2][7].color,
              end: sequence[2][7].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop1,
            Tween<double>(
              begin: sequence[2].first.stop,
              end: sequence[2].first.stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop2,
            Tween<double>(
              begin: sequence[2][1].stop,
              end: sequence[2][1].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop3,
            Tween<double>(
              begin: sequence[2][2].stop,
              end: sequence[2][2].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop4,
            Tween<double>(
              begin: sequence[2][3].stop,
              end: sequence[2][3].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop5,
            Tween<double>(
              begin: sequence[2][4].stop,
              end: sequence[2][4].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop6,
            Tween<double>(
              begin: sequence[2][5].stop,
              end: sequence[2][5].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop7,
            Tween<double>(
              begin: sequence[2][6].stop,
              end: sequence[2][6].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop8,
            Tween<double>(
              begin: sequence[2][7].stop,
              end: sequence[2][7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[3].begin,
        end: durationsArr[3].end,
      )
          .tween(
            BeachWaveAnimationKeys.waterMovement,
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color1,
            ColorTween(
              begin: sequence[3].first.color,
              end: sequence[3].first.color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color2,
            ColorTween(
              begin: sequence[3][1].color,
              end: sequence[3][1].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color3,
            ColorTween(
              begin: sequence[3][2].color,
              end: sequence[3][2].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color4,
            ColorTween(
              begin: sequence[3][3].color,
              end: sequence[3][3].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color5,
            ColorTween(
              begin: sequence[3][4].color,
              end: sequence[3][4].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color6,
            ColorTween(
              begin: sequence[3][5].color,
              end: sequence[3][5].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color7,
            ColorTween(
              begin: sequence[3][6].color,
              end: sequence[3][6].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color8,
            ColorTween(
              begin: sequence[3][7].color,
              end: sequence[3][7].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop1,
            Tween<double>(
              begin: sequence[3].first.stop,
              end: sequence[3].first.stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop2,
            Tween<double>(
              begin: sequence[3][1].stop,
              end: sequence[3][1].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop3,
            Tween<double>(
              begin: sequence[3][2].stop,
              end: sequence[3][2].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop4,
            Tween<double>(
              begin: sequence[3][3].stop,
              end: sequence[3][3].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop5,
            Tween<double>(
              begin: sequence[3][4].stop,
              end: sequence[3][4].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop6,
            Tween<double>(
              begin: sequence[3][5].stop,
              end: sequence[3][5].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop7,
            Tween<double>(
              begin: sequence[3][6].stop,
              end: sequence[3][6].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop8,
            Tween<double>(
              begin: sequence[3][7].stop,
              end: sequence[3][7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[4].begin,
        end: durationsArr[4].end,
      )
          .tween(
            BeachWaveAnimationKeys.waterMovement,
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color1,
            ColorTween(
              begin: sequence[4].first.color,
              end: sequence[4].first.color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color2,
            ColorTween(
              begin: sequence[4][1].color,
              end: sequence[4][1].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color3,
            ColorTween(
              begin: sequence[4][2].color,
              end: sequence[4][2].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color4,
            ColorTween(
              begin: sequence[4][3].color,
              end: sequence[4][3].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color5,
            ColorTween(
              begin: sequence[4][4].color,
              end: sequence[4][4].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color6,
            ColorTween(
              begin: sequence[4][5].color,
              end: sequence[4][5].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color7,
            ColorTween(
              begin: sequence[4][6].color,
              end: sequence[4][6].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color8,
            ColorTween(
              begin: sequence[4][7].color,
              end: sequence[4][7].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop1,
            Tween<double>(
              begin: sequence[4].first.stop,
              end: sequence[4].first.stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop2,
            Tween<double>(
              begin: sequence[4][1].stop,
              end: sequence[4][1].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop3,
            Tween<double>(
              begin: sequence[4][2].stop,
              end: sequence[4][2].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop4,
            Tween<double>(
              begin: sequence[4][3].stop,
              end: sequence[4][3].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop5,
            Tween<double>(
              begin: sequence[4][4].stop,
              end: sequence[4][4].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop6,
            Tween<double>(
              begin: sequence[4][5].stop,
              end: sequence[4][5].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop7,
            Tween<double>(
              begin: sequence[4][6].stop,
              end: sequence[4][6].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop8,
            Tween<double>(
              begin: sequence[4][7].stop,
              end: sequence[4][7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[5].begin,
        end: durationsArr[5].end,
      )
          .tween(
            BeachWaveAnimationKeys.waterMovement,
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color1,
            ColorTween(
              begin: sequence[5].first.color,
              end: sequence[5].first.color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color2,
            ColorTween(
              begin: sequence[5][1].color,
              end: sequence[5][1].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color3,
            ColorTween(
              begin: sequence[5][2].color,
              end: sequence[5][2].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color4,
            ColorTween(
              begin: sequence[5][3].color,
              end: sequence[5][3].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color5,
            ColorTween(
              begin: sequence[5][4].color,
              end: sequence[5][4].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color6,
            ColorTween(
              begin: sequence[5][5].color,
              end: sequence[5][5].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color7,
            ColorTween(
              begin: sequence[5][6].color,
              end: sequence[5][6].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color8,
            ColorTween(
              begin: sequence[5][7].color,
              end: sequence[5][7].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop1,
            Tween<double>(
              begin: sequence[5].first.stop,
              end: sequence[5].first.stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop2,
            Tween<double>(
              begin: sequence[5][1].stop,
              end: sequence[5][1].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop3,
            Tween<double>(
              begin: sequence[5][2].stop,
              end: sequence[5][2].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop4,
            Tween<double>(
              begin: sequence[5][3].stop,
              end: sequence[5][3].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop5,
            Tween<double>(
              begin: sequence[5][4].stop,
              end: sequence[5][4].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop6,
            Tween<double>(
              begin: sequence[5][5].stop,
              end: sequence[5][5].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop7,
            Tween<double>(
              begin: sequence[5][6].stop,
              end: sequence[5][6].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop8,
            Tween<double>(
              begin: sequence[5][7].stop,
              end: sequence[5][7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[6].begin,
        end: durationsArr[6].end,
      )
          .tween(
            BeachWaveAnimationKeys.waterMovement,
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color1,
            ColorTween(
              begin: sequence[6].first.color,
              end: sequence[6].first.color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color2,
            ColorTween(
              begin: sequence[6][1].color,
              end: sequence[6][1].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color3,
            ColorTween(
              begin: sequence[6][2].color,
              end: sequence[6][2].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color4,
            ColorTween(
              begin: sequence[6][3].color,
              end: sequence[6][3].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color5,
            ColorTween(
              begin: sequence[6][4].color,
              end: sequence[6][4].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color6,
            ColorTween(
              begin: sequence[6][5].color,
              end: sequence[6][5].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color7,
            ColorTween(
              begin: sequence[6][6].color,
              end: sequence[6][6].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color8,
            ColorTween(
              begin: sequence[6][7].color,
              end: sequence[6][7].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop1,
            Tween<double>(
              begin: sequence[6].first.stop,
              end: sequence[6].first.stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop2,
            Tween<double>(
              begin: sequence[6][1].stop,
              end: sequence[6][1].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop3,
            Tween<double>(
              begin: sequence[6][2].stop,
              end: sequence[6][2].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop4,
            Tween<double>(
              begin: sequence[6][3].stop,
              end: sequence[6][3].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop5,
            Tween<double>(
              begin: sequence[6][4].stop,
              end: sequence[6][4].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop6,
            Tween<double>(
              begin: sequence[6][5].stop,
              end: sequence[6][5].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop7,
            Tween<double>(
              begin: sequence[6][6].stop,
              end: sequence[6][6].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop8,
            Tween<double>(
              begin: sequence[6][7].stop,
              end: sequence[6][7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[7].begin,
        end: durationsArr[7].end,
      )
          .tween(
            BeachWaveAnimationKeys.waterMovement,
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color1,
            ColorTween(
              begin: sequence[7].first.color,
              end: sequence[7].first.color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color2,
            ColorTween(
              begin: sequence[7][1].color,
              end: sequence[7][1].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color3,
            ColorTween(
              begin: sequence[7][2].color,
              end: sequence[7][2].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color4,
            ColorTween(
              begin: sequence[7][3].color,
              end: sequence[7][3].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color5,
            ColorTween(
              begin: sequence[7][4].color,
              end: sequence[7][4].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color6,
            ColorTween(
              begin: sequence[7][5].color,
              end: sequence[7][5].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color7,
            ColorTween(
              begin: sequence[7][6].color,
              end: sequence[7][6].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.color8,
            ColorTween(
              begin: sequence[7][7].color,
              end: sequence[7][7].color,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop1,
            Tween<double>(
              begin: sequence[7].first.stop,
              end: sequence[7].first.stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop2,
            Tween<double>(
              begin: sequence[7][1].stop,
              end: sequence[7][1].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop3,
            Tween<double>(
              begin: sequence[7][2].stop,
              end: sequence[7][2].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop4,
            Tween<double>(
              begin: sequence[7][3].stop,
              end: sequence[7][3].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop5,
            Tween<double>(
              begin: sequence[7][4].stop,
              end: sequence[7][4].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop6,
            Tween<double>(
              begin: sequence[7][5].stop,
              end: sequence[7][5].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop7,
            Tween<double>(
              begin: sequence[7][6].stop,
              end: sequence[7][6].stop,
            ),
          )
          .tween(
            BeachWaveAnimationKeys.stop8,
            Tween<double>(
              begin: sequence[7][7].stop,
              end: sequence[7][7].stop,
            ),
          );
  }
}
