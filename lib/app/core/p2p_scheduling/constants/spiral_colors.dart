import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/p2p_scheduling_canvas_entity.dart';

class SpiralColors {
  static Map<String,
          Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>>
      get timeColorsMapping => {
// ✅

            "00:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x000E2242).withOpacity(1),
                  const Color(0x00020435).withOpacity(1),
                ],
                stops: [
                  0,
                  .7,
                  1,
                ],
              ),
            ),

// ✅
            "00:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x000E213F).withOpacity(1),
                  const Color(0x00122C53).withOpacity(1),
                ],
                stops: [
                  .8,
                  1,
                ],
              ),
            ),

//✅

            "00:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x0015325E).withOpacity(1),
                ],
                stops: [
                  .78,
                  1,
                ],
              ),
            ),

// ✅
            "00:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x0015315D).withOpacity(1),
                ],
                stops: [
                  .75,
                  1,
                ],
              ),
            ),

// ✅

            "01:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x00132D55).withOpacity(1),
                  const Color(0x00173767).withOpacity(1),
                ],
                stops: [
                  0,
                  .7,
                  1,
                ],
              ),
            ),

// ✅
            "01:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x0014305B).withOpacity(1),
                  const Color(0x001A3E74).withOpacity(1),
                ],
                stops: [
                  0,
                  .7,
                  1,
                ],
              ),
            ),

// ✅

            "01:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x00142F5A).withOpacity(1),
                  const Color(0x002B417C).withOpacity(1),
                ],
                stops: [
                  0,
                  .7,
                  1,
                ],
              ),
            ),

// ✅

            "01:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00173767).withOpacity(1),
                  const Color(0x00183B6E).withOpacity(1),
                  const Color(0x001C427C).withOpacity(1),
                ],
                stops: [
                  0,
                  .7,
                  1,
                ],
              ),
            ),

// ✅
            "02:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x001B417B).withOpacity(1),
                  const Color(0x00173768).withOpacity(1),
                  const Color(0x001B3E79).withOpacity(1),
                ],
                stops: [
                  .3,
                  .65,
                  1,
                ],
              ),
            ),

// ✅
            "02:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x001B3E79).withOpacity(1),
                  // const Color(0x00).withOpacity(1),
                  // const Color(0x00).withOpacity(1),
                ],
                stops: [
                  .6,
                  1,
                ],
              ),
            ),

// ✅

            "02:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x00214893).withOpacity(1),
                ],
                stops: [
                  .6,
                  1,
                ],
              ),
            ),

// ✅
            "02:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x00234A9B).withOpacity(1),
                ],
                stops: [
                  .6,
                  1,
                ],
              ),
            ),

// ✅

            "03:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x00193673).withOpacity(1),
                  const Color(0x00264DA9).withOpacity(1),
                ],
                stops: [
                  0,
                  .55,
                  1,
                ],
              ),
            ),

// ✅

            "03:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x00193874).withOpacity(1),
                  const Color(0x002E55C7).withOpacity(1),
                ],
                stops: [
                  0,
                  .75,
                  1,
                ],
              ),
            ),

// ✅

            "03:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x001A3A76).withOpacity(1),
                  const Color(0x003961F6).withOpacity(1),
                ],
                stops: [
                  0,
                  .65,
                  1,
                ],
              ),
            ),

// ✅

            "03:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003A62FA).withOpacity(1),
                  const Color(0x003961F8).withOpacity(1),
                  const Color(0x001030A9).withOpacity(1),
                ],
                stops: [
                  0,
                  .55,
                  1,
                ],
              ),
            ),

// ✅
            "04:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003A62FA).withOpacity(1),
                  const Color(0x003960F8).withOpacity(1),
                  const Color(0x001637B4).withOpacity(1),
                  const Color(0x001030A9).withOpacity(1),
                ],
                stops: [
                  0,
                  .5,
                  .75,
                  1,
                ],
              ),
            ),

// ✅

            "04:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00102FA9).withOpacity(1),
                  const Color(0x000434EC).withOpacity(1),
                  const Color(0x003770F8).withOpacity(1),
                ],
                stops: [
                  .5,
                  .7,
                  1,
                ],
              ),
            ),

// ✅

            "04:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00102FA9).withOpacity(1),
                  const Color(0x000334F1).withOpacity(1),
                  const Color(0x003973F7).withOpacity(1),
                ],
                stops: [
                  .5,
                  .8,
                  1,
                ],
              ),
            ),

