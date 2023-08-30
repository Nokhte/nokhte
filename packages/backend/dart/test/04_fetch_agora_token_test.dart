// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/constants/general/general.dart';

void main() {
  final SupabaseClient supabase = SupabaseClientConfigConstants.supabase;
  late P2PPurposeSessionRemoteSourceImpl purposeSessionRemoteSource;

  setUpAll(() async {
    purposeSessionRemoteSource =
        P2PPurposeSessionRemoteSourceImpl(supabase: supabase);
    await SignIn.user1(supabase: supabase);
  });

  test("should work & return a proper with a supabase UID", () async {
    final res =
        await purposeSessionRemoteSource.fetchAgoraToken(channelName: 'hi');
    expect(res.statusCode, 200);
  });
}
