import 'package:flutter/material.dart';

class PentagonColors {
  static int get firstGradientColor => 0;
  static int get secondGradientColor => 1;
  static int get firstInterval => 0;
  static int get secondInterval => 1;
  static int get thirdInterval => 2;
  static int get fourthInterval => 3;
  static int get fifthInterval => 4;

  static List<List<Color>> get firstPentagonGradients => [
        // Pentagon 1 Interval 1
        [
          const Color(0xFFD9D9D9),
          const Color(0x000083FC),
        ],
        // Pentagon 1 Interval 2
        [
          const Color(0xFFD9D9D9),
          const Color(0x000083FC),
        ],
        // Pentagon 1 Interval 3
        [
          const Color(0xFFD9D9D9),
          const Color(0x006AFF97),
        ],
        // Pentagon 1 Interval 4
        [
          const Color(0xFFD9D9D9),
          const Color(0x005CFF00),
        ],
        // Pentagon 1 Interval 5
        [
          const Color(0xFFD9D9D9),
          const Color(0x0040FF40),
        ],
      ];
  static List<List<Color>> get secondPentagonGradients => [
        // Pentagon 2 Interval 1
        [
          const Color(0xFFD9D9D9),
          const Color(0x001400FF),
        ],
        // Pentagon 2 Interval 2
        [
          const Color(0xFFD9D9D9),
          const Color(0x00FD98FE),
        ],
        // Pentagon 2 Interval 3
        [
          const Color(0xFFD9D9D9),
          const Color(0x00976AFF),
        ],
        // Pentagon 2 Interval 4
        [
          const Color(0xFFD9D9D9),
          const Color(0x00005CFF),
        ],
        // Pentagon 2 Interval 5
        [
          const Color(0xFFD9D9D9),
          const Color(0x004040FF),
        ],
      ];
  static List<List<Color>> get thirdPentagonGradients => [
        // Pentagon 3 Interval 1
        [
          const Color(0xFFD9D9D9),
          const Color(0x004BC9FF),
        ],
        // Pentagon 3 Interval 2
        [
          const Color(0xFFFEFD98),
          const Color(0x3700FFA3),
        ],
        // Pentagon 3 Interval 3
        [
          const Color(0xFFFFBB6A),
          const Color(0x376AAEFF),
        ],
        // Pentagon 3 Interval 4
        [
          const Color(0xFFFF73A5),
          const Color(0x3700FFA3),
        ],
        // Pentagon 3 Interval 5
        [
          const Color(0xFFFF4040),
          const Color(0x3740FFFF),
        ],
      ];
}