// ✅
            "04:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00102FA9).withOpacity(1),
                  const Color(0x000235F7).withOpacity(1),
                  const Color(0x0070AEEF).withOpacity(1),
                ],
                stops: [
                  .5,
                  .75,
                  1,
                ],
              ),
            ),

// ✅

            "05:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00102FA9).withOpacity(1),
                  const Color(0x000235FA).withOpacity(1),
                  const Color(0x008AC9EC).withOpacity(1),
                ],
                stops: [
                  .4,
                  .65,
                  1,
                ],
              ),
            ),

// ✅

            "05:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00102FA9).withOpacity(1),
                  const Color(0x00083DFF).withOpacity(1),
                  const Color(0x0086C6EC).withOpacity(1),
                ],
                stops: [
                  .3,
                  .5,
                  1,
                ],
              ),
            ),

// ✅

            "05:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00102FA9).withOpacity(1),
                  const Color(0x000235F7).withOpacity(1),
                  const Color(0x0091D1EB).withOpacity(1),
                ],
                stops: [
                  .3,
                  .35,
                  1,
                ],
              ),
            ),

// ✅

            "05:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x000135FF).withOpacity(1),
                  const Color(0x00427CF6).withOpacity(1),
                  const Color(0x0091D1EB).withOpacity(1),
                ],
                stops: [
                  .3,
                  .5,
                  1,
                ],
              ),
            ),

// ✅
            "06:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x007AB8EE).withOpacity(1),
                  const Color(0x0091D1EB).withOpacity(1),
                ],
                stops: [
                  .55,
                  .85,
                  1,
                ],
              ),
            ),

// ✅
            "06:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x005F9BF2).withOpacity(1),
                  const Color(0x0091D1EB).withOpacity(1),
                ],
                stops: [
                  .5,
                  .7,
                  .85,
                ],
              ),
            ),

// ✅

            "06:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0060A5F0).withOpacity(1),
                  const Color(0x0091D1EB).withOpacity(1),
                ],
                stops: [
                  .3,
                  .65,
                  .9,
                ],
              ),
            ),

// ✅
            "06:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x005D99F2).withOpacity(1),
                  const Color(0x0089C9EC).withOpacity(1),
                ],
                stops: [
                  .35,
                  .5,
                  .9,
                ],
              ),
            ),

// ✅

            "07:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x005F9BF2).withOpacity(1),
                  const Color(0x0090D0EB).withOpacity(1),
                ],
                stops: [
                  0,
                  .55,
                  1,
                ],
              ),
            ),

// ✅
            "07:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0088CAEB).withOpacity(1),
                  const Color(0x00BCB28D).withOpacity(1),
                ],
                stops: [
                  .4,
                  .85,
                  .97,
                ],
              ),
            ),

// ✅

            "07:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0084C4EC).withOpacity(1),
                  const Color(0x00DF9A43).withOpacity(1),
                ],
                stops: [
                  .4,
                  .81,
                  .91,
                ],
              ),
            ),

// ✅

            "07:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0089C8EC).withOpacity(1),
                  const Color(0x00E59636).withOpacity(1),
                ],
                stops: [
                  .4,
                  .72,
                  .82,
                ],
              ),
            ),

// ✅
            "08:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0084C3EC).withOpacity(1),
                  const Color(0x00E69533).withOpacity(1),
                ],
                stops: [
                  .3,
                  .6,
                  .8,
                ],
              ),
            ),

// ✅
            "08:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0091D0E9).withOpacity(1),
                  const Color(0x00FB961C).withOpacity(1),
                ],
                stops: [
                  .2,
                  .5,
                  .8,
                ],
              ),
            ),

// ✅

            "08:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0093CFE5).withOpacity(1),
                  const Color(0x00F8971C).withOpacity(1),
                ],
                stops: [
                  .2,
                  .45,
                  .8,
                ],
              ),
            ),

// ✅
            "08:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0093CFE6).withOpacity(1),
                  const Color(0x00FB961C).withOpacity(1),
                ],
                stops: [
                  .2,
                  .35,
                  .85,
                ],
              ),
            ),

// ✅

            "09:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FB971C).withOpacity(1),
                  const Color(0x00FDB237).withOpacity(1),
                ],
                stops: [
                  .5,
                  .85,
                ],
              ),
            ),

// ✅
            "09:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FB971C).withOpacity(1),
                  const Color(0x00FEC349).withOpacity(1),
                ],
                stops: [
                  .5,
                  .95,
                ],
              ),
            ),

