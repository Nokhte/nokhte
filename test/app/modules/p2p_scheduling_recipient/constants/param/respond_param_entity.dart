import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/respond_to_scheduling_request_param_entity.dart';
import '../../../p2p_scheduling_sender/constants/sample_data.dart';

class ConstantRespondParamEntities {
  static RespondToSchedulingRequestParamEntity get entity =>
      RespondToSchedulingRequestParamEntity(
          originalSenderUID: SampleData.randomUID,
          responseTimestampz: SampleData.june19th10AMtimestampz);
}
