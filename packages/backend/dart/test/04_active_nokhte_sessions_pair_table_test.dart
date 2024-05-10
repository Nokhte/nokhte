// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/finished_nokhte_sessions/queries.dart';
import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_metadata.dart';

import 'shared/shared.dart';

void main() {
  late ActiveNokhteSessionQueries user1Queries;
  late ActiveNokhteSessionQueries user2Queries;
  late ActiveNokhteSessionsStream user1Stream;
  late UserMetadataQueries user1MetadataQueries;
  late FinishedNokhteSessionQueries user1FinishedQueries;
  final tSetup = CommonCollaborativeTestFunctions();
  List sortedArr = [];

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    sortedArr = [tSetup.firstUserUID, tSetup.secondUserUID]..sort();
    user1Queries = ActiveNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user1MetadataQueries = UserMetadataQueries(supabase: tSetup.user1Supabase);
    user2Queries = ActiveNokhteSessionQueries(supabase: tSetup.user2Supabase);
    user1FinishedQueries =
        FinishedNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user1Stream = ActiveNokhteSessionsStream(supabase: tSetup.user1Supabase);
  });

  tearDownAll(() async {
    await tSetup.supabaseAdmin
        .from("finished_nokhte_sessions")
        .delete()
        .eq("collaborator_uids", sortedArr);
  });

  test("select", () async {
    await tSetup.supabaseAdmin.from("active_nokhte_sessions").insert({
      "collaborator_uids": sortedArr,
      "leader_uid": sortedArr.first,
    });
    final res = await user1Queries.select();
    expect(res, isNotEmpty);
  });

  test("getWhoIsOnline", () async {
    final res = await user1Queries.getWhoIsOnline();
    expect(res, [true, true]);
  });

  test("getSpeakerSpotlight", () async {
    final res = await user1Queries.getSpeakerSpotlight();
    expect(res, null);
  });

  test("getCurrentPhases", () async {
    final res = await user1Queries.getCurrentPhases();
    expect(res, [0, 0]);
  });

  test("getCreatedAt", () async {
    final res = await user1Queries.getCreatedAt();
    final parsed = DateTime.parse(res);
    expect(res, isA<String>());
    expect(parsed, isA<DateTime>());
  });

  test("startTheSession", () async {
    await user1Queries.startTheSession();
    final res = await user1Queries.getHasBegun();
    expect(res, true);
  });

  test("updateOnlineStatus", () async {
    await user1Queries.updateOnlineStatus(false);
    final onlineStatus = await user1Queries.getWhoIsOnline();
    expect(onlineStatus, [false, true]);
    await user2Queries.updateOnlineStatus(false);
    final onlineStatus2 = await user1Queries.getWhoIsOnline();
    expect(onlineStatus2, [false, false]);
  });

  test("updateHasGyroscope", () async {
    await user1Queries.updateHasGyroscope(false);
    await user2Queries.updateHasGyroscope(false);
    final gyroscopesRes = await user1Queries.getHaveGyroscopes();
    expect(gyroscopesRes, [false, false]);
  });

  test("addContent", () async {
    await user1Queries.addContent('test');
    final res = await user1Queries.getContent();
    expect(res, ["test"]);
  });

  test("updateSpeakerSpotlight", () async {
    await user1Queries.updateSpeakerSpotlight(addUserToSpotlight: true);
    final res1 = await user1Queries.getSpeakerSpotlight();
    expect(res1, isNotNull);
    await user1Queries.updateSpeakerSpotlight(addUserToSpotlight: false);
    final res2 = await user1Queries.getSpeakerSpotlight();
    expect(res2, isNull);
  });

  test("updateCurrentPhases", () async {
    await user1Queries.updateCurrentPhases(1);
    final currentPhases = await user1Queries.getCurrentPhases();
    expect(currentPhases, [1, 0]);
    await user2Queries.updateCurrentPhases(1);
    final currentPhases2 = await user1Queries.getCurrentPhases();
    expect(currentPhases2, [1, 1]);
  });

  test("getPresenceMetadata", () async {
    final stream = user1Stream.getPresenceMetadata();
    expect(
      stream,
      emits(
        NokhteSessionMetadata(
          isAPremiumSession: false,
          userCanSpeak: true,
          userIsSpeaking: false,
          userIndex: sortedArr.indexOf(tSetup.firstUserUID),
          everyoneHasGyroscopes: false,
          phases: [1.0, 1.0],
          everyoneIsOnline: false,
          sessionHasBegun: true,
        ),
      ),
    );
  });

  test("completeSession", () async {
    final sessionTimestamp = await user1Queries.getCreatedAt();
    await user1Queries.completeTheSession();
    final res = await user1FinishedQueries.select();
    expect(res.first["content"], ["test"]);
    expect(res.first["collaborator_uids"], sortedArr);
    expect(res.first["session_timestamp"], sessionTimestamp);
    expect(res.first["aliases"], ["", ""]);
    final userMetadataRes = await user1MetadataQueries.getUserMetadata();
    expect(userMetadataRes.first['is_subscribed'], false);
    expect(userMetadataRes.first['has_used_trial'], false);
  });
}
