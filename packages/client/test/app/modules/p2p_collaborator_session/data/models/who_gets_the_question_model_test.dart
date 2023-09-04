import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';
import '../../constants/models/models.dart';
import '../../constants/response/response.dart';

void main() {
  test(
      "`fromSupabase` should return the proper model with a successful response",
      () {
    final res = WhoGetsTheQuestionModel.fromSupabase(
      ExistingCollaboratorsTable.response,
    );
    expect(res, ConstantWhoGetsTheQuestionModel.hasItCase);
  });
  test(
      "`fromSupabase` should return the proper model with a not-successful response",
      () {
    final res = WhoGetsTheQuestionModel.fromSupabase([]);
    expect(res, ConstantWhoGetsTheQuestionModel.doesNotHaveItCase);
  });
}
