// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/st_active_nokhte_sessions.dart';
// import 'package:nokhte_backend/tables/user_metadata.dart';

import 'shared/shared.dart';

void main() {
  late RTActiveNokhteSessionQueries user1RTQueries;
  late RTActiveNokhteSessionQueries user2RTQueries;
  late RTActiveNokhteSessionQueries user3RTQueries;
  late RTActiveNokhteSessionQueries user4RTQueries;
  late STActiveNokhteSessionQueries user1STQueries;
  late STActiveNokhteSessionQueries user2STQueries;
  late STActiveNokhteSessionQueries user3STQueries;
  late STActiveNokhteSessionQueries user4STQueries;

  late FinishedNokhteSessionQueries user1FinishedQueries;
  // late UserMetadataQueries user1MetadataQueries;
  // late UserMetadataQueries user2MetadataQueries;
  // late UserMetadataQueries user3MetadataQueries;
  // late UserMetadataQueries user4MetadataQueries;
  final tSetup = CommonCollaborativeTestFunctions();
  List sortedArr = [];
  List unsortedArr = [];

  setUpAll(() async {
    await tSetup.setUp();
    sortedArr = [
      tSetup.firstUserUID,
      tSetup.secondUserUID,
      tSetup.thirdUserUID,
      tSetup.fourthUserUID
    ];
    sortedArr.sort();
    unsortedArr = [
      tSetup.firstUserUID,
      tSetup.secondUserUID,
      tSetup.thirdUserUID,
      tSetup.fourthUserUID
    ];
    user1RTQueries =
        RTActiveNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user2RTQueries =
        RTActiveNokhteSessionQueries(supabase: tSetup.user2Supabase);
    user3RTQueries =
        RTActiveNokhteSessionQueries(supabase: tSetup.user3Supabase);
    user4RTQueries =
        RTActiveNokhteSessionQueries(supabase: tSetup.user4Supabase);
    user1STQueries =
        STActiveNokhteSessionQueries(supabase: tSetup.user1Supabase);
    user2STQueries =
        STActiveNokhteSessionQueries(supabase: tSetup.user2Supabase);
    user3STQueries =
        STActiveNokhteSessionQueries(supabase: tSetup.user3Supabase);
    user4STQueries =
        STActiveNokhteSessionQueries(supabase: tSetup.user4Supabase);
    user1FinishedQueries =
        FinishedNokhteSessionQueries(supabase: tSetup.user1Supabase);
    // user1MetadataQueries = UserMetadataQueries(supabase: tSetup.user1Supabase);
    // user2MetadataQueries = UserMetadataQueries(supabase: tSetup.user2Supabase);
    // user3MetadataQueries = UserMetadataQueries(supabase: tSetup.user3Supabase);
    // user4MetadataQueries = UserMetadataQueries(supabase: tSetup.user4Supabase);
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
    await user1STQueries.initializeSession();
    Future.delayed(Duration(seconds: 1), () async {
      await user2STQueries.joinSession(tSetup.firstUserUID);
      await user3STQueries.joinSession(tSetup.firstUserUID);
      await user4STQueries.joinSession(tSetup.firstUserUID);
    });
  }

  deleteSession() async {
    await tSetup.supabaseAdmin
        .from("rt_active_nokhte_sessions")
        .delete()
        .eq("has_begun", true);
    await tSetup.supabaseAdmin
        .from("rt_active_nokhte_sessions")
        .delete()
        .eq("has_begun", false);
    await tSetup.supabaseAdmin
        .from("st_active_nokhte_sessions")
        .delete()
        .eq("collaborator_uids", unsortedArr);
    await tSetup.supabaseAdmin
        .from("finished_nokhte_sessions")
        .delete()
        .eq("collaborator_uids", sortedArr);
  }

  shouldProperlyUpdateAllValues() {
    test("initiateSession", () async {
      await user1STQueries.initializeSession();
      final res = await user1STQueries.select();
      expect(res[0]["leader_uid"], tSetup.firstUserUID);
    });

    test("joinSession", () async {
      await user2STQueries.joinSession(tSetup.firstUserUID);
      await user3STQueries.joinSession(tSetup.firstUserUID);
      await user4STQueries.joinSession(tSetup.firstUserUID);
      final res = await user2STQueries.select();
      expect(res[0]["collaborator_uids"], unsortedArr);
      expect(res[0]["leader_uid"], tSetup.firstUserUID);
    });
    test("updateOnlineStatus", () async {
      await user1RTQueries.updateOnlineStatus(false);
      final onlineStatus = (await user1RTQueries.getWhoIsOnline()).mainType;
      print("onlineStatus: $onlineStatus");

      expect(onlineStatus[0], false);
      expect(onlineStatus[1], true);
      expect(onlineStatus[2], true);
      expect(onlineStatus[3], true);
      await user2RTQueries.updateOnlineStatus(false);
      final onlineStatus2 = (await user1RTQueries.getWhoIsOnline()).mainType;
      expect(onlineStatus2[0], false);
      expect(onlineStatus2[1], false);
      expect(onlineStatus2[2], true);
      expect(onlineStatus2[3], true);
      await user3RTQueries.updateOnlineStatus(false);
      final onlineStatus3 = (await user1RTQueries.getWhoIsOnline()).mainType;
      expect(onlineStatus3[0], false);
      expect(onlineStatus3[1], false);
      expect(onlineStatus3[2], false);
      expect(onlineStatus3[3], true);
      await user4RTQueries.updateOnlineStatus(false);
      final onlineStatus4 = (await user1RTQueries.getWhoIsOnline()).mainType;
      expect(onlineStatus4[0], false);
      expect(onlineStatus4[1], false);
      expect(onlineStatus4[2], false);
      expect(onlineStatus4[3], false);
    });

    test("addContent", () async {
      await user1STQueries.addContent('test');
      final res = await user1STQueries.getContent();
      expect(res.mainType, ["test"]);
    });

    test("updateSpeakerSpotlight", () async {
      await user1RTQueries.updateSpeakerSpotlight(addUserToSpotlight: true);
      final res1 = await user1RTQueries.getSpeakerSpotlight();
      expect(res1.mainType, isNotNull);
      await user1RTQueries.updateSpeakerSpotlight(addUserToSpotlight: false);
      final res2 = await user1RTQueries.getSpeakerSpotlight();
      expect(res2.mainType, isNull);
    });

    test("updateCurrentPhases", () async {
      await user1RTQueries.updateCurrentPhases(2);
      final currentPhases = (await user1RTQueries.getCurrentPhases()).mainType;
      expect(currentPhases[0], 2);
      expect(currentPhases[1], 0);
      expect(currentPhases[2], 0);
      expect(currentPhases[3], 0);
      await user2RTQueries.updateCurrentPhases(2);
      final currentPhases2 = (await user1RTQueries.getCurrentPhases()).mainType;
      expect(currentPhases2[0], 2);
      expect(currentPhases2[1], 2);
      expect(currentPhases2[2], 0);
      expect(currentPhases2[3], 0);
      await user3RTQueries.updateCurrentPhases(2);
      final currentPhases3 = (await user1RTQueries.getCurrentPhases()).mainType;
      expect(currentPhases3[0], 2);
      expect(currentPhases3[1], 2);
      expect(currentPhases3[2], 2);
      expect(currentPhases3[3], 0);
      await user4RTQueries.updateCurrentPhases(2);
      final currentPhases4 = (await user1RTQueries.getCurrentPhases()).mainType;
      expect(currentPhases4[0], 2);
      expect(currentPhases4[1], 2);
      expect(currentPhases4[2], 2);
      expect(currentPhases4[3], 2);
    });

    test('completeTheSession', () async {
      final sessionTimestamp = await user1STQueries.getCreatedAt();
      await user1STQueries.completeTheSession();
      final res = await user1FinishedQueries.select();
      expect(res.first["content"], ["test"]);
      expect(
        res.first["collaborator_uids"],
        sortedArr,
      );
      expect(res.first["session_timestamp"], sessionTimestamp);
      expect(res.first["aliases"], ["", "", "", ""]);
    });
  }

  // group("[TRIAL, TRIAL TRIAL, TRIAL] => ✅", () {
  //   setUpAll(() async {
  //     await deleteSession();
  //     await resetAllSubscriptionAndTrialStatus();
  //     await createSession();
  //   });

  //   shouldProperlyUpdateAllValues();
  // });

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
      }).eq("uid", unsortedArr.first);
      await tSetup.supabaseAdmin.from("user_metadata").update({
        "has_used_trial": true,
      }).eq("uid", unsortedArr[1]);
    });

    tearDownAll(() async => await deleteSession());

    test("initiateSession", () async {
      await user1STQueries.initializeSession();
      final res = await user1STQueries.select();
      expect(res[0]["leader_uid"], tSetup.firstUserUID);
    });

    test("joinSession", () async {
      await user2STQueries.joinSession(tSetup.firstUserUID);
      await user3STQueries.joinSession(tSetup.firstUserUID);
      await user4STQueries.joinSession(tSetup.firstUserUID);
      final res = await user2STQueries.select();
      expect(res[0]["collaborator_uids"], unsortedArr);
      expect(res[0]["leader_uid"], tSetup.firstUserUID);
    });

    test("updateOnlineStatus", () async {
      await user1RTQueries.updateOnlineStatus(false);
      final onlineStatus = await user1RTQueries.getWhoIsOnline();
      expect(onlineStatus, [true, true, true, true]);
      await user2RTQueries.updateOnlineStatus(false);
      final onlineStatus2 = await user1RTQueries.getWhoIsOnline();
      expect(onlineStatus2, [true, true, true, true]);
      await user3RTQueries.updateOnlineStatus(false);
      final onlineStatus3 = await user1RTQueries.getWhoIsOnline();
      expect(onlineStatus3, [true, true, true, true]);
      await user4RTQueries.updateOnlineStatus(false);
      final onlineStatus4 = await user1RTQueries.getWhoIsOnline();
      expect(onlineStatus4, [true, true, true, true]);
    });

    test("addContent", () async {
      await user1STQueries.addContent('test');
      final res = await user1STQueries.getContent();
      expect(res, []);
    });

    test("updateSpeakerSpotlight", () async {
      await user1RTQueries.updateSpeakerSpotlight(addUserToSpotlight: true);
      final res1 = await user1RTQueries.getSpeakerSpotlight();
      expect(res1, isNull);
      await user1RTQueries.updateSpeakerSpotlight(addUserToSpotlight: false);
      final res2 = await user1RTQueries.getSpeakerSpotlight();
      expect(res2, isNull);
    });

    test("updateCurrentPhases", () async {
      await user1RTQueries.updateCurrentPhases(1);
      final currentPhases = (await user1RTQueries.getCurrentPhases()).mainType;
      expect(currentPhases, [0, 0, 0, 0]);
      await user2RTQueries.updateCurrentPhases(1);
      final currentPhases2 = (await user1RTQueries.getCurrentPhases()).mainType;
      expect(currentPhases2, [0, 0, 0, 0]);
      await user3RTQueries.updateCurrentPhases(1);
      final currentPhases3 = (await user1RTQueries.getCurrentPhases()).mainType;
      expect(currentPhases3, [0, 0, 0, 0]);
      await user4RTQueries.updateCurrentPhases(1);
      final currentPhases4 = (await user1RTQueries.getCurrentPhases()).mainType;
      expect(currentPhases4, [0, 0, 0, 0]);
    });
  });
}
