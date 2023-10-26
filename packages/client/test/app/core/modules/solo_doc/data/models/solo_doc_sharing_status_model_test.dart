import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';
import '../../constants/models/models.dart';
import '../../constants/response/solo_document_table_response.dart';

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
