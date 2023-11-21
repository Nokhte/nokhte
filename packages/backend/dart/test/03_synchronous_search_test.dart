// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

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
    final userIdResults = await UserSetupConstants.getUIDs();
    final phraseIdResults = await UserSetupConstants.getCollaboratorPhraseIDs(
      supabaseAdmin: supabaseAdmin,
    );
    firstUserUID = userIdResults.first;
    secondUserUID = userIdResults[1];

    firstUserPhraseIDs = phraseIdResults.first;
    secondUserPhraseIDs = phraseIdResults[1];
  });

  tearDown(() async {
    await supabaseAdmin.from('existing_collaborations').delete().eq(
          'collaborator_one',
          secondUserUID,
        );
  });

  test("SCENARIO 1: User1 Enters & Gets Booted Out", () async {
    await SignIn.user1(supabase: supabase);

    await InitiateCollaboratorSearch.invoke(
      supabase: supabase,
      wayfarerUID: firstUserUID,
      queryPhraseIDs: secondUserPhraseIDs,
    );
    final firstPoolRes =
        await supabaseAdmin.from('p2p_collaborator_pool').select();

    expect(firstPoolRes.length, 1);

    await EndCollaboratorSearch.invoke(
      supabase: supabase,
      firstUserUID: firstUserUID,
    );

    final secondPoolRes =
        await supabaseAdmin.from('p2p_collaborator_pool').select();

    expect(secondPoolRes.length, 0);
  });

  test("SCENARIO 2: User1 Enters, Then User2 Enters", () async {
    Stream<bool> collaborationForged;

    await SignIn.user1(supabase: supabase);
    final existingCollaborations = ExistingCollaborationsStream();
    collaborationForged = existingCollaborations.notifyWhenForged(
      supabase: supabase,
      userUID: firstUserUID,
    );

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
    expect(collaborationForged, emits(true));
    existingCollaborations.cancelStream();
    expect(existingCollaborations.isListening, false);
  });
}
