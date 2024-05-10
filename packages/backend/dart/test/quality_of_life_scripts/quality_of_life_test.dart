import 'package:nokhte_backend/constants/constants.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final SupabaseClient supabaseAdmin =
      SupabaseClientConfigConstants.supabaseAdmin;
  late InitiateCollaboratorSearch npcInitiateCollaboratorSearch;
  final supabase = SupabaseClientConfigConstants.supabase;

  setUpAll(() async {
    await SignIn.user2(supabase: supabase);
    npcInitiateCollaboratorSearch =
        InitiateCollaboratorSearch(supabase: supabase);
  });

  Future returnNonNPCUID() async {
    final realPersonUIDQuery = await supabaseAdmin
        .from('user_information')
        .select()
        .filter('first_name', 'neq', 'tester');
    return realPersonUIDQuery.first["uid"];
  }

  test("create nokhte session", () async {
    final userIdResults = await UserSetupConstants.getUIDs();
    final npcUserUID = userIdResults[1];
    final realPersonUID = await returnNonNPCUID();
    await supabase.from("active_nokhte_sessions").insert({
      "meeting_uid": realPersonUID,
      "collaborator_one_uid": realPersonUID,
      "collaborator_two_uid": npcUserUID,
    });
  });

  test("make npc join for nokhte session", () async {
    final realPersonUID = await returnNonNPCUID();
    await npcInitiateCollaboratorSearch.invoke(
        realPersonUID, InvitationType.nokhteSession);
  });

  test("reset values in existing collaborations", () async {
    final realPersonUID = await returnNonNPCUID();
    print("realPersonUID: $realPersonUID");
    await supabaseAdmin.from("existing_collaborations").update({
      "is_on_call": [false, false],
      "is_online": [false, false],
      "current_phases": [1, 1],
      "timer_should_run": false,
      "speaker_spotlight": null,
    }).or(
        "collaborator_one.eq.$realPersonUID,collaborator_two.eq.$realPersonUID");
  });

  test("make a purpose between npc & person", () async {
    final userIdResults = await UserSetupConstants.getUIDs();
    final npcUserUID = userIdResults[1];
    final realPersonUID = await returnNonNPCUID();
    await supabaseAdmin.from("finished_collaborative_documents").insert({
      "collaborator_one_uid": npcUserUID,
      "collaborator_two_uid": realPersonUID,
      "doc_type": "purpose",
      "content": "pURPOSE",
    });
  });

  test("put npc in the pool searching for user ", () async {
    final realPersonUID = await returnNonNPCUID();
    await npcInitiateCollaboratorSearch.invoke(
        realPersonUID, InvitationType.nokhteSession);
  });

  test(
    "user 1 in the pool searching for npc ",
    () async {
      final userIdResults = await UserSetupConstants.getUIDs();
      final npcUserUID = userIdResults[1];
      final edge = InitiateCollaboratorSearch(supabase: supabase);
      await edge.invoke(npcUserUID, InvitationType.nokhteSession);
    },
  );
}
