// * Testing & Mocking Libs
// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/token_server/token_server.dart';

void main() {
  test("should work & return a proper with a supabase UID", () async {
    final res = await TokenServices.getAgoraToken(
      channelName: 'hi',
      currentUserUID: 123,
    );
    expect(res.statusCode, 200);
  });
}
