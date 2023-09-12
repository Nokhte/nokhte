// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/token_server.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/constants/constants.dart';

void main() {
  final SupabaseClient supabase = SupabaseClientConfigConstants.supabase;

  setUpAll(() async {
    await SignIn.user1(supabase: supabase);
  });

  test("should work & return a proper with a supabase UID", () async {
    final res = await TokenServer.fetchAgoraToken(
      channelName: 'hi',
      currentUserUID: 123,
    );
    expect(res.statusCode, 200);
  });
}
