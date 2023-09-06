import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/existing_collaborations.dart';

void main() {
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];
  });

  tearDown(() async {
    await supabaseAdmin.from('solo_p2p_purpose_documents').delete().eq(
          'owner_uid',
          firstUserUID,
        );
  });

  test(
    "Scenario 1: Document is created & Shared and then the session is ended, should have proper permissioning",
    () async {
      // arrange
      await SignIn.user1(supabase: supabase);
      // act
      await supabase.from('solo_p2p_purpose_documents').insert({
        'owner_uid': firstUserUID,
        'collaborator_uid': secondUserUID,
      });
      final res = await supabase.from('solo_p2p_purpose_documents').select().eq(
            'owner_uid',
            firstUserUID,
          );
      expect(res[0]["owner_uid"], firstUserUID);
      expect(res[0]["collaborator_uid"], secondUserUID);
      expect(res[0]["is_visible_to_collaborator"], false);
      expect(res[0]["session_is_completed"], false);
      await SignIn.user2(supabase: supabase);
      final secondRes =
          await supabase.from('solo_p2p_purpose_documents').select().eq(
                'collaborator_uid',
                secondUserUID,
              );
      expect(secondRes, isEmpty);
      await SignIn.user1(supabase: supabase);
      await supabase.from('solo_p2p_purpose_documents').update({
        'is_visible_to_collaborator': true,
        'content': "hi there collaborator 2",
      }).eq(
        'owner_uid',
        firstUserUID,
      );
      await SignIn.user2(supabase: supabase);
      final thirdRes =
          await supabase.from('solo_p2p_purpose_documents').select().eq(
                'collaborator_uid',
                secondUserUID,
              );
      expect(thirdRes[0]["content"], "hi there collaborator 2");
      await SignIn.user1(supabase: supabase);
      print("$firstUserUID vs ${supabase.auth.currentUser?.id}");
      await supabase.from('solo_p2p_purpose_documents').update({
        'session_is_completed': true,
      }).eq(
        'owner_uid',
        firstUserUID,
      );
      await SignIn.user2(supabase: supabase);
      final fourthRes =
          await supabase.from('solo_p2p_purpose_documents').select().eq(
                'owner_uid',
                firstUserUID,
              );
      expect(fourthRes, isEmpty);
    },
  );
}
