// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/data.dart';
import '../../constants/models/models.dart';

void main() {
  test("`fromSupabase` should return entity w/ false if empty array is given",
      () {
    final res = CollaborativeDocCreationStatusModel.fromSupabase([]);
    expect(res, ConstantCollaborativeDocCreationStatusModel.successCase);
  });
  test(
      "`fromSupabase` should return entity w/ true if non-empty array is given",
      () {
    final res = CollaborativeDocCreationStatusModel.fromSupabase([{}]);
    expect(res, ConstantCollaborativeDocCreationStatusModel.successCase);
  });
}
