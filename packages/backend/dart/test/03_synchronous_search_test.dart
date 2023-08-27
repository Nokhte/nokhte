/// 02_synchronous_search_test.dart
/// Proofreading Information
///   - Proofreader: Sonny Vesali
///   - Date: August 14th, 2023
///
/// Author: Sonny Vesali
///
/// This test file contains scenarios that validate the behavior of the
/// collaborative phrase search system and the collaboration management in the
/// application. It involves the interaction between various tables and custom
/// Supabase functions.
///
/// Scenarios Covered:
/// 1. User1 Enters & Gets Booted Out:
///    This scenario simulates a user (User1) initiating a collaborative phrase search and
///    then getting removed from the pool due to specific conditions. It verifies that the user
///    is initially added to the pool and then removed after the search process.
///    - Involved Edge functions: `initiate-collaborator-search`, `end-collaborator-search`
///    - Involved Table: `p2p_collaborator_pool`
///
/// 2. User1 Enters, Then User2 Enters:
///    This scenario simulates two users (User1 and User2) simultaneously initiating collaborative
///    phrase searches. It validates that when multiple users initiate searches at the same time,
///    they should not be matched with each other, and no collaboration should be formed.
///    - Involved Supabase function: `initiate-collaborator-search`
///    - Involved Tables: `existing_collaborations`, `p2p_collaborator_pool`
///
/// Note:
/// - The Supabase functions `initiate-collaborator-search` and `end-collaborator-search` must be running
///   for the tests to work correctly. Run `supabase functions serve` in the
/// - Make sure that the Supabase functions service is active during testing.

/// 02_synchronous_search_test.dart

// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/general/sign_in.dart';
import 'package:primala_backend/constants/phrase_components/collaborator_phrase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/constants/general/user_setup_constants.dart';
import 'package:primala_backend/constants/general/supabase_client_constants.dart';
import 'package:primala_backend/edge_functions.dart';

void main() {
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late CollaboratorPhraseIDs firstUserPhraseIDs;
  late CollaboratorPhraseIDs secondUserPhraseIDs;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    final userIdResults = await UserSetupConstants.fetchUIDs();
    final phraseIdResults = await UserSetupConstants.fetchCollaboratorPhraseIDs(
      supabaseAdmin: supabaseAdmin,
    );
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];

    firstUserPhraseIDs = phraseIdResults[0];
    secondUserPhraseIDs = phraseIdResults[1];
  });

  tearDown(() async {
    await supabaseAdmin.from('existing_collaborations').delete().eq(
          'collaborator_one',
          secondUserUID,
        );
  });

  test("SCENARIO 1: User1 Enters & Gets Booted Out", () async {
    // arrange 1
    await SignIn.user1(supabase: supabase);

    /// act 1
    await InitiateCollaboratorSearch.invoke(
      supabase: supabase,
      wayfarerUID: firstUserUID,
      queryPhraseIDs: secondUserPhraseIDs,
    );
    final firstPoolRes =
        await supabaseAdmin.from('p2p_collaborator_pool').select();

    /// assert 1
    expect(firstPoolRes.length, 1);
    // arrange 2
    await EndCollaboratorSearch.invoke(
      supabase: supabase,
      firstUserUID: firstUserUID,
    );

    /// act 2
    final secondPoolRes =
        await supabaseAdmin.from('p2p_collaborator_pool').select();

    /// assert 3
    expect(secondPoolRes.length, 0);
  });

  test("SCENARIO 2: User1 Enters, Then User2 Enters", () async {
    bool collaborationForged = false;

    await SignIn.user1(supabase: supabase);
    supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id']).listen((event) {
      if (event.isNotEmpty) {
        if (event[0]["collaborator_one"] == firstUserUID ||
            event[0]["collaborator_two"] == firstUserUID) {
          collaborationForged = true;
        }
      }
    });
    //

    // Perform necessary actions
    await InitiateCollaboratorSearch.invoke(
      supabase: supabase,
      wayfarerUID: firstUserUID,
      queryPhraseIDs: secondUserPhraseIDs,
    );
    await InitiateCollaboratorSearch.invoke(
      supabase: supabase,
      wayfarerUID: secondUserUID,
      queryPhraseIDs: firstUserPhraseIDs,
    );
    expect(collaborationForged, true);
  });
}
