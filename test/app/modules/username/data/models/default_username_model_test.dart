// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/username/data/models/default_username_model.dart';

void main() {
  const DefaultUsernameModel tUsernameModel =
      DefaultUsernameModel(defaultUsername: "sonny_vesali");

  test('`fromSupabase` successfully transforms sample email', () {
    final res = DefaultUsernameModel.fromSupabase('sonny.vesali@gmail.com');
    expect(res, tUsernameModel);
  });
}
