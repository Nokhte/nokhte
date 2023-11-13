import 'dart:io';

import 'package:nokhte_backend/constants/constants.dart';
import 'package:nokhte_backend/edge_functions.dart';
import 'package:nokhte_backend/existing_collaborations.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/solo_sharable_documents.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:nokhte_backend/tables/real_time_disabled/individual_sessions/queries.dart';
import 'package:nokhte_backend/tables/real_time_enabled/existing_collaborations/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final SupabaseClient supabaseAdmin =
      SupabaseClientConfigConstants.supabaseAdmin;
  late ExistingCollaborationsQueries existingCollaborationsQueries;
  late P2PPerspectivesTrackingQueries perspectivesQueries;
  late IndividualSessionsQueries individualSessionQueries;
  late PerspectivesAudioStorageQueries perspectivesAudioStorageQueries;
  final supabase = SupabaseClientConfigConstants.supabase;
  final tPerspectives = [
    "pERSPECTIVE 1",
    "peRSPECTIVE 2",
    "perSPECTIVE 3",
    'persPECTIVE 4',
    'persPECTIVE 5'
  ];

  final now = DateTime.now();

  setUpAll(() async {
    await SignIn.user2(supabase: supabase);
    existingCollaborationsQueries =
        ExistingCollaborationsQueries(supabase: supabaseAdmin);
    perspectivesQueries =
        P2PPerspectivesTrackingQueries(supabase: supabaseAdmin);
    individualSessionQueries = IndividualSessionsQueries(supabase: supabase);
    perspectivesAudioStorageQueries =
        PerspectivesAudioStorageQueries(supabase: supabase);
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
      newPerspectives: tPerspectives,
    );
  });

  test(
      "make the collaborator do an individual session & update their row accordingly and then move it into the collective space",
      () async {
    final userIdResults = await UserSetupConstants.fetchUIDs();
    final npcUserUID = userIdResults[1];
    final realPersonUID = await returnNonNPCUID();
    perspectivesQueries.collaboratorInfo = CollaboratorInfo(
      theCollaboratorsNumber: "collaborator_one",
      theCollaboratorsUID: npcUserUID,
      theUsersCollaboratorNumber: "collaborator_two",
      theUsersUID: realPersonUID,
    );
    // perspectivesAudioStorageQueries.collaboratorInfo = perspectivesQueries.collaboratorInfo;

    await individualSessionQueries.createNewSession();
    await perspectivesAudioStorageQueries.uploadPerspective(
      IndividualSessionAudioClip(
        isOverwritingAnotherFile: false,
        thePerspective: tPerspectives[0],
        totalNumberOfFilesForThePerspective: 1,
        thePerspectivesIndex: 0,
        theSessionTimestamp: now,
        thePerspectivesTimestamp: now,
        theFile: File(
          '${Directory.current.path}/test/assets/perspectives/pers1_1.m4a',
        ),
      ),
    );
    await perspectivesAudioStorageQueries.uploadPerspective(
      IndividualSessionAudioClip(
        isOverwritingAnotherFile: false,
        thePerspective: tPerspectives[0],
        totalNumberOfFilesForThePerspective: 2,
        thePerspectivesIndex: 0,
        theSessionTimestamp: now,
        thePerspectivesTimestamp: now,
        theFile: File(
          '${Directory.current.path}/test/assets/perspectives/pers1_2.m4a',
        ),
      ),
    );
    await perspectivesAudioStorageQueries.uploadPerspective(
      IndividualSessionAudioClip(
        isOverwritingAnotherFile: false,
        thePerspective: tPerspectives[1],
        totalNumberOfFilesForThePerspective: 1,
        thePerspectivesIndex: 1,
        theSessionTimestamp: now,
        thePerspectivesTimestamp: now,
        theFile: File(
          '${Directory.current.path}/test/assets/perspectives/pers2_1.m4a',
        ),
      ),
    );
    await perspectivesAudioStorageQueries.uploadPerspective(
      IndividualSessionAudioClip(
        isOverwritingAnotherFile: false,
        thePerspective: tPerspectives[1],
        totalNumberOfFilesForThePerspective: 2,
        thePerspectivesIndex: 1,
        theSessionTimestamp: now,
        thePerspectivesTimestamp: now,
        theFile: File(
          '${Directory.current.path}/test/assets/perspectives/pers2_2.m4a',
        ),
      ),
    );
    await perspectivesAudioStorageQueries.uploadPerspective(
      IndividualSessionAudioClip(
        isOverwritingAnotherFile: false,
        thePerspective: tPerspectives[1],
        totalNumberOfFilesForThePerspective: 3,
        thePerspectivesIndex: 1,
        theSessionTimestamp: now,
        thePerspectivesTimestamp: now,
        theFile: File(
          '${Directory.current.path}/test/assets/perspectives/pers2_3.m4a',
        ),
      ),
    );

    final sessionMetadata = {
      "metadata": [
        {
          "thePerspective": tPerspectives[0],
          "numberOfFiles": 2,
        },
        {
          "thePerspective": tPerspectives[1],
          "numberOfFiles": 3,
        },
        {
          "thePerspective": tPerspectives[2],
          "numberOfFiles": 0,
        },
        {
          "thePerspective": tPerspectives[3],
          "numberOfFiles": 0,
        },
        {
          "thePerspective": tPerspectives[4],
          "numberOfFiles": 0,
        },
      ],
    };
    await individualSessionQueries.updateSessionMetadata(
        newMetadata: sessionMetadata);
    await perspectivesAudioStorageQueries.moveToCollectiveSpace(
      CollectiveSessionAudioExtrapolationInfo(
        perspectivesCommitTimestamp: now,
        individualSessionMetadata: sessionMetadata,
        collectiveSessionTimestamp: now,
        individualSessionTimestamp: now,
      ),
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
