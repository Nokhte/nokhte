// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_metadata.dart';

import 'shared/shared.dart';

void main() {
  late ActiveNokhteSessionQueries user1Queries;
  late FinishedNokhteSessionQueries user1FinishedQueries;
  late UserMetadataQueries user1MetadataQueries;
  late ActiveNokhteSessionQueries user2Queries;
  late UserMetadataQueries user2MetadataQueries;
  late ActiveNokhteSessionQueries user3Queries;
  late UserMetadataQueries user3MetadataQueries;
  late ActiveNokhteSessionQueries user4Queries;
  late UserMetadataQueries user4MetadataQueries;
  final tSetup = CommonCollaborativeTestFunctions();
  List sortedArr = [];

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    sortedArr = [
      tSetup.firstUserUID,
      tSetup.secondUserUID,
      tSetup.thirdUserUID,
      tSetup.fourthUserUID
    ]..sort();
    user1Queries = ActiveNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user1FinishedQueries =
        FinishedNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user1MetadataQueries = UserMetadataQueries(supabase: tSetup.user1Supabase);
    user2Queries = ActiveNokhteSessionQueries(supabase: tSetup.user2Supabase);
    user2MetadataQueries = UserMetadataQueries(supabase: tSetup.user2Supabase);
    user3Queries = ActiveNokhteSessionQueries(supabase: tSetup.user3Supabase);
    user3MetadataQueries = UserMetadataQueries(supabase: tSetup.user3Supabase);
    user4Queries = ActiveNokhteSessionQueries(supabase: tSetup.user4Supabase);
    user4MetadataQueries = UserMetadataQueries(supabase: tSetup.user4Supabase);
  });

  resetAllSubscriptionAndTrialStatus() async {
    for (var userUID in sortedArr) {
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": false,
        "has_used_trial": false,
      }).eq("uid", userUID);
    }
  }

  createSession() async {
    await user1Queries.initializeSession();
    Future.delayed(Duration(seconds: 1), () async {
      await user2Queries.joinSession(tSetup.firstUserUID);
      await user3Queries.joinSession(tSetup.firstUserUID);
      await user4Queries.joinSession(tSetup.firstUserUID);
    });
  }

  deleteSession() async {
    await tSetup.supabaseAdmin
        .from("active_nokhte_sessions")
        .delete()
        .eq("collaborator_uids", sortedArr);
    await tSetup.supabaseAdmin
        .from("finished_nokhte_sessions")
        .delete()
        .eq("collaborator_uids", sortedArr);
  }

  shouldProperlyUpdateAllValues() {
    test("initiateSession", () async {
      await user1Queries.initializeSession();
      final res = await user1Queries.select();
      expect(res[0]["leader_uid"], tSetup.firstUserUID);
    });

    test("joinSession", () async {
      await user2Queries.joinSession(tSetup.firstUserUID);
      await user3Queries.joinSession(tSetup.firstUserUID);
      await user4Queries.joinSession(tSetup.firstUserUID);
      final res = await user2Queries.select();
      expect(res[0]["collaborator_uids"], sortedArr);
      expect(res[0]["leader_uid"], tSetup.firstUserUID);
    });
    test("updateOnlineStatus", () async {
      await user1Queries.updateOnlineStatus(false);
      final onlineStatus = await user1Queries.getWhoIsOnline();
      expect(onlineStatus[sortedArr.indexOf(tSetup.firstUserUID)], false);
      expect(onlineStatus[sortedArr.indexOf(tSetup.secondUserUID)], true);
      expect(onlineStatus[sortedArr.indexOf(tSetup.thirdUserUID)], true);
      expect(onlineStatus[sortedArr.indexOf(tSetup.fourthUserUID)], true);
      await user2Queries.updateOnlineStatus(false);
      final onlineStatus2 = await user1Queries.getWhoIsOnline();
      expect(onlineStatus2[sortedArr.indexOf(tSetup.firstUserUID)], false);
      expect(onlineStatus2[sortedArr.indexOf(tSetup.secondUserUID)], false);
      expect(onlineStatus2[sortedArr.indexOf(tSetup.thirdUserUID)], true);
      expect(onlineStatus2[sortedArr.indexOf(tSetup.fourthUserUID)], true);
      await user3Queries.updateOnlineStatus(false);
      final onlineStatus3 = await user1Queries.getWhoIsOnline();
      expect(onlineStatus3[sortedArr.indexOf(tSetup.firstUserUID)], false);
      expect(onlineStatus3[sortedArr.indexOf(tSetup.secondUserUID)], false);
      expect(onlineStatus3[sortedArr.indexOf(tSetup.thirdUserUID)], false);
      expect(onlineStatus3[sortedArr.indexOf(tSetup.fourthUserUID)], true);
      await user4Queries.updateOnlineStatus(false);
      final onlineStatus4 = await user1Queries.getWhoIsOnline();
      expect(onlineStatus4[sortedArr.indexOf(tSetup.firstUserUID)], false);
      expect(onlineStatus4[sortedArr.indexOf(tSetup.secondUserUID)], false);
      expect(onlineStatus4[sortedArr.indexOf(tSetup.thirdUserUID)], false);
      expect(onlineStatus4[sortedArr.indexOf(tSetup.fourthUserUID)], false);
    });

    test("updateHasGyroscope", () async {
      await user1Queries.updateHasGyroscope(false);
      await user2Queries.updateHasGyroscope(false);
      await user3Queries.updateHasGyroscope(false);
      await user4Queries.updateHasGyroscope(false);
      final gyroscopesRes = await user1Queries.getHaveGyroscopes();
      expect(gyroscopesRes, [false, false, false, false]);
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
      expect(currentPhases[sortedArr.indexOf(tSetup.secondUserUID)], 0);
      expect(currentPhases[sortedArr.indexOf(tSetup.thirdUserUID)], 0);
      expect(currentPhases[sortedArr.indexOf(tSetup.fourthUserUID)], 0);
      await user2Queries.updateCurrentPhases(1);
      final currentPhases2 = await user1Queries.getCurrentPhases();
      expect(currentPhases2[sortedArr.indexOf(tSetup.firstUserUID)], 1);
      expect(currentPhases2[sortedArr.indexOf(tSetup.secondUserUID)], 1);
      expect(currentPhases2[sortedArr.indexOf(tSetup.thirdUserUID)], 0);
      expect(currentPhases2[sortedArr.indexOf(tSetup.fourthUserUID)], 0);
      await user3Queries.updateCurrentPhases(1);
      final currentPhases3 = await user1Queries.getCurrentPhases();
      expect(currentPhases3[sortedArr.indexOf(tSetup.firstUserUID)], 1);
      expect(currentPhases3[sortedArr.indexOf(tSetup.secondUserUID)], 1);
      expect(currentPhases3[sortedArr.indexOf(tSetup.thirdUserUID)], 1);
      expect(currentPhases3[sortedArr.indexOf(tSetup.fourthUserUID)], 0);
      await user4Queries.updateCurrentPhases(1);
      final currentPhases4 = await user1Queries.getCurrentPhases();
      expect(currentPhases4[sortedArr.indexOf(tSetup.firstUserUID)], 1);
      expect(currentPhases4[sortedArr.indexOf(tSetup.secondUserUID)], 1);
      expect(currentPhases4[sortedArr.indexOf(tSetup.thirdUserUID)], 1);
      expect(currentPhases4[sortedArr.indexOf(tSetup.fourthUserUID)], 1);
    });

    test('completeTheSession', () async {
      final sessionTimestamp = await user1Queries.getCreatedAt();
      await user1Queries.completeTheSession();
      final res = await user1FinishedQueries.select();
      expect(res.first["content"], ["test"]);
      expect(res.first["collaborator_uids"], sortedArr);
      expect(res.first["session_timestamp"], sessionTimestamp);
      expect(res.first["aliases"], ["", "", "", ""]);

      final user1MetadataRes = await user1MetadataQueries.getUserMetadata();
      expect(user1MetadataRes.first['has_used_trial'], true);

      final user2MetadataRes = await user2MetadataQueries.getUserMetadata();
      expect(user2MetadataRes.first['has_used_trial'], true);

      final user3MetadataRes = await user3MetadataQueries.getUserMetadata();
      expect(user3MetadataRes.first['has_used_trial'], true);

      final user4MetadataRes = await user4MetadataQueries.getUserMetadata();
      expect(user4MetadataRes.first['has_used_trial'], true);
    });
  }

  group("[TRIAL, TRIAL TRIAL, TRIAL] => ✅", () {
    setUpAll(() async {
      await deleteSession();
      await resetAllSubscriptionAndTrialStatus();
      await createSession();
    });

    shouldProperlyUpdateAllValues();
  });

  group("[SUBBED, TRIAL, TRIAL, TRIAL] => ✅", () {
    setUpAll(() async {
      await deleteSession();
      await resetAllSubscriptionAndTrialStatus();
      await createSession();
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": true,
      }).eq("uid", sortedArr.first);
    });

    shouldProperlyUpdateAllValues();
  });
  group("[SUBBED, NOT SUBBED + USED TRIAL, TRIAL, TRIAL] => ❌", () {
    setUpAll(() async {
      await resetAllSubscriptionAndTrialStatus();
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": true,
      }).eq("uid", sortedArr.first);
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "has_used_trial": true,
      }).eq("uid", sortedArr[1]);
    });

    tearDownAll(() async => await deleteSession());

    test("initiateSession", () async {
      await user1Queries.initializeSession();
      final res = await user1Queries.select();
      expect(res[0]["leader_uid"], tSetup.firstUserUID);
    });

    test("joinSession", () async {
      await user2Queries.joinSession(tSetup.firstUserUID);
      await user3Queries.joinSession(tSetup.firstUserUID);
      await user4Queries.joinSession(tSetup.firstUserUID);
      final res = await user2Queries.select();
      expect(res[0]["collaborator_uids"], sortedArr);
      expect(res[0]["leader_uid"], tSetup.firstUserUID);
    });

    test("updateOnlineStatus", () async {
      await user1Queries.updateOnlineStatus(false);
      final onlineStatus = await user1Queries.getWhoIsOnline();
      expect(onlineStatus, [true, true, true, true]);
      await user2Queries.updateOnlineStatus(false);
      final onlineStatus2 = await user1Queries.getWhoIsOnline();
      expect(onlineStatus2, [true, true, true, true]);
      await user3Queries.updateOnlineStatus(false);
      final onlineStatus3 = await user1Queries.getWhoIsOnline();
      expect(onlineStatus3, [true, true, true, true]);
      await user4Queries.updateOnlineStatus(false);
      final onlineStatus4 = await user1Queries.getWhoIsOnline();
      expect(onlineStatus4, [true, true, true, true]);
    });

    test("updateHasGyroscope", () async {
      await user1Queries.updateHasGyroscope(false);
      await user2Queries.updateHasGyroscope(false);
      await user3Queries.updateHasGyroscope(false);
      await user4Queries.updateHasGyroscope(false);
      final gyroscopesRes = await user1Queries.getHaveGyroscopes();
      expect(gyroscopesRes, [true, true, true, true]);
    });

    test("addContent", () async {
      await user1Queries.addContent('test');
      final res = await user1Queries.getContent();
      expect(res, []);
    });

    test("updateSpeakerSpotlight", () async {
      await user1Queries.updateSpeakerSpotlight(addUserToSpotlight: true);
      final res1 = await user1Queries.getSpeakerSpotlight();
      expect(res1, isNull);
      await user1Queries.updateSpeakerSpotlight(addUserToSpotlight: false);
      final res2 = await user1Queries.getSpeakerSpotlight();
      expect(res2, isNull);
    });

    test("updateCurrentPhases", () async {
      await user1Queries.updateCurrentPhases(1);
      final currentPhases = await user1Queries.getCurrentPhases();
      expect(currentPhases, [0, 0, 0, 0]);
      await user2Queries.updateCurrentPhases(1);
      final currentPhases2 = await user1Queries.getCurrentPhases();
      expect(currentPhases2, [0, 0, 0, 0]);
      await user3Queries.updateCurrentPhases(1);
      final currentPhases3 = await user1Queries.getCurrentPhases();
      expect(currentPhases3, [0, 0, 0, 0]);
      await user4Queries.updateCurrentPhases(1);
      final currentPhases4 = await user1Queries.getCurrentPhases();
      expect(currentPhases4, [0, 0, 0, 0]);
    });
  });

  group("[SUBBED, SUBBED, SUBBED , TRIAL] => ✅", () {
    setUpAll(() async {
      await resetAllSubscriptionAndTrialStatus();
      await createSession();
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": true,
      }).eq("uid", sortedArr.first);
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": true,
      }).eq("uid", sortedArr[1]);
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": true,
      }).eq("uid", sortedArr[2]);
    });

    shouldProperlyUpdateAllValues();
  });
  group("[SUBBED, SUBBED, SUBBED , SUBBED] => ✅", () {
    setUpAll(() async {
      await deleteSession();
      await resetAllSubscriptionAndTrialStatus();
      await createSession();
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": true,
      }).eq("uid", sortedArr.first);
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": true,
      }).eq("uid", sortedArr[1]);
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": true,
      }).eq("uid", sortedArr[2]);
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "is_subscribed": true,
      }).eq("uid", sortedArr[3]);
    });

    shouldProperlyUpdateAllValues();
  });
}
