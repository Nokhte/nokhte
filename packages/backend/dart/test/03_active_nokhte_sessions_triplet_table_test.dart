// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_metadata.dart';
import 'shared/shared.dart';

void main() {
  late ActiveNokhteSessionQueries user1Queries;
  late ActiveNokhteSessionQueries user2Queries;
  late ActiveNokhteSessionQueries user3Queries;
  late FinishedNokhteSessionQueries user1FinishedQueries;
  late UserMetadataQueries user1MetadataQueries;
  final tSetup = CommonCollaborativeTestFunctions();
  List sortedArr = [];

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    sortedArr = [
      tSetup.firstUserUID,
      tSetup.secondUserUID,
      tSetup.thirdUserUID
    ];
    sortedArr.sort();
    user1Queries = ActiveNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user1FinishedQueries =
        FinishedNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user1MetadataQueries = UserMetadataQueries(supabase: tSetup.user1Supabase);
    user2Queries = ActiveNokhteSessionQueries(supabase: tSetup.user2Supabase);
    user3Queries = ActiveNokhteSessionQueries(supabase: tSetup.user3Supabase);
    for (var userUID in sortedArr) {
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": false,
        "has_used_trial": false,
      }).eq("uid", userUID);
    }
  });

  test("initiateSession", () async {
    await user1Queries.initializeSession();
    final res = await user1Queries.select();
    expect(res[0]["leader_uid"], tSetup.firstUserUID);
  });

  test("joinSession", () async {
    await user2Queries.joinSession(tSetup.firstUserUID);
    await user3Queries.joinSession(tSetup.firstUserUID);
    final res = await user2Queries.select();
    expect(res[0]["collaborator_uids"], sortedArr);
    expect(res[0]["leader_uid"], tSetup.firstUserUID);
  });

  test("getIsAValidSession", () async {
    final res = await user1Queries.getIsAValidSession();
    expect(res, true);
  });

  test("updateOnlineStatus", () async {
    await user1Queries.updateOnlineStatus(false);
    final onlineStatus = await user1Queries.getWhoIsOnline();
    expect(onlineStatus[sortedArr.indexOf(tSetup.firstUserUID)], false);
    await user2Queries.updateOnlineStatus(false);
    final onlineStatus2 = await user1Queries.getWhoIsOnline();
    expect(onlineStatus2[sortedArr.indexOf(tSetup.secondUserUID)], false);
    await user3Queries.updateOnlineStatus(false);
    final onlineStatus3 = await user1Queries.getWhoIsOnline();
    expect(onlineStatus3, [false, false, false]);
  });

  test("updateHasGyroscope", () async {
    await user1Queries.updateHasGyroscope(false);
    await user2Queries.updateHasGyroscope(false);
    await user3Queries.updateHasGyroscope(false);
    final gyroscopesRes = await user1Queries.getHaveGyroscopes();
    expect(gyroscopesRes, [false, false, false]);
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
    expect(currentPhases[sortedArr.indexOf(tSetup.firstUserUID)], 1);
    await user2Queries.updateCurrentPhases(1);
    final currentPhases2 = await user1Queries.getCurrentPhases();
    expect(currentPhases2[sortedArr.indexOf(tSetup.firstUserUID)], 1);
    expect(currentPhases2[sortedArr.indexOf(tSetup.secondUserUID)], 1);
    await user3Queries.updateCurrentPhases(1);
    final currentPhases3 = await user1Queries.getCurrentPhases();
    expect(currentPhases3[sortedArr.indexOf(tSetup.firstUserUID)], 1);
    expect(currentPhases3[sortedArr.indexOf(tSetup.secondUserUID)], 1);
    expect(currentPhases3[sortedArr.indexOf(tSetup.thirdUserUID)], 1);
  });

  test("completeSession", () async {
    final sessionTimestamp = await user1Queries.getCreatedAt();
    await user1Queries.completeTheSession();
    final res = await user1FinishedQueries.select();
    expect(res.first["content"], ["test"]);
    expect(res.first["collaborator_uids"], sortedArr);
    expect(res.first["session_timestamp"], sessionTimestamp);
    expect(res.first["aliases"], ["", "", ""]);
    final userMetadataRes = await user1MetadataQueries.getUserMetadata();
    expect(userMetadataRes.first['is_subscribed'], false);
    expect(userMetadataRes.first['has_used_trial'], false);
  });
}
