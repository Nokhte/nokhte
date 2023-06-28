import 'package:dartz/dartz.dart';
import 'package:primala/app/core/p2p_scheduling/constants/touch_types.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/p2p_scheduling_ordered_times_entity.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/spiral_circle_entity.dart';
import 'package:primala/app/core/p2p_scheduling/constants/spiral_selection_state_type.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/send_scheduling_request_param_entity.dart';

class ConstantEntities {
  static List<String> get orderedTimesArr => [
        '08:30',
        '09:00',
        '09:30',
        '10:00',
        '10:30',
        '11:00',
        '11:30',
        '12:00',
        '12:30',
        '13:00',
        '13:30',
        '14:00',
        '14:30',
        '15:00',
        '15:30',
        '16:00',
        '16:30',
        '17:00',
        '17:30',
        '18:00',
        '18:30',
        '19:00',
        '19:30',
        '20:00',
        '20:30',
        '21:00',
        '21:30',
        '22:00',
        '22:30',
        '23:00',
        '23:30',
        '00:00',
        '00:30',
        '01:00',
        '01:30',
        '02:00',
        '02:30',
        '03:00',
        '03:30',
        '04:00',
        '04:30',
        '05:00',
        '05:30',
        '06:00',
        '06:30',
        '07:00',
        '07:30',
        '08:00',
        '08:30',
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
