import 'package:primala/app/modules/p2p_scheduling_sender/domain/logic/confirm_scheduling_time.dart';

import '../sample_data.dart';

class ConstantConfirmParamEntities {
  static ConfirmSchedulingTimeParams get entity =>
      ConfirmSchedulingTimeParams(receiverUID: SampleData.randomUID);
}