// ✅

            "09:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FB971C).withOpacity(1),
                  const Color(0x00FFCD52).withOpacity(1),
                ],
                stops: [
                  .5,
                  .95,
                ],
              ),
            ),

// ✅
            "09:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FB971C).withOpacity(1),
                  const Color(0x00FFD95E).withOpacity(1),
                ],
                stops: [
                  .5,
                  .95,
                ],
              ),
            ),

// ✅

            "10:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFCD52).withOpacity(1),
                  const Color(0x00FFDA7D).withOpacity(1),
                ],
                stops: [
                  .85,
                  .98,
                ],
              ),
            ),

// ✅
            "10:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFCD52).withOpacity(1),
                  const Color(0x00FFE06D).withOpacity(1),
                ],
                stops: [
                  .75,
                  .98,
                ],
              ),
            ),

// ✅

            "10:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFDD89).withOpacity(1),
                  const Color(0x00FFCF5A).withOpacity(1),
                  const Color(0x00FFDF64).withOpacity(1),
                ],
                stops: [
                  .5,
                  .8,
                  1,
                ],
              ),
            ),

// ✅
            "10:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFCD52).withOpacity(1),
                  const Color(0x00FFF67C).withOpacity(1),
                ],
                stops: [
                  .7,
                  1,
                ],
              ),
            ),

// ✅

            "11:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FECC51).withOpacity(1),
                  const Color(0x00FFED73).withOpacity(1),
                ],
                stops: [
                  .6,
                  1,
                ],
              ),
            ),

// ✅
            "11:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFCD52).withOpacity(1),
                  const Color(0x00FFF26D).withOpacity(1),
                ],
                stops: [
                  .55,
                  1,
                ],
              ),
            ),

// ✅

            "11:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFF57A).withOpacity(1),
                  const Color(0x00FFE944).withOpacity(1),
                ],
                stops: [
                  .55,
                  .9,
                ],
              ),
            ),

// ✅
            "11:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFEF5E).withOpacity(1),
                  // Color.fromARGB(0, 0, 0, 0).withOpacity(1),
                  const Color(0x00FFF210).withOpacity(1),
                ],
                stops: [
                  .4,
                  .7,
                ],
              ),
            ),

// ✅

            "12:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  // Color.fromARGB(0, 0, 0, 0).withOpacity(1),
                  const Color(0x00FFEF5E).withOpacity(1),
                  const Color(0x00FFF801).withOpacity(1),
                ],
                stops: [
                  .3,
                  .71,
                ],
              ),
            ),

// ✅
            "12:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFEF5E).withOpacity(1),
                  const Color(0x00FFEC1E).withOpacity(1),
                  const Color(0x00FFF801).withOpacity(1),
                ],
                stops: [
                  .4,
                  .7,
                  1,
                ],
              ),
            ),

// ✅

            "12:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFF702).withOpacity(1),
                  const Color(0x00FFEA22).withOpacity(1),
                ],
                stops: [
                  .4,
                  .98,
                ],
              ),
            ),

// ✅
            "12:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFE630).withOpacity(1),
                  const Color(0x00FFC43B).withOpacity(1),
                ],
                stops: [
                  .87,
                  .95,
                ],
              ),
            ),

// ✅

            "13:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFEB2F).withOpacity(1),
                  const Color(0x00FFBD3E).withOpacity(1),
                ],
                stops: [
                  .8,
                  .95,
                ],
              ),
            ),

// ✅
            "13:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFE430).withOpacity(1),
                  const Color(0x00FFBB3F).withOpacity(1),
                ],
                stops: [
                  .8,
                  .95,
                ],
              ),
            ),

// ✅

            "13:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFE430).withOpacity(1),
                  const Color(0x00FFAC44).withOpacity(1),
                ],
                stops: [
                  .8,
                  .97,
                ],
              ),
            ),

// ✅
            "13:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFE430).withOpacity(1),
                  const Color(0x00FF984B).withOpacity(1),
                ],
                stops: [
                  .6,
                  1,
                ],
              ),
            ),

// ✅

            "14:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFE430).withOpacity(1),
                  const Color(0x00FF904E).withOpacity(1),
                ],
                stops: [
                  .54,
                  1,
                ],
              ),
            ),

// ✅
            "14:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFE430).withOpacity(1),
                  const Color(0x00FF994B).withOpacity(1),
                  const Color(0x00FF9034).withOpacity(1),
                ],
                stops: [
                  .5,
                  .8,
                  1,
                ],
              ),
            ),

// ✅

            "14:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFA746).withOpacity(1),
                  const Color(0x00FE6F1A).withOpacity(1),
                ],
                stops: [
                  .6,
                  .95,
                ],
              ),
            ),

