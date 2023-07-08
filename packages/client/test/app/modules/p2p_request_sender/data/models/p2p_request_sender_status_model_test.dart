// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/p2p_request_sender/data/models/p2p_request_sender_status_model.dart';

import '../../constants/models.dart';

void main() {
  test('`fromSupabase should return false when given an empty array', () {
    final res = P2PRequestSenderStatusModel.fromSupabase([]);
    expect(res, ConstantModels.unwrappedNotSuccessfulP2PRequestStatusModel);
  });
  test('`fromSupabase should return true when given a legit response', () {
    final res = P2PRequestSenderStatusModel.fromSupabase([
      {"uid": "test"}
    ]);
    expect(res, ConstantModels.unwrappedSuccessfulP2PRequestStatusModel);
  });
}
