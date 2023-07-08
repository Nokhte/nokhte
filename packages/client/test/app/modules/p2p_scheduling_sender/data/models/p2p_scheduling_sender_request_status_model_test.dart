import 'package:flutter_test/flutter_test.dart';
import '../../constants/return/send/send_scheduling_request_status_models.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/data/models/p2p_scheduling_request_status_model.dart';

void main() {
  test("`fromSupabase` should return entity w/ false if empty array is given",
      () {
    final res = P2PSchedulingRequestStatusModel.fromSupabase([]);

    expect(res, ConstantSendSchedulingRequestStatusEntities.notSuccessCase);
  });
  test("`fromSupabase` should return false if empty array is given", () {
    final res = P2PSchedulingRequestStatusModel.fromSupabase([{}]);

    expect(res, ConstantSendSchedulingRequestStatusEntities.successCase);
  });
}
