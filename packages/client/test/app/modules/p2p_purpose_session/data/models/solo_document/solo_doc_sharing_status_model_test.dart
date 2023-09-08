import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/models/models.dart';
import '../../../constants/models/models.dart';
import '../../../constants/response/response.dart';

void main() {
  test("`fromSupabase` should return proper model w/ 200 status Response", () {
    final res = SoloDocSharingStatusModel.fromSupabase(
      SoloDocumentTableResponse.response,
    );
    expect(res, ConstantSoloDocSharingStatusModel.successCase);
  });
  test("`fromSupabase` should return proper model w/ non 200 reponse", () {
    final res = SoloDocSharingStatusModel.fromSupabase([]);
    expect(res, ConstantSoloDocSharingStatusModel.notSuccessCase);
  });
}
