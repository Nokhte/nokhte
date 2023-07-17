import 'package:primala/app/core/p2p_scheduling/constants/touch_types.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/p2p_scheduling_ordered_times_entity.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/spiral_circle_entity.dart';

class ConstantEntities {
  static List<String> get orderedTimesArr => [
        '08:45',
        '09:00',
        '09:15',
        '09:30',
        '09:45',
        '10:00',
        '10:15',
        '10:30',
        '10:45',
        '11:00',
        '11:15',
        '11:30',
        '11:45',
        '12:00',
        '12:15',
        '12:30',
        '12:45',
        '13:00',
        '13:15',
        '13:30',
        '13:45',
        '14:00',
        '14:15',
        '14:30',
        '14:45',
        '15:00',
        '15:15',
        '15:30',
        '15:45',
        '16:00',
        '16:15',
        '16:30',
        '16:45',
        '17:00',
        '17:15',
        '17:30',
        '17:45',
        '18:00',
        '18:15',
        '18:30',
        '18:45',
        '19:00',
        '19:15',
        '19:30',
        '19:45',
        '20:00',
        '20:15',
        '20:30',
        '20:45',
      ];

  static P2PSchedulingOrderedTimesEntity get orderedTimesEntity =>
      P2PSchedulingOrderedTimesEntity(
          orderedTimesArr: ConstantEntities.orderedTimesArr);

  // % RANGES
  static SpiralCircleEntity get t1stRangeTouchPayload =>
      const SpiralCircleEntity(touchType: TouchTypes.panDown, hrTime: "08:00");
  static SpiralCircleEntity get t2ndRangeTouchPayload =>
      const SpiralCircleEntity(
          touchType: TouchTypes.panUpdate, hrTime: "08:30");
  static SpiralCircleEntity get t3rdRangeTouchPayload =>
      const SpiralCircleEntity(touchType: TouchTypes.panDown, hrTime: "10:00");
  static SpiralCircleEntity get t4thRangeTouchPayload =>
      const SpiralCircleEntity(
          touchType: TouchTypes.panUpdate, hrTime: "10:30");
  static SpiralCircleEntity get t5thRangeTouchPayload =>
      const SpiralCircleEntity(
          touchType: TouchTypes.panUpdate, hrTime: "11:00");
  // % SINGLE
  static SpiralCircleEntity get t1stSingleTouchPayload =>
      const SpiralCircleEntity(touchType: TouchTypes.tapDown, hrTime: "08:00");
  static SpiralCircleEntity get t2ndSingeTouchPayload =>
      const SpiralCircleEntity(touchType: TouchTypes.tapDown, hrTime: "08:30");
  static SpiralCircleEntity get t3rdSingleTouchPayload =>
      const SpiralCircleEntity(touchType: TouchTypes.tapDown, hrTime: "10:00");
  static SpiralCircleEntity get t4thSingleTouchPayload =>
      const SpiralCircleEntity(touchType: TouchTypes.tapDown, hrTime: "10:30");
  static SpiralCircleEntity get t5thSingleTouchPayload =>
      const SpiralCircleEntity(touchType: TouchTypes.tapDown, hrTime: "11:00");

  static String get june19th8AM => '2023-06-19T08:00:00.000';

  static String get june19th830AM => '2023-06-19T08:30:00.000';

  static String get june19th10AM => '2023-06-19T10:00:00.000';

  static String get june19th1030AM => '2023-06-19T10:30:00.000';

  static String get june19th11AM => '2023-06-19T11:00:00.000';
}
