// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/finished_nokhte_sessions/queries.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_nokhte_sessions/active_nohte_sessions.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_nokhte_sessions/types/nokhte_session_metadata.dart';

import 'shared/shared.dart';

void main() {
  late ActiveNokhteSessionQueries user1Queries;
  late ActiveNokhteSessionQueries user2Queries;
  late ActiveNokhteSessionsStream user1Stream;
  late FinishedNokhteSessionQueries user1FinishedQueries;
  final tSetup = CommonCollaborativeTestFunctions();
  List sortedArr = [];

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    sortedArr = [tSetup.firstUserUID, tSetup.secondUserUID]..sort();
    user1Queries = ActiveNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user1FinishedQueries =
        FinishedNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user1Stream = ActiveNokhteSessionsStream(supabase: tSetup.user1Supabase);
    user2Queries = ActiveNokhteSessionQueries(supabase: tSetup.user2Supabase);
  });

  tearDownAll(() async {
    await tSetup.supabaseAdmin
        .from("finished_nokhte_sessions")
        .delete()
        .eq("collaborator_uids", sortedArr);
  });

  test("select", () async {
    await tSetup.supabaseAdmin.from("active_nokhte_sessions").insert(
        {"meeting_uid": tSetup.firstUserUID, "collaborator_uids": sortedArr});
    final res = await user1Queries.select();
    expect(res, isNotEmpty);
  });

  test("getMeetingUID", () async {
    final res = await user1Queries.getMeetingUID();
    expect(res, tSetup.firstUserUID);
  });

  test("GetCollaboratorOne", () async {
    final res = await user1Queries.getCollaboratorOne();
    expect(res, tSetup.firstUserUID);
  });

  test("getCollaboratorTwo", () async {
    final res = await user1Queries.getCollaboratorTwo();
    expect(res, tSetup.secondUserUID);
  });

  test("getWhoIsOnline", () async {
    final res = await user1Queries.getWhoIsOnline();
    expect(res, [false, false]);
  });

  test("getSpeakerSpotlight", () async {
    final res = await user1Queries.getSpeakerSpotlight();
    expect(res, null);
  });

  test("getCurrentPhases", () async {
    final res = await user1Queries.getCurrentPhases();
    expect(res, [1, 1]);
  });

  test("getCreatedAt", () async {
    final res = await user1Queries.getCreatedAt();
    final parsed = DateTime.parse(res);
    expect(res, isA<String>());
    expect(parsed, isA<DateTime>());
  });

  test("updateOnlineStatus", () async {
    await user1Queries.updateOnlineStatus(true);
    final onlineStatus = await user1Queries.getWhoIsOnline();
    expect(onlineStatus, [true, false]);
    await user1Queries.updateOnlineStatus(true,
        shouldEditCollaboratorsInfo: true);
    final onlineStatus2 = await user1Queries.getWhoIsOnline();
    expect(onlineStatus2, [true, true]);
  });

  test("updateCurrentPhases", () async {
    await user1Queries.updateCurrentPhases(2);
    final currentPhases = await user1Queries.getCurrentPhases();
    expect(currentPhases, [2, 1]);
    await user1Queries.updateCurrentPhases(2,
        shouldEditCollaboratorsInfo: true);
    final currentPhases2 = await user1Queries.getCurrentPhases();
    expect(currentPhases2, [2, 2]);
  });

  test("setUserAsTheCurrentTalker", () async {
    await user1Queries.setUserAsTheCurrentTalker();
    final currentSpeaker = await user1Queries.getSpeakerSpotlight();
    expect(currentSpeaker, user1Queries.userUID);
    await user2Queries.setUserAsTheCurrentTalker();
    final currentSpeaker2 = await user2Queries.getSpeakerSpotlight();
    expect(currentSpeaker2, user1Queries.userUID);
  });

  test("clearTheCurrentTalker", () async {
    await user2Queries.clearTheCurrentTalker();
    final currentSpeaker2 = await user2Queries.getSpeakerSpotlight();
    expect(currentSpeaker2, user1Queries.userUID);
    await user1Queries.clearTheCurrentTalker();
    final currentSpeaker = await user1Queries.getSpeakerSpotlight();
    expect(currentSpeaker, null);
  });

  test("checkIfUserHasTheQuestion", () async {
    final res = await user1Queries.checkIfUserHasTheQuestion();
    expect(res, true);
  });

  test("getPresenceMetadata", () async {
    final stream = user1Stream.getPresenceMetadata();
    expect(
      stream,
      emits(
        NokhteSessionMetadata(
          userIsOnline: true,
          collaboratorIsOnline: true,
          collaboratorIsTalking: false,
          collaboratorPhase: 2.0,
          userPhase: 2.0,
          userIsTalking: false,
        ),
      ),
    );
  });

  test("composePath", () async {
    final res = await user1Queries.composePath("test");
    final timeStamp = await user1Queries.getCreatedAt();
    expect(res.split('/')[0], "${tSetup.firstUserUID}_${tSetup.secondUserUID}");
    expect(res.split('/')[1], timeStamp);
    expect(res.split('/')[2], "test.wav");
  });

  test("addNewAudioClipToSeessionMetadata", () async {
    await user1Queries.addNewAudioClipToSessionMetadata("test");
    final res = await user1Queries.getSessionMetadata();
    expect(res.first['audioID'], "test");
    final indexRes = await user1Queries.getMetadataIndex();
    expect(indexRes, 0);
  });
  test("updateCurentMetadataIndexContent", () async {
    await user1Queries.updateCurrentMetadataIndexContent("test");
    final res = await user1Queries.getSessionMetadata();
    expect(res.first['content'], "test");
  });

  test("getAudioIds", () async {
    final res = await user1Queries.getAudioIdPaths();
    final firstPath = res.first;
    final timeStamp = await user1Queries.getCreatedAt();
    expect(firstPath.split('/')[0],
        "${tSetup.firstUserUID}_${tSetup.secondUserUID}");
    expect(firstPath.split('/')[1], timeStamp);
    expect(firstPath.split('/')[2], "test.wav");
  });

  test("getAudioIdPaths", () async {
    final res = await user1Queries.getAudioIdPaths();
    final firstPath = res.first;
    final timeStamp = await user1Queries.getCreatedAt();
    expect(firstPath.split('/')[0],
        "${tSetup.firstUserUID}_${tSetup.secondUserUID}");
    expect(firstPath.split('/')[1], timeStamp);
    expect(firstPath.split('/')[2], "test.wav");
  });

  test("completeSession", () async {
    final sessionTimestamp = await user1Queries.getCreatedAt();
    await user1Queries.completeSession();
    final res = await user1FinishedQueries.select();
    expect(res.first["session_metadata"], [
      {
        "audioID": "test",
        "content": "test",
      }
    ]);
    expect(res.first["collaborator_uids"], sortedArr);
    expect(res.first["session_timestamp"], sessionTimestamp);
  });
}
