import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';
import '../../constants/models/models.dart';

void main() {
  test(
      "`fromSupabase` should return proper model w/ false if empty arrays is given",
      () {
    final res =
        CollaboratorPhraseValidationModel.fromSupabase(adjRes: [], nounRes: []);
    expect(res, ConstantCollaboratorPhraseValidationModel.notSuccessCase);
  });
  test(
      "`fromSupabase` should return proper model w/ true if even 1 non-empty is given",
      () {
    final res = CollaboratorPhraseValidationModel.fromSupabase(adjRes: [
      {"id": 1}
    ], nounRes: []);
    expect(res, ConstantCollaboratorPhraseValidationModel.notSuccessCase);
  });
  test(
      "`fromSupabase` should return proper model w/ true if even no non-empty is given",
      () {
    final res = CollaboratorPhraseValidationModel.fromSupabase(adjRes: [
      {"id": 1}
    ], nounRes: [
      {"id": 1}
    ]);
    expect(res, ConstantCollaboratorPhraseValidationModel.successCase);
  });
}
