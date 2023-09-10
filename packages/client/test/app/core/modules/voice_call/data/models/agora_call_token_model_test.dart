import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/modules/voice_call/data/data.dart';
import '../../constants/models/models.dart';
import '../../constants/response/response.dart';

void main() {
  test(
      "`fromTokenServer` should return the proper model with a successful response",
      () {
    final res = AgoraCallTokenModel.fromTokenServer(
        TokenServerResponse.successfulResponse);
    expect(res, ConstantAgoraCallTokenModel.successCase);
  });
  test(
      "`fromTokenServer` should return the proper model with a not-successful response",
      () {
    final res = AgoraCallTokenModel.fromTokenServer(
        TokenServerResponse.notSuccessfulResponse);
    expect(res, ConstantAgoraCallTokenModel.notSuccessCase);
  });
}
