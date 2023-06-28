// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/p2p_request_recipient/data/models/p2p_recipient_request_model.dart';
import '../../constants/models.dart';
import '../../constants/sample_data_source_responses.dart';

void main() {
  test('should act accordingly when served an empty response', () {
    final res = P2PRecipientRequestModel.fromSupabase(
      SampleDataSourceResonses.emptyResponse,
    );
    expect(res, ConstantModels.unwrappedEmptyP2PRecipReqModel);
  });

  test('should act accordingly when served a proper non-empty response', () {
    final res = P2PRecipientRequestModel.fromSupabase(
      SampleDataSourceResonses.recipientRequestList,
    );
    expect(res, ConstantModels.unwrappedNonEmptyP2PRecipReqModel);
  });
}
