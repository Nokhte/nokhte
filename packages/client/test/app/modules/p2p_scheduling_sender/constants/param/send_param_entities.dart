import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/send_scheduling_request_param_entity.dart';
import '../sample_data.dart';

class ConstantSendParamEntities {
  static SendSchedulingRequestParamEntity get sendScheduleParamEntity =>
      SendSchedulingRequestParamEntity(
        receiverUID: SampleData.randomUID,
        timeRangeList: [
          IndividualTimeRange(
            startTime: SampleData.june19th9AMtimestampz,
            endTime: SampleData.june19th10AMtimestampz,
          ),
          IndividualTimeRange(
            startTime: SampleData.june19th1PMtimestampz,
            endTime: SampleData.june19th2PMtimestampz,
          ),
        ],
      );
}
