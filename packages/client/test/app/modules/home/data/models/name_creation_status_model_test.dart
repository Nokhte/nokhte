// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/home/data/models/name_creation_status_model.dart';

import '../../constants/models/models.dart';

void main() {
  test("`fromSupabase` should return entity w/ false if empty array is given",
      () {
    final res = NameCreationStatusModel.fromSupabase([]);
    expect(res, ConstantNameCreationStatusModels.notSuccessCase);
  });
  test(
      "`fromSupabase` should return entity w/ true if non-empty array is given",
      () {
    final res = NameCreationStatusModel.fromSupabase([{}]);
    expect(res, ConstantNameCreationStatusModels.successCase);
  });
}
