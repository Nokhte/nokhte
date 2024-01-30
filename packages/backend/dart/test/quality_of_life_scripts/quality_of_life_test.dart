import 'dart:io';

import 'package:nokhte_backend/constants/constants.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/collective_sessions/queries.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/individual_sessions/queries.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final SupabaseClient supabaseAdmin =
      SupabaseClientConfigConstants.supabaseAdmin;
  late ExistingCollaborationsQueries existingCollaborationsQueries;
  late P2PPerspectivesTrackingQueries perspectivesQueries;
  late IndividualSessionsQueries individualSessionQueries;
  late SoloSharableDocumentQueries soloDocQueries;
  late InitiateCollaboratorSearch npcInitiateCollaboratorSearch;
  late CollectiveSessionQueries collectiveSessionQueries;
  late WorkingCollaborativeDocumentsQueries collaborativeDocQueries;
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
    npcInitiateCollaboratorSearch =
        InitiateCollaboratorSearch(supabase: supabase);
    soloDocQueries = SoloSharableDocumentQueries(supabase: supabase);
    collaborativeDocQueries =
        WorkingCollaborativeDocumentsQueries(supabase: supabase);
    existingCollaborationsQueries =
        ExistingCollaborationsQueries(supabase: supabaseAdmin);
    perspectivesQueries =
        P2PPerspectivesTrackingQueries(supabase: supabaseAdmin);
    individualSessionQueries = IndividualSessionsQueries(supabase: supabase);
    perspectivesAudioStorageQueries =
        PerspectivesAudioStorageQueries(supabase: supabase);
    collectiveSessionQueries = CollectiveSessionQueries(supabase: supabase);
  });

  Future returnNonNPCUID() async {
    final realPersonUIDQuery = await supabaseAdmin
        .from('user_names')
        .select()
        .filter('first_name', 'neq', 'tester');
    return realPersonUIDQuery.first["uid"];
  }

  test("make a collaboration between real person & npc 2", () async {
    final userIdResults = await UserSetupConstants.getUIDs();
    final npcUserUID = userIdResults[1];
    final realPersonUID = await returnNonNPCUID();
    existingCollaborationsQueries.createNewCollaboration(
      collaboratorOneUID: npcUserUID,
      collaboratorTwoUID: realPersonUID,
    );
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

  test("mark npc as having joined the call", () async {
    await existingCollaborationsQueries.updateOnCallStatus(true);
  });

  test("mark npc has being online", () async {
    await existingCollaborationsQueries.updateOnlineStatus(true);
  });

  test("mark npc as having initialized the timer", () async {
    await existingCollaborationsQueries.updateTimerRunningStatus(true);
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

  test("make a set of perspectives between real person & npc 2", () async {
    final userIdResults = await UserSetupConstants.getUIDs();
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

  test("1. individual session setup 2. collective session setup", () async {
    final userIdResults = await UserSetupConstants.getUIDs();
    final npcUserUID = userIdResults[1];
    final realPersonUID = await returnNonNPCUID();
    perspectivesQueries.collaboratorInfo = CollaboratorInfo(
      theCollaboratorsNumber: "collaborator_one",
      theCollaboratorsUID: npcUserUID,
      theUsersCollaboratorNumber: "collaborator_two",
      theUsersUID: realPersonUID,
    );
    collectiveSessionQueries.collaboratorInfo =
        perspectivesQueries.collaboratorInfo;

    final thePerspectivesCommitTimestampStr = (await supabase
            .from('p2p_perspectives_tracking')
            .select()
            .eq("collaborator_one_uid", npcUserUID)
            .eq("collaborator_two_uid", realPersonUID))
        .first['current_committed_at'];
    final thePerspectivesCommitTimestamp =
        DateTime.parse(thePerspectivesCommitTimestampStr);

    print("$thePerspectivesCommitTimestamp");

    await individualSessionQueries.createNewSession();
    await perspectivesAudioStorageQueries.uploadPerspective(
      IndividualSessionAudioClip(
        isOverwritingAnotherFile: false,
        thePerspective: tPerspectives[0],
        totalNumberOfFilesForThePerspective: 1,
        thePerspectivesIndex: 0,
        theSessionTimestamp: now,
        thePerspectivesTimestamp: thePerspectivesCommitTimestamp,
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
        thePerspectivesTimestamp: thePerspectivesCommitTimestamp,
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
        thePerspectivesTimestamp: thePerspectivesCommitTimestamp,
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
        thePerspectivesTimestamp: thePerspectivesCommitTimestamp,
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
        thePerspectivesTimestamp: thePerspectivesCommitTimestamp,
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
    await supabaseAdmin.from("individual_sessions").insert({
      "owner_uid": realPersonUID,
      "collaborator_one_uid": npcUserUID,
      "collaborator_two_uid": realPersonUID,
      "session_metadata": sessionMetadata,
    });
    await collectiveSessionQueries.createNewSession();
    await supabaseAdmin
        .from('collective_sessions')
        .update({
          "collaborator_one_uid": npcUserUID,
          "collaborator_two_uid": realPersonUID,
          "collaborator_one_individual_session_metadata": sessionMetadata,
          "collaborator_one_individual_session_timestamp":
              now.toIso8601String(),
        })
        .eq("collaborator_one_uid", npcUserUID)
        .eq("collaborator_two_uid", realPersonUID);
    await collectiveSessionQueries.updateTheirIndividualSessionFields(
      individualSessionTimestampParam: now,
      sessionMetadata: sessionMetadata,
    );

    final collectiveSessinTimestamp = DateTime.parse((await supabase
            .from('collective_sessions')
            .select()
            .eq("collaborator_one_uid", npcUserUID)
            .eq("collaborator_two_uid", realPersonUID))
        .first["started_at"]);

    await perspectivesAudioStorageQueries.moveToCollectiveSpace(
      CollectiveSessionAudioExtrapolationInfo(
        perspectivesCommitTimestamp: thePerspectivesCommitTimestamp,
        individualSessionMetadata: sessionMetadata,
        collectiveSessionTimestamp: collectiveSessinTimestamp,
        individualSessionTimestamp: now,
      ),
    );
  });

  test("make a solo npc-owned doc & share it with the user", () async {
    await soloDocQueries.createSoloDoc('purpose');
    await soloDocQueries.updateDocContent('npc content');
    await soloDocQueries.updateDocVisibility(makeVisible: true);
  });

  test("update the collaborative doc", () async {
    await collaborativeDocQueries.updateUsersDocContent(
        newContent: "some new content");
  });

  test("make a collaborative doc", () async {
    await collaborativeDocQueries.createCollaborativeDocument(
        docType: 'purpose');
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
