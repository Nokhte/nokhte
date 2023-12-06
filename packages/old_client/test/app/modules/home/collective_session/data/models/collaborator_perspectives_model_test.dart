import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/modules/collective_session/data/data.dart';
import 'constants.dart';

void main() {
  test(
      "`fromSupabase` should work properly with a sample test metadata and paths set",
      () {
    final res = CollaboratorPerspectivesModel.fromSupabase(Constants.tInput);
    final expected = CollaboratorPerspectivesModel(
        collaboratorPerspectivesData: Constants.expected);
    expect(res, expected);
  });
}
