import 'package:nokhte_backend/constants/constants.dart';
import 'package:nokhte_backend/edge_functions.dart';
import 'package:nokhte_backend/existing_collaborations.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/solo_sharable_documents.dart';
import 'package:nokhte_backend/tables/real_time_enabled/existing_collaborations/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final SupabaseClient supabaseAdmin =
      SupabaseClientConfigConstants.supabaseAdmin;
  late ExistingCollaborationsQueries existingCollaborationsQueries;
  late P2PPerspectivesTrackingQueries perspectivesQueries;

  setUpAll(() {
    existingCollaborationsQueries =
        ExistingCollaborationsQueries(supabase: supabaseAdmin);
    perspectivesQueries =
        P2PPerspectivesTrackingQueries(supabase: supabaseAdmin);
  });

  Future returnNonNPCUID() async {
    final realPersonUIDQuery = await supabaseAdmin
        .from('user_names')
        .select()
        .filter('first_name', 'neq', 'tester');
    return realPersonUIDQuery.first["uid"];
  }

  test("make a collaboration between real person & npc 2", () async {
    final userIdResults = await UserSetupConstants.fetchUIDs();
    final npcUserUID = userIdResults[1];
    final realPersonUID = await returnNonNPCUID();
    existingCollaborationsQueries.createNewCollaboration(
      collaboratorOneUID: npcUserUID,
      collaboratorTwoUID: realPersonUID,
    );
  });

  test("make a set of perspectives between real person & npc 2", () async {
    final userIdResults = await UserSetupConstants.fetchUIDs();
    final npcUserUID = userIdResults[1];
    final realPersonUID = await returnNonNPCUID();
    perspectivesQueries.collaboratorInfo = CollaboratorInfo(
      theCollaboratorsNumber: "collaborator_one",
      theCollaboratorsUID: npcUserUID,
      theUsersCollaboratorNumber: "collaborator_two",
      theUsersUID: realPersonUID,
    );
    await perspectivesQueries.insertNewPerspectives(
      newPerspectives: [
        "pERSPECTIVE 1",
        "peRSPECTIVE 2",
        "perSPECTIVE 3",
        'persPECTIVE 4',
        'persPECTIVE 5'
      ],
    );
  });

  test("make a solo npc-owned doc & share it with the user", () async {
    final userIdResults = await UserSetupConstants.fetchUIDs();
    final npcUserUID = userIdResults.first;
    final realPersonUID = await returnNonNPCUID();
    await SoloSharableDocuments.createSoloDoc(
        supabase: supabaseAdmin,
        ownerUID: npcUserUID,
        collaboratorUID: realPersonUID,
        docType: 'purpose');
    await SoloSharableDocuments.updateDocContent(
      supabase: supabaseAdmin,
      ownerUID: npcUserUID,
      content: 'npc content',
    );
    await SoloSharableDocuments.updateDocVisibility(
      supabase: supabaseAdmin,
      ownerUID: npcUserUID,
      visibility: true,
    );
  });

  test("put npc in the pool searching for user ", () async {
    final userIdResults = await UserSetupConstants.fetchUIDs();
    final npcUserUID = userIdResults.first;
    final realPersonUID = await returnNonNPCUID();
    final realPersonPhraseIDRes = await supabaseAdmin
        .from('collaborator_phrases')
        .select()
        .eq('uid', realPersonUID);
    await InitiateCollaboratorSearch.invoke(
      supabase: supabaseAdmin,
      wayfarerUID: npcUserUID,
      queryPhraseIDs: CollaboratorPhraseIDs(
        adjectiveID: realPersonPhraseIDRes.first["adjective_id"],
        nounID: realPersonPhraseIDRes.first["noun_id"],
      ),
    );
  });
  test("user 1 in the pool searching for npc ", () async {
    final userIdResults = await UserSetupConstants.fetchUIDs();
    final npcUserUID = userIdResults[1];
    final realPersonUID = await returnNonNPCUID();
    final npcPhraseRes = await supabaseAdmin
        .from('collaborator_phrases')
        .select()
        .eq('uid', npcUserUID);
    await InitiateCollaboratorSearch.invoke(
      supabase: supabaseAdmin,
      wayfarerUID: realPersonUID,
      queryPhraseIDs: CollaboratorPhraseIDs(
        adjectiveID: npcPhraseRes.first["adjective_id"],
        nounID: npcPhraseRes.first["noun_id"],
      ),
    );
  });
}