// ✅
            "14:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FEC333).withOpacity(1),
                  const Color(0x00FD7829).withOpacity(1),
                  const Color(0x00F84B33).withOpacity(1),
                ],
                stops: [
                  .4,
                  .9,
                  1,
                ],
              ),
            ),

// ✅

            "15:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FEC333).withOpacity(1),
                  const Color(0x00FD7627).withOpacity(1),
                  const Color(0x00F74439).withOpacity(1),
                ],
                stops: [
                  .4,
                  .85,
                  1,
                ],
              ),
            ),

// ✅ EHH come back
            "15:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FA6137).withOpacity(1),
                  const Color(0x00F74A38).withOpacity(1),
                  const Color(0x00FA695F).withOpacity(1),
                ],
                stops: [
                  .7,
                  .85,
                  1,
                ],
              ),
            ),

// ✅

            "15:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FB6D36).withOpacity(1),
                  const Color(0x00F74A38).withOpacity(1),
                  const Color(0x00FB736A).withOpacity(1),
                ],
                stops: [
                  .7,
                  .85,
                  1,
                ],
              ),
            ),

// ✅
            "15:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FE9C64).withOpacity(1),
                  const Color(0x00FD8475).withOpacity(1),
                  const Color(0x00FF742B).withOpacity(1),
                  const Color(0x00FE4130).withOpacity(1),
                ],
                stops: [
                  .5,
                  .7,
                  .85,
                  1,
                ],
              ),
            ),

// ✅

            "16:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FD7E70).withOpacity(1),
                  // Color.fromARGB(0, 0, 0, 0).withOpacity(1),
                  const Color(0x00FF701E).withOpacity(1),
                  const Color(0x00FD2B39).withOpacity(1),
                ],
                stops: [
                  .5,
                  .6,
                  .89,
                ],
              ),
            ),

// ✅
            "16:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FF6F1F).withOpacity(1),
                  const Color(0x00FF313E).withOpacity(1),
                  const Color(0x00EB257E).withOpacity(1),
                ],
                stops: [
                  .58,
                  .75,
                  .97,
                ],
              ),
            ),

// ✅

            "16:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FF5A29).withOpacity(1),
                  const Color(0x00FF2344).withOpacity(1),
                  const Color(0x00DF2F9D).withOpacity(1),
                ],
                stops: [
                  .58,
                  .75,
                  .95,
                ],
              ),
            ),

// ✅
            "16:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FC5566).withOpacity(1),
                  const Color(0x00DF3690).withOpacity(1),
                  const Color(0x00AF369B).withOpacity(1),
                ],
                stops: [
                  .45,
                  .75,
                  1,
                ],
              ),
            ),

// ✅

            "17:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FCB09B).withOpacity(1),
                  const Color(0x00FE144E).withOpacity(1),
                  const Color(0x00DD3A96).withOpacity(1),
                  const Color(0x00B839AA).withOpacity(1), // modify to visuals
                ],
                stops: [
                  .45,
                  .55,
                  .75,
                  1,
                ],
              ),
            ),

// ✅
            "17:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FF3258).withOpacity(1),
                  const Color(0x00E12C94).withOpacity(1),
                  const Color(0x00953DA7).withOpacity(1),
                ],
                stops: [
                  .45,
                  .65,
                  .9,
                ],
              ),
            ),

// ✅

            "17:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00D935AE).withOpacity(1),
                  const Color(0x00CC36AC).withOpacity(1),
                  const Color(0x005D43A0).withOpacity(1),
                ],
                stops: [
                  .45,
                  .65,
                  .9,
                ],
              ),
            ),

// ✅
            "17:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x004C459F).withOpacity(1),
                  const Color(0x007851A9).withOpacity(1),
                  const Color(0x003D409C).withOpacity(1),
                ],
                stops: [
                  0,
                  .6,
                  1,
                ],
              ),
            ),

// ✅

            "18:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x007551A9).withOpacity(1),
                  const Color(0x00203895).withOpacity(1),
                ],
                stops: [
                  .6,
                  1,
                ],
              ),
            ),

// ✅
            "18:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x007952AA).withOpacity(1),
                  const Color(0x00203895).withOpacity(1),
                ],
                stops: [
                  .6,
                  1,
                ],
              ),
            ),

// ✅

            "18:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00714FAB).withOpacity(1),
                  const Color(0x00223895).withOpacity(1),
                ],
                stops: [
                  .6,
                  1,
                ],
              ),
            ),

