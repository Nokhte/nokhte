import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/modules/solo_doc/data/data.dart';
import '../../constants/models/models.dart';
import '../../constants/response/solo_document_table_response.dart';

void main() {
  test("`fromSupabase` should return proper model w/ 200 status Response", () {
    final res = SoloDocSealingStatusModel.fromSupabase(
      SoloDocumentTableResponse.response,
    );
    expect(res, ConstantSoloDocSealingStatusModel.successCase);
  });
  test("`fromSupabase` should return proper model w/ non 200 reponse", () {
    final res = SoloDocSealingStatusModel.fromSupabase([]);
    expect(res, ConstantSoloDocSealingStatusModel.notSuccessCase);
  });
}
