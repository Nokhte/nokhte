// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/user_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/constants/constants.dart';

/// @dev: run this one first as all subsequent tests are dependent on the
/// @ code that is run the `teardownAll` block

void main() {
  late SupabaseClient supabaseAdmin;
  late SupabaseClient supabase;
  late String? firstUserUID;
  late UserNamesQueries user1UserNameQueries;
  late UserNamesQueries adminUserNameQueries;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    await UserSetupConstants.wipeUsernamesTable(supabaseAdmin: supabaseAdmin);
    final userIdResults = await UserSetupConstants.getUIDs();
    firstUserUID = userIdResults.first;
    await SignIn.user1(supabase: supabase);
    user1UserNameQueries = UserNamesQueries(supabase: supabase);
    adminUserNameQueries = UserNamesQueries(supabase: supabaseAdmin);
    adminUserNameQueries.userUID = firstUserUID ?? '';
  });

  tearDown(() async {
    await adminUserNameQueries.deleteUserInfo();
  });

  tearDownAll(() async {
    await UserSetupConstants.setUpUserNamesTableForSubsequentTests(
      supabase: supabase,
    );
  });

  test(
      "✅ should be able to CREATE & READ a row in the table if their uid isn't present already",
      () async {
    final userNamesRes = await user1UserNameQueries.insertUserInfo(
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );
    expect(userNamesRes.first['first_name'], UserDataConstants.user1FirstName);
    expect(userNamesRes.first["last_name"], UserDataConstants.user1LastName);
    expect(userNamesRes.first["uid"], firstUserUID);
  });

  test("should be able to update their `has_sent_invitation` field", () async {
    await user1UserNameQueries.insertUserInfo(
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );
    final res = await user1UserNameQueries.updateHasSentAnInvitation(true);
    final dupRes = await user1UserNameQueries.updateHasSentAnInvitation(true);
    expect(res.first[user1UserNameQueries.HAS_SENT_AN_INVITATION], true);
    expect(dupRes.first[user1UserNameQueries.HAS_SENT_AN_INVITATION], true);
  });

  test(
      "should be able to update their `has_gone_through_invitation_flow` field",
      () async {
    await user1UserNameQueries.insertUserInfo(
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );
    final res =
        await user1UserNameQueries.updateHasGoneThroughInvitationFlow(true);
    final dupRes =
        await user1UserNameQueries.updateHasGoneThroughInvitationFlow(true);
    expect(
        res.first[user1UserNameQueries.HAS_GONE_THROUGH_INVITATION_FLOW], true);
    expect(dupRes.first[user1UserNameQueries.HAS_GONE_THROUGH_INVITATION_FLOW],
        true);
  });

  test("should be able to update their `wants_to_repeat_invitation_flow` field",
      () async {
    await user1UserNameQueries.insertUserInfo(
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );
    final res =
        await user1UserNameQueries.updateWantsToRepeatInvitationFlow(true);
    final dupRes =
        await user1UserNameQueries.updateWantsToRepeatInvitationFlow(true);
    expect(
        res.first[user1UserNameQueries.WANTS_TO_REPEAT_INVITATION_FLOW], true);
    expect(dupRes.first[user1UserNameQueries.WANTS_TO_REPEAT_INVITATION_FLOW],
        true);
  });

  test("❌ shouldn't be able to insert another row if they already have one",
      () async {
    await user1UserNameQueries.insertUserInfo(
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );

    try {
      await user1UserNameQueries.insertUserInfo(
        firstName: UserDataConstants.user1FirstName,
        lastName: UserDataConstants.user1LastName,
      );
    } catch (e) {
      expect(e, isA<PostgrestException>());
    }
  });
  test("❌ SHOULDN'T be able to enter a UID that isn't theirs", () async {
    try {
      await user1UserNameQueries.insertUserInfo(
        firstName: UserDataConstants.user1FirstName,
        lastName: UserDataConstants.user1LastName,
      );
    } catch (e) {
      expect(e, isA<PostgrestException>());
    }
  });
}
