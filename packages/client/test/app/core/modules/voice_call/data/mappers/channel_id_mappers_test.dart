import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import '../../constants/response/response.dart';

void main() {
  test(
      "`fromCollaborationRow` should return the proper model with a successful response",
      () {
    final res = ChannelIdMapper.fromCollaborationRow(
      ExistingCollaboratorsTable.response,
    );
    expect(res, "11111111111111111112222222222222222222");
  });
  test(
      "`fromCollaborationRow` should return the proper model with a not-successful response",
      () {
    final res = ChannelIdMapper.fromCollaborationRow(const []);
    expect(res, "");
  });
}
