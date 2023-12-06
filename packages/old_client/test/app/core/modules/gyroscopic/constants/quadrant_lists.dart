import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';

class QuadrantLists {
  static List<QuadrantInfo> get dayList => [
        const QuadrantInfo(startingAngle: 0, endingAngle: 89),
        const QuadrantInfo(startingAngle: 90, endingAngle: 179),
        const QuadrantInfo(startingAngle: 180, endingAngle: 269),
        const QuadrantInfo(startingAngle: 270, endingAngle: 359)
      ];
  static List<QuadrantInfo> get timeList => [
        const QuadrantInfo(startingAngle: 0, endingAngle: 59),
        const QuadrantInfo(startingAngle: 60, endingAngle: 119),
        const QuadrantInfo(startingAngle: 120, endingAngle: 179),
        const QuadrantInfo(startingAngle: 180, endingAngle: 239),
        const QuadrantInfo(startingAngle: 240, endingAngle: 299),
        const QuadrantInfo(startingAngle: 300, endingAngle: 359),
        const QuadrantInfo(startingAngle: 360, endingAngle: 419),
        const QuadrantInfo(startingAngle: 420, endingAngle: 479),
        const QuadrantInfo(startingAngle: 480, endingAngle: 539),
        const QuadrantInfo(startingAngle: 540, endingAngle: 599),
        const QuadrantInfo(startingAngle: 600, endingAngle: 659),
        const QuadrantInfo(startingAngle: 660, endingAngle: 719),
        const QuadrantInfo(startingAngle: 720, endingAngle: 779),
        const QuadrantInfo(startingAngle: 780, endingAngle: 839),
        const QuadrantInfo(startingAngle: 840, endingAngle: 899),
        const QuadrantInfo(startingAngle: 900, endingAngle: 959),
        const QuadrantInfo(startingAngle: 960, endingAngle: 1019),
        const QuadrantInfo(startingAngle: 1020, endingAngle: 1079),
        const QuadrantInfo(startingAngle: 1080, endingAngle: 1139),
        const QuadrantInfo(startingAngle: 1140, endingAngle: 1199),
        const QuadrantInfo(startingAngle: 1200, endingAngle: 1259),
        const QuadrantInfo(startingAngle: 1260, endingAngle: 1319),
        const QuadrantInfo(startingAngle: 1320, endingAngle: 1379),
        const QuadrantInfo(startingAngle: 1380, endingAngle: 1439)
      ];
}
