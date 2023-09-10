import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/modules/solo_doc/data/data.dart';
import '../../constants/models/models.dart';
import '../../constants/response/solo_document_table_response.dart';

void main() {
  test("`fromSupabase` should return proper model w/ 200 status Response", () {
    final res = SoloDocSubmissionStatusModel.fromSupabase(
      SoloDocumentTableResponse.response,
    );
    expect(res, ConstantSoloDocSubmissionStatusModel.successCase);
  });
  test("`fromSupabase` should return proper model w/ non 200 reponse", () {
    final res = SoloDocSubmissionStatusModel.fromSupabase([]);
    expect(res, ConstantSoloDocSubmissionStatusModel.notSuccessCase);
  });
}
