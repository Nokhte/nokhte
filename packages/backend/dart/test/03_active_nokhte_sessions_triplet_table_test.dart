// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/st_active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_metadata.dart';
import 'shared/shared.dart';

void main() {
  late RTActiveNokhteSessionQueries user1RTQueries;
  late RTActiveNokhteSessionQueries user2RTQueries;
  late RTActiveNokhteSessionQueries user3RTQueries;
  late STActiveNokhteSessionQueries user1STQueries;
  late STActiveNokhteSessionQueries user2STQueries;
  late STActiveNokhteSessionQueries user3STQueries;
  late FinishedNokhteSessionQueries user1FinishedQueries;
  late UserMetadataQueries user1MetadataQueries;
  final tSetup = CommonCollaborativeTestFunctions();
  List sortedArr = [];

  setUpAll(() async {
    await tSetup.setUp();
    sortedArr = [
      tSetup.firstUserUID,
      tSetup.secondUserUID,
      tSetup.thirdUserUID
    ];
    sortedArr.sort();
    user1RTQueries =
        RTActiveNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user2RTQueries =
        RTActiveNokhteSessionQueries(supabase: tSetup.user2Supabase);
    user3RTQueries =
        RTActiveNokhteSessionQueries(supabase: tSetup.user3Supabase);
    user1STQueries =
        STActiveNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user2STQueries =
        STActiveNokhteSessionQueries(supabase: tSetup.user2Supabase);
    user3STQueries =
        STActiveNokhteSessionQueries(supabase: tSetup.user3Supabase);
    user1FinishedQueries =
        FinishedNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user1MetadataQueries = UserMetadataQueries(supabase: tSetup.user1Supabase);
    for (var userUID in sortedArr) {
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": false,
        "has_used_trial": false,
      }).eq("uid", userUID);
    }
  });

  test("initiateSession", () async {
    await user1STQueries.initializeSession();
    final res = await user1STQueries.select();
    expect(res[0]["leader_uid"], tSetup.firstUserUID);
  });

  test("joinSession", () async {
    await user2STQueries.joinSession(tSetup.firstUserUID);
    await user3STQueries.joinSession(tSetup.firstUserUID);
    final res = await user2STQueries.select();
    expect(res[0]["collaborator_uids"], sortedArr);
    expect(res[0]["leader_uid"], tSetup.firstUserUID);
  });

  test("getHasPremiumAccess", () async {
    final res = await user1STQueries.getHasPremiumAccess();
    expect(res, [true, true, true]);
  });

  test("updateOnlineStatus", () async {
    await user1RTQueries.updateOnlineStatus(false);
    final onlineStatus = await user1RTQueries.getWhoIsOnline();
    expect(onlineStatus[sortedArr.indexOf(tSetup.firstUserUID)], false);
    await user2RTQueries.updateOnlineStatus(false);
    final onlineStatus2 = await user1RTQueries.getWhoIsOnline();
    expect(onlineStatus2[sortedArr.indexOf(tSetup.secondUserUID)], false);
    await user3RTQueries.updateOnlineStatus(false);
    final onlineStatus3 = await user1RTQueries.getWhoIsOnline();
    expect(onlineStatus3, [false, false, false]);
  });

  test("addContent", () async {
    await user1STQueries.addContent('test');
    final res = await user1STQueries.getContent();
    expect(res, ["test"]);
  });

  test("updateSpeakerSpotlight", () async {
    await user1RTQueries.updateSpeakerSpotlight(addUserToSpotlight: true);
    final res1 = await user1RTQueries.getSpeakerSpotlight();
    expect(res1, isNotNull);
    await user1RTQueries.updateSpeakerSpotlight(addUserToSpotlight: false);
    final res2 = await user1RTQueries.getSpeakerSpotlight();
    expect(res2, isNull);
  });

  test("updateCurrentPhases", () async {
    await user1RTQueries.updateCurrentPhases(1);
    final currentPhases = await user1RTQueries.getCurrentPhases();
    expect(currentPhases[sortedArr.indexOf(tSetup.firstUserUID)], 1);
    await user2RTQueries.updateCurrentPhases(1);
    final currentPhases2 = await user1RTQueries.getCurrentPhases();
    expect(currentPhases2[sortedArr.indexOf(tSetup.firstUserUID)], 1);
    expect(currentPhases2[sortedArr.indexOf(tSetup.secondUserUID)], 1);
    await user3RTQueries.updateCurrentPhases(1);
    final currentPhases3 = await user1RTQueries.getCurrentPhases();
    expect(currentPhases3[sortedArr.indexOf(tSetup.firstUserUID)], 1);
    expect(currentPhases3[sortedArr.indexOf(tSetup.secondUserUID)], 1);
    expect(currentPhases3[sortedArr.indexOf(tSetup.thirdUserUID)], 1);
  });

  test("completeSession", () async {
    final sessionTimestamp = await user1STQueries.getCreatedAt();
    await user1STQueries.completeTheSession();
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
