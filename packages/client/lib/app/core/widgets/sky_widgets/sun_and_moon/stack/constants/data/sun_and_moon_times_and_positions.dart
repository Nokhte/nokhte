import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/stack/constants/types/position_and_duration.dart';

class SunAndMoonTimesAndPositions {
  static PositionAndDuration get ninePM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -440,
      ); //✅
  static PositionAndDuration get tenPM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -480,
      ); //✅
  static PositionAndDuration get elevenPM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -520,
      ); //✅
  static PositionAndDuration get twelveAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -560,
      ); //✅
  static PositionAndDuration get oneAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -585,
      ); //✅
  static PositionAndDuration get twoAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -560,
      ); //✅
  static PositionAndDuration get threeAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -535,
      ); //✅
  static PositionAndDuration get fourAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -490,
      ); //✅
  static PositionAndDuration get fiveAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -460,
      ); //✅
  static PositionAndDuration get sixAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get sevenAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get eightAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get nineAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get tenAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get elevenAM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get twelvePM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get onePM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get twoPM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get threePM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get fourPM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get fivePM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get sixPM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get sevenPM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );
  static PositionAndDuration get eightPM => PositionAndDuration(
        bigMovementStartTime: Seconds.get(3),
        bigMovementEndTime: Seconds.get(8),
        endingPostion: -380,
      );

  static Map<int, PositionAndDuration> get timeMap => {
        0: twelveAM,
        1: oneAM,
        2: twoAM,
        3: threeAM,
        4: fourAM,
        5: fiveAM,
        6: sixAM,
        7: sevenAM,
        8: eightAM,
        9: nineAM,
        10: tenAM,
        11: elevenAM,
        12: twelveAM,
        13: onePM,
        14: twoPM,
        15: threePM,
        16: fourPM,
        17: fivePM,
        18: sixPM,
        19: sevenPM,
        20: eightPM,
        21: ninePM,
        22: tenPM,
        23: elevenPM,
        24: twelveAM,
      };
}
