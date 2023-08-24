import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';
import '../../constants/models/models.dart';

void main() {
  test(
      "`fromSupabase` should return proper model w/ false if empty arrays is given",
      () {
    final res = CollaboratorPhraseValidationModel.fromSupabase(
        adjectiveRes: [], nounRes: []);
    expect(res, ConstantCollaboratorPhraseValidationModel.notSuccessCase);
  });
  test(
      "`fromSupabase` should return proper model w/ true if even 1 non-empty is given",
      () {
    final res = CollaboratorPhraseValidationModel.fromSupabase(
        adjectiveRes: [{}], nounRes: []);
    expect(res, ConstantCollaboratorPhraseValidationModel.notSuccessCase);
  });
  test(
      "`fromSupabase` should return proper model w/ true if even no non-empty is given",
      () {
    final res = CollaboratorPhraseValidationModel.fromSupabase(
        adjectiveRes: [{}], nounRes: [{}]);
    expect(res, ConstantCollaboratorPhraseValidationModel.successCase);
  });
}