// ✅
            "18:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x007952AA).withOpacity(1),
                  const Color(0x00182A6E).withOpacity(1),
                  // Color.fromARGB(0, 4, 226, 93).withOpacity(1),
                ],
                stops: [
                  .3,
                  1,
                ],
              ),
            ),

// ✅

            "19:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00203395).withOpacity(1),
                  // Color.fromARGB(0, 51, 255, 40).withOpacity(1),
                  const Color(0x00162767).withOpacity(1),
                ],
                stops: [
                  .3,
                  .7,
                ],
              ),
            ),

// ✅
            "19:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00203895).withOpacity(1),
                  const Color(0x00162767).withOpacity(1),
                ],
                stops: [
                  .52,
                  .8,
                ],
              ),
            ),

// ✅

            "19:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x004C459F).withOpacity(1),
                  const Color(0x001A296B).withOpacity(1),
                  const Color(0x00193573).withOpacity(1),
                ],
                stops: [
                  0,
                  .8,
                  .9,
                ],
              ),
            ),

// ✅
            "19:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x002D3480).withOpacity(1),
                  const Color(0x00162868).withOpacity(1),
                  const Color(0x00183270).withOpacity(1),
                ],
                stops: [
                  .4,
                  .6,
                  .8,
                ],
              ),
            ),

// ✅

            "20:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x002E3480).withOpacity(1),
                  const Color(0x001C2A6D).withOpacity(1),
                  const Color(0x001A3C78).withOpacity(1),
                ],
                stops: [
                  .5,
                  .6,
                  .9,
                ],
              ),
            ),

// ✅
            "20:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x001B3F7A).withOpacity(1),
                ],
                stops: [
                  .7,
                  1,
                ],
              ),
            ),

// ✅

            "20:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x001C427C).withOpacity(1),
                ],
                stops: [
                  .7,
                  1,
                ],
              ),
            ),

// ✅

            "20:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x001C427C).withOpacity(1),
                ],
                stops: [
                  .5,
                  .8,
                ],
              ),
            ),

// ✅

            "21:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00172F6D).withOpacity(1),
                  const Color(0x001B3E79).withOpacity(1),
                ],
                stops: [
                  .5,
                  .8,
                ],
              ),
            ),

// ✅
            "21:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00172E6C).withOpacity(1),
                  const Color(0x001B3F79).withOpacity(1),
                ],
                stops: [
                  .5,
                  .8,
                ],
              ),
            ),

// ✅

            "21:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x001C427C).withOpacity(1),
                  const Color(0x001B3D71).withOpacity(1),
                  // Color.fromARGB(0, 27, 113, 70).withOpacity(1),
                ],
                stops: [
                  .7,
                  .95,
                ],
              ),
            ),

// ✅

            "21:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x001C427C).withOpacity(1),
                  const Color(0x00173767).withOpacity(1),
                ],
                stops: [
                  .85,
                  .95,
                ],
              ),
            ),

// ✅

            "22:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x001C427C).withOpacity(1),
                  const Color(0x00173767).withOpacity(1),
                ],
                stops: [
                  .8,
                  .95,
                ],
              ),
            ),

// ✅

            "22:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x001C427C).withOpacity(1),
                  const Color(0x00122A4F).withOpacity(1),
                ],
                stops: [
                  .75,
                  .95,
                ],
              ),
            ),

// ✅

            "22:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00173767).withOpacity(1),
                  const Color(0x00193C71).withOpacity(1),
                  const Color(0x00122A51).withOpacity(1),
                ],
                stops: [
                  .3,
                  .68,
                  .88,
                ],
              ),
            ),

// ✅

            "22:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x001C427C).withOpacity(1),
                  const Color(0x00102B56).withOpacity(1),
                ],
                stops: [
                  .58,
                  .83,
                ],
              ),
            ),

// ✅

            "23:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x001C427C).withOpacity(1),
                  const Color(0x000E2241).withOpacity(1),
                ],
                stops: [
                  .49,
                  .83,
                ],
              ),
            ),

// ✅
            "23:15": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x000E213F).withOpacity(1),
                ],
                stops: [
                  .75,
                  .85,
                ],
              ),
            ),

// ✅

            "23:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x000E213F).withOpacity(1),
                ],
                stops: [
                  .75,
                  .85,
                ],
              ),
            ),

// ✅

            "23:45": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x000E213F).withOpacity(1),
                ],
                stops: [
                  .75,
                  .85,
                ],
              ),
            ),
          };
}
