import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/models/models.dart';
import '../../constants/models/models.dart';
import '../../constants/responses/function_responses.dart';

void main() {
  test("`fromSupabase` should return proper model w/ 200 status Response", () {
    final res = CollaboratorPoolEntryStatusModel.fromSupabase(
      funcRes: FunctionResponses.successRes,
    );
    expect(res, ConstantCollaboratorPoolEntryStatusModel.successCase);
  });
  test("`fromSupabase` should return proper model w/ non 200 reponse", () {
    final res = CollaboratorPoolEntryStatusModel.fromSupabase(
      funcRes: FunctionResponses.notSuccessRes,
    );
    expect(res, ConstantCollaboratorPoolEntryStatusModel.notSuccessCase);
  });
}
