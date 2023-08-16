import 'package:dartz/dartz.dart';
import 'package:primala/app/core/deprecated/p2p_scheduling/utils/time_converter.dart';

import 'spiral_selection_state_type.dart';

class DefaultP2PScheduling {
  static SpiralSelectionState get rangeEntity => const Left([]);
  static SpiralSelectionState get singleTimeEntity => const Right('');
  static TimeConverter get timeConverter =>
      TimeConverter(presentMoment: DateTime.now());
}
