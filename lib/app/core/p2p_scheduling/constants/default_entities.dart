import 'package:dartz/dartz.dart';
import 'package:primala/app/core/p2p_scheduling/utils/time_converter.dart';

import 'spiral_selection_state_type.dart';

class DefaultP2PScheduling {
  static SpiralSelectionState get rangeEntity => Left([]);
  static SpiralSelectionState get singleTimeEntity => const Right('');
  static TimeConverter get timeConverter =>
      TimeConverter(presentMoment: DateTime.now());
}
