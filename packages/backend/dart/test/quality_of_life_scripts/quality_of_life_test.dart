import 'package:primala_backend/constants/constants.dart';
import 'package:primala_backend/edge_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

/// make this script
/// take a break come back, also make sure to add these
/// these are quality of life things to run
/// so that you can fast forward to certain
/// parts of the UX and test them without
/// repetivie CLI non-sense

void main() {
  final SupabaseClient supabaseAdmin =
      SupabaseClientConfigConstants.supabaseAdmin;

  Future returnNonNPCUID() async {
    final realPersonUIDQuery = await supabaseAdmin
        .from('user_names')
        .select()
        .filter('first_name', 'neq', 'tester');
    return realPersonUIDQuery[0]["uid"];
  }

  test("put user 1 in the pool", () async {
    final userIdResults = await UserSetupConstants.fetchUIDs();
    final npcUserUID = userIdResults[0];
    final realPersonUID = await returnNonNPCUID();
    final realPersonPhraseIDRes = await supabaseAdmin
        .from('collaborator_phrases')
        .select()
        .eq('uid', realPersonUID);
    await InitiateCollaboratorSearch.invoke(
      supabase: supabaseAdmin,
      wayfarerUID: npcUserUID,
      queryPhraseIDs: CollaboratorPhraseIDs(
        adjectiveID: realPersonPhraseIDRes[0]["adjective_id"],
        nounID: realPersonPhraseIDRes[0]["noun_id"],
      ),
    );
  });

  test("make a collaboration between real person & npc 1", () async {
    final userIdResults = await UserSetupConstants.fetchUIDs();
    final npcUserUID = userIdResults[0];
    final realPersonUID = await returnNonNPCUID();
    await supabaseAdmin.from('existing_collaborations').insert({
      'collaborator_one': npcUserUID,
      'collaborator_two': realPersonUID,
    });
  });
}
