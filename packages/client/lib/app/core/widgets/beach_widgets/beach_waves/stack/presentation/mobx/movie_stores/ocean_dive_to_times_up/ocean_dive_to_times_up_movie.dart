import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/utils/time_allocator.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class OceanDiveToTimesUpMovie extends Equatable {
  static MovieTween getMovie({required Duration timerLength}) {
    final durationsArr = TimeAllocator.generateDurations(
        duration: timerLength, numIncrements: 8);

    return MovieTween()
      ..scene(
        begin: durationsArr.first.begin,
        end: durationsArr.first.end,
      )
          .tween(
            'water movement',
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            '1st Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.oceanDiveWater.first.color,
              end: WaterColorsAndStops.timesUpPhase1.first.color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.oceanDiveWater[1].color,
              end: WaterColorsAndStops.timesUpPhase1[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.oceanDiveWater[2].color,
              end: WaterColorsAndStops.timesUpPhase1[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.oceanDiveWater[3].color,
              end: WaterColorsAndStops.timesUpPhase1[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.oceanDiveWater[4].color,
              end: WaterColorsAndStops.timesUpPhase1[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.oceanDiveWater[5].color,
              end: WaterColorsAndStops.timesUpPhase1[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.oceanDiveWater[6].color,
              end: WaterColorsAndStops.timesUpPhase1[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.oceanDiveWater[7].color,
              end: WaterColorsAndStops.timesUpPhase1[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.oceanDiveWater.first.stop,
              end: WaterColorsAndStops.timesUpPhase1.first.stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.oceanDiveWater[1].stop,
              end: WaterColorsAndStops.timesUpPhase1[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.oceanDiveWater[2].stop,
              end: WaterColorsAndStops.timesUpPhase1[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.oceanDiveWater[3].stop,
              end: WaterColorsAndStops.timesUpPhase1[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.oceanDiveWater[4].stop,
              end: WaterColorsAndStops.timesUpPhase1[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.oceanDiveWater[5].stop,
              end: WaterColorsAndStops.timesUpPhase1[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.oceanDiveWater[6].stop,
              end: WaterColorsAndStops.timesUpPhase1[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.oceanDiveWater[7].stop,
              end: WaterColorsAndStops.timesUpPhase1[7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[1].begin,
        end: durationsArr[1].end,
      )
          .tween(
            'water movement',
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            '1st Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase1.first.color,
              end: WaterColorsAndStops.timesUpPhase2.first.color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase1[1].color,
              end: WaterColorsAndStops.timesUpPhase2[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase1[2].color,
              end: WaterColorsAndStops.timesUpPhase2[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase1[3].color,
              end: WaterColorsAndStops.timesUpPhase2[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase1[4].color,
              end: WaterColorsAndStops.timesUpPhase2[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase1[5].color,
              end: WaterColorsAndStops.timesUpPhase2[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase1[6].color,
              end: WaterColorsAndStops.timesUpPhase2[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase1[7].color,
              end: WaterColorsAndStops.timesUpPhase2[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase1.first.stop,
              end: WaterColorsAndStops.timesUpPhase2.first.stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase1[1].stop,
              end: WaterColorsAndStops.timesUpPhase2[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase1[2].stop,
              end: WaterColorsAndStops.timesUpPhase2[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase1[3].stop,
              end: WaterColorsAndStops.timesUpPhase2[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase1[4].stop,
              end: WaterColorsAndStops.timesUpPhase2[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase1[5].stop,
              end: WaterColorsAndStops.timesUpPhase2[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase1[6].stop,
              end: WaterColorsAndStops.timesUpPhase2[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase1[7].stop,
              end: WaterColorsAndStops.timesUpPhase2[7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[2].begin,
        end: durationsArr[2].end,
      )
          .tween(
            'water movement',
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            '1st Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase2.first.color,
              end: WaterColorsAndStops.timesUpPhase3.first.color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase2[1].color,
              end: WaterColorsAndStops.timesUpPhase3[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase2[2].color,
              end: WaterColorsAndStops.timesUpPhase3[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase2[3].color,
              end: WaterColorsAndStops.timesUpPhase3[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase2[4].color,
              end: WaterColorsAndStops.timesUpPhase3[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase2[5].color,
              end: WaterColorsAndStops.timesUpPhase3[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase2[6].color,
              end: WaterColorsAndStops.timesUpPhase3[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase2[7].color,
              end: WaterColorsAndStops.timesUpPhase3[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase2.first.stop,
              end: WaterColorsAndStops.timesUpPhase3.first.stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase2[1].stop,
              end: WaterColorsAndStops.timesUpPhase3[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase2[2].stop,
              end: WaterColorsAndStops.timesUpPhase3[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase2[3].stop,
              end: WaterColorsAndStops.timesUpPhase3[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase2[4].stop,
              end: WaterColorsAndStops.timesUpPhase3[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase2[5].stop,
              end: WaterColorsAndStops.timesUpPhase3[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase2[6].stop,
              end: WaterColorsAndStops.timesUpPhase3[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase2[7].stop,
              end: WaterColorsAndStops.timesUpPhase3[7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[3].begin,
        end: durationsArr[3].end,
      )
          .tween(
            'water movement',
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            '1st Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase3.first.color,
              end: WaterColorsAndStops.timesUpPhase4.first.color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase3[1].color,
              end: WaterColorsAndStops.timesUpPhase4[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase3[2].color,
              end: WaterColorsAndStops.timesUpPhase4[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase3[3].color,
              end: WaterColorsAndStops.timesUpPhase4[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase3[4].color,
              end: WaterColorsAndStops.timesUpPhase4[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase3[5].color,
              end: WaterColorsAndStops.timesUpPhase4[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase3[6].color,
              end: WaterColorsAndStops.timesUpPhase4[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase3[7].color,
              end: WaterColorsAndStops.timesUpPhase4[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase3.first.stop,
              end: WaterColorsAndStops.timesUpPhase4.first.stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase3[1].stop,
              end: WaterColorsAndStops.timesUpPhase4[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase3[2].stop,
              end: WaterColorsAndStops.timesUpPhase4[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase3[3].stop,
              end: WaterColorsAndStops.timesUpPhase4[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase3[4].stop,
              end: WaterColorsAndStops.timesUpPhase4[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase3[5].stop,
              end: WaterColorsAndStops.timesUpPhase4[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase3[6].stop,
              end: WaterColorsAndStops.timesUpPhase4[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase3[7].stop,
              end: WaterColorsAndStops.timesUpPhase4[7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[4].begin,
        end: durationsArr[4].end,
      )
          .tween(
            'water movement',
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            '1st Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase4.first.color,
              end: WaterColorsAndStops.timesUpPhase5.first.color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase4[1].color,
              end: WaterColorsAndStops.timesUpPhase5[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase4[2].color,
              end: WaterColorsAndStops.timesUpPhase5[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase4[3].color,
              end: WaterColorsAndStops.timesUpPhase5[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase4[4].color,
              end: WaterColorsAndStops.timesUpPhase5[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase4[5].color,
              end: WaterColorsAndStops.timesUpPhase5[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase4[6].color,
              end: WaterColorsAndStops.timesUpPhase5[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase4[7].color,
              end: WaterColorsAndStops.timesUpPhase5[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase4.first.stop,
              end: WaterColorsAndStops.timesUpPhase5.first.stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase4[1].stop,
              end: WaterColorsAndStops.timesUpPhase5[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase4[2].stop,
              end: WaterColorsAndStops.timesUpPhase5[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase4[3].stop,
              end: WaterColorsAndStops.timesUpPhase5[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase4[4].stop,
              end: WaterColorsAndStops.timesUpPhase5[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase4[5].stop,
              end: WaterColorsAndStops.timesUpPhase5[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase4[6].stop,
              end: WaterColorsAndStops.timesUpPhase5[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase4[7].stop,
              end: WaterColorsAndStops.timesUpPhase5[7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[5].begin,
        end: durationsArr[5].end,
      )
          .tween(
            'water movement',
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            '1st Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase5.first.color,
              end: WaterColorsAndStops.timesUpPhase6.first.color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase5[1].color,
              end: WaterColorsAndStops.timesUpPhase6[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase5[2].color,
              end: WaterColorsAndStops.timesUpPhase6[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase5[3].color,
              end: WaterColorsAndStops.timesUpPhase6[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase5[4].color,
              end: WaterColorsAndStops.timesUpPhase6[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase5[5].color,
              end: WaterColorsAndStops.timesUpPhase6[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase5[6].color,
              end: WaterColorsAndStops.timesUpPhase6[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase5[7].color,
              end: WaterColorsAndStops.timesUpPhase6[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase5.first.stop,
              end: WaterColorsAndStops.timesUpPhase6.first.stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase5[1].stop,
              end: WaterColorsAndStops.timesUpPhase6[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase5[2].stop,
              end: WaterColorsAndStops.timesUpPhase6[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase5[3].stop,
              end: WaterColorsAndStops.timesUpPhase6[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase5[4].stop,
              end: WaterColorsAndStops.timesUpPhase6[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase5[5].stop,
              end: WaterColorsAndStops.timesUpPhase6[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase5[6].stop,
              end: WaterColorsAndStops.timesUpPhase6[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase5[7].stop,
              end: WaterColorsAndStops.timesUpPhase6[7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[6].begin,
        end: durationsArr[6].end,
      )
          .tween(
            'water movement',
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            '1st Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase6.first.color,
              end: WaterColorsAndStops.timesUpPhase7.first.color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase6[1].color,
              end: WaterColorsAndStops.timesUpPhase7[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase6[2].color,
              end: WaterColorsAndStops.timesUpPhase7[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase6[3].color,
              end: WaterColorsAndStops.timesUpPhase7[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase6[4].color,
              end: WaterColorsAndStops.timesUpPhase7[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase6[5].color,
              end: WaterColorsAndStops.timesUpPhase7[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase6[6].color,
              end: WaterColorsAndStops.timesUpPhase7[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase6[7].color,
              end: WaterColorsAndStops.timesUpPhase7[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase6.first.stop,
              end: WaterColorsAndStops.timesUpPhase7.first.stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase6[1].stop,
              end: WaterColorsAndStops.timesUpPhase7[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase6[2].stop,
              end: WaterColorsAndStops.timesUpPhase7[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase6[3].stop,
              end: WaterColorsAndStops.timesUpPhase7[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase6[4].stop,
              end: WaterColorsAndStops.timesUpPhase7[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase6[5].stop,
              end: WaterColorsAndStops.timesUpPhase7[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase6[6].stop,
              end: WaterColorsAndStops.timesUpPhase7[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase6[7].stop,
              end: WaterColorsAndStops.timesUpPhase7[7].stop,
            ),
          )
      ..scene(
        begin: durationsArr[7].begin,
        end: durationsArr[7].end,
      )
          .tween(
            'water movement',
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            '1st Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase7.first.color,
              end: WaterColorsAndStops.timesUpPhase8.first.color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase7[1].color,
              end: WaterColorsAndStops.timesUpPhase8[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase7[2].color,
              end: WaterColorsAndStops.timesUpPhase8[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase7[3].color,
              end: WaterColorsAndStops.timesUpPhase8[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase7[4].color,
              end: WaterColorsAndStops.timesUpPhase8[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase7[5].color,
              end: WaterColorsAndStops.timesUpPhase8[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase7[6].color,
              end: WaterColorsAndStops.timesUpPhase8[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: WaterColorsAndStops.timesUpPhase7[7].color,
              end: WaterColorsAndStops.timesUpPhase8[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase7.first.stop,
              end: WaterColorsAndStops.timesUpPhase8.first.stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase7[1].stop,
              end: WaterColorsAndStops.timesUpPhase8[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase7[2].stop,
              end: WaterColorsAndStops.timesUpPhase8[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase7[3].stop,
              end: WaterColorsAndStops.timesUpPhase8[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase7[4].stop,
              end: WaterColorsAndStops.timesUpPhase8[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase7[5].stop,
              end: WaterColorsAndStops.timesUpPhase8[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase7[6].stop,
              end: WaterColorsAndStops.timesUpPhase8[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase7[7].stop,
              end: WaterColorsAndStops.timesUpPhase8[7].stop,
            ),
          );
  }

  @override
  List<Object> get props => [];
}
