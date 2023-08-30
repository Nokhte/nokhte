// ignore_for_file: file_names

import 'package:primala_backend/tables/usernames/common_user_names_queries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/constants/constants.dart';

/// @dev: run this one first as all subsequent tests are dependent on the
/// @ code that is run the `teardownAll` block

void main() {
  late SupabaseClient supabaseAdmin;
  late SupabaseClient supabase;
  late String? currentUserUID;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    await UserSetupConstants.wipeUsernamesTable(supabaseAdmin: supabaseAdmin);
    final userIdResults = await UserSetupConstants.fetchUIDs();
    currentUserUID = userIdResults[0];
    await SignIn.user1(supabase: supabase);
  });

  tearDown(() async {
    await CommonUserNamesQueries.deleteUserInfo(
        supabase: supabaseAdmin, userUID: currentUserUID);
    await CommonUserNamesQueries.deleteCollaboratorPhraseInfo(
        supabase: supabaseAdmin, userUID: currentUserUID);
  });

  tearDownAll(() async {
    await UserSetupConstants.setUpUserNamesTableForSubsequentTests(
      supabase: supabase,
    );
  });
  test(
      "✅ should be able to CREATE & READ a row in the table if their uid isn't present already",
      () async {
    // arrange + act
    final userNamesRes = await CommonUserNamesQueries.insertUserInfo(
      supabase: supabase,
      userUID: currentUserUID,
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );
    final collaboratorPhraseRes =
        await CommonUserNamesQueries.fetchCollaboratorPhraseInfo(
      supabase: supabase,
      userUID: currentUserUID,
    );

    /// user_names row checks
    expect(userNamesRes[0]['first_name'], UserDataConstants.user1FirstName);
    expect(userNamesRes[0]["last_name"], UserDataConstants.user1LastName);
    expect(userNamesRes[0]["uid"], currentUserUID);

    /// collaborator_phrases row checks
    expect(collaboratorPhraseRes[0]["uid"], currentUserUID);
    expect(collaboratorPhraseRes[0]["collaborator_phrase"], isNotEmpty);
    expect(collaboratorPhraseRes[0]["adjective_id"], isA<int>());
    expect(collaboratorPhraseRes[0]["noun_id"], isA<int>());
    expect(collaboratorPhraseRes[0]["is_visible"], false);
    expect(
        collaboratorPhraseRes[0]["has_an_existing_collaborator_relationship"],
        false);
  });

  test("❌ shouldn't be able to insert another row if they already have one",
      () async {
    // arrange
    await CommonUserNamesQueries.insertUserInfo(
      supabase: supabase,
      userUID: currentUserUID,
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );
    // act
    try {
      await CommonUserNamesQueries.insertUserInfo(
        supabase: supabase,
        userUID: currentUserUID,
        firstName: UserDataConstants.user1FirstName,
        lastName: UserDataConstants.user1LastName,
      );
    } catch (e) {
      // assert
      expect(e, isA<PostgrestException>());
    }
  });
  test("❌ SHOULDN'T be able to enter a UID that isn't theirs", () async {
    try {
      await CommonUserNamesQueries.insertUserInfo(
        supabase: supabase,
        userUID: UserDataConstants.user1UID,
        firstName: UserDataConstants.user1FirstName,
        lastName: UserDataConstants.user1LastName,
      );
    } catch (e) {
      expect(e, isA<PostgrestException>());
    }
  });
}
