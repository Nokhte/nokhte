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
  late String? currentUserUID;
  late UserNamesQueries user1Queries;
  late UserNamesQueries adminQueries;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    await UserSetupConstants.wipeUsernamesTable(supabaseAdmin: supabaseAdmin);
    final userIdResults = await UserSetupConstants.getUIDs();
    currentUserUID = userIdResults.first;
    await SignIn.user1(supabase: supabase);
    user1Queries = UserNamesQueries(supabase: supabase);
    adminQueries = UserNamesQueries(supabase: supabaseAdmin);
    adminQueries.userUID = currentUserUID ?? '';
  });

  tearDown(() async {
    await adminQueries.deleteUserInfo();
    await adminQueries.deleteCollaboratorPhraseInfo();
  });

  tearDownAll(() async {
    await UserSetupConstants.setUpUserNamesTableForSubsequentTests(
      supabase: supabase,
    );
  });
  test(
      "✅ should be able to CREATE & READ a row in the table if their uid isn't present already",
      () async {
    final userNamesRes = await user1Queries.insertUserInfo(
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );
    final collaboratorPhraseRes =
        await user1Queries.getCollaboratorPhraseInfo();

    expect(userNamesRes.first['first_name'], UserDataConstants.user1FirstName);
    expect(userNamesRes.first["last_name"], UserDataConstants.user1LastName);
    expect(userNamesRes.first["uid"], currentUserUID);
    expect(collaboratorPhraseRes.first["uid"], currentUserUID);
    expect(collaboratorPhraseRes.first["collaborator_phrase"], isNotEmpty);
    expect(collaboratorPhraseRes.first["adjective_id"], isA<int>());
    expect(collaboratorPhraseRes.first["noun_id"], isA<int>());
    expect(collaboratorPhraseRes.first["is_visible"], false);
    expect(
        collaboratorPhraseRes
            .first["has_an_existing_collaborator_relationship"],
        false);
  });

  test("❌ shouldn't be able to insert another row if they already have one",
      () async {
    await user1Queries.insertUserInfo(
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );

    try {
      await user1Queries.insertUserInfo(
        firstName: UserDataConstants.user1FirstName,
        lastName: UserDataConstants.user1LastName,
      );
    } catch (e) {
      expect(e, isA<PostgrestException>());
    }
  });
  test("❌ SHOULDN'T be able to enter a UID that isn't theirs", () async {
    try {
      await user1Queries.insertUserInfo(
        firstName: UserDataConstants.user1FirstName,
        lastName: UserDataConstants.user1LastName,
      );
    } catch (e) {
      expect(e, isA<PostgrestException>());
    }
  });
}
