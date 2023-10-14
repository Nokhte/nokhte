import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/stack/constants/types/position_and_duration.dart';

class SunAndMoonTimesAndPositions {
  static Position get ninePM => const Position(
        endingPostion: -440,
      ); //✅
  static Position get tenPM => const Position(
        endingPostion: -480,
      ); //✅
  static Position get elevenPM => const Position(
        endingPostion: -520,
      ); //✅
  static Position get twelveAM => const Position(
        endingPostion: -560,
      ); //✅
  static Position get oneAM => const Position(
        endingPostion: -585,
      ); //✅
  static Position get twoAM => const Position(
        endingPostion: -560,
      ); //✅
  static Position get threeAM => const Position(
        endingPostion: -535,
      ); //✅
  static Position get fourAM => const Position(
        endingPostion: -490,
      ); //✅
  static Position get fiveAM => const Position(
        endingPostion: -460,
      ); //✅
  static Position get sixAM => const Position(
        endingPostion: -350,
      ); //✅
  static Position get sevenAM => const Position(
        endingPostion: -460,
      ); //✅
  static Position get eightAM => const Position(
        endingPostion: -490,
      ); //✅
  static Position get nineAM => const Position(
        endingPostion: -510,
      ); //✅
  static Position get tenAM => const Position(
        endingPostion: -380,
      );
  static Position get elevenAM => const Position(
        endingPostion: -380,
      );
  static Position get twelvePM => const Position(
        endingPostion: -380,
      );
  static Position get onePM => const Position(
        endingPostion: -380,
      );
  static Position get twoPM => const Position(
        endingPostion: -380,
      );
  static Position get threePM => const Position(
        endingPostion: -380,
      );
  static Position get fourPM => const Position(
        endingPostion: -380,
      );
  static Position get fivePM => const Position(
        endingPostion: -380,
      );
  static Position get sixPM => const Position(
        endingPostion: -380,
      );
  static Position get sevenPM => const Position(
        endingPostion: -380,
      );
  static Position get eightPM => const Position(
        endingPostion: -380,
      );

  static Map<int, Position> get timeMap => {
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
