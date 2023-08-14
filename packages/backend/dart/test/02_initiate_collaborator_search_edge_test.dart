// ignore_for_file: file_names

/// Let's do the test in dart
import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/general/sign_in.dart';
import 'package:primala_backend/constants/phrase_components/collaborator_phrase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/constants/general/user_setup_constants.dart';
import 'package:primala_backend/constants/general/supabase_client_constants.dart';

void main() {
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late CollaboratorPhraseIDs firstUserPhraseIDs;
  late CollaboratorPhraseIDs secondUserPhraseIDs;

  /// we're going to need an easy way of dynamically storing the phrases
  /// which is composed of 2 numbers and it's dynamic based on the instance

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
    // arrange
    await SignIn.user1(supabase: supabase);
    await supabase.functions.invoke("initiate-collaborator-search", body: {
      'wayfarerUID': firstUserUID,
      'queryAdjectiveID': secondUserPhraseIDs.adjectiveID,
      'queryNounID': secondUserPhraseIDs.nounID,
    });
    // first wave of expects
    final firstPoolRes =
        await supabaseAdmin.from('p2p_collaborator_pool').select();
    expect(firstPoolRes.length, 1);
    // second setup
    await supabase.functions.invoke("end-collaborator-search", body: {
      'overstayingWayfarer': firstUserUID,
    });
    // second wave of asserts
    final secondPoolRes =
        await supabaseAdmin.from('p2p_collaborator_pool').select();
    expect(secondPoolRes.length, 0);
  });

  test("SCENARIO 2: User1 Enters, Then User2 Enters", () async {
    await SignIn.user1(supabase: supabase);
    await supabase.functions.invoke("initiate-collaborator-search", body: {
      'wayfarerUID': firstUserUID,
      'queryAdjectiveID': secondUserPhraseIDs.adjectiveID,
      'queryNounID': secondUserPhraseIDs.nounID,
    });
    await supabase.functions.invoke("initiate-collaborator-search", body: {
      'wayfarerUID': secondUserUID,
      'queryAdjectiveID': firstUserPhraseIDs.adjectiveID,
      'queryNounID': firstUserPhraseIDs.nounID,
    });
    final poolRes = await supabaseAdmin.from('p2p_collaborator_pool').select();
    expect(poolRes.length, 0);
    final existingCollaboratorRes = await supabase
        .from('existing_collaborations')
        .select()
        .eq('collaborator_one', secondUserUID);
    expect(existingCollaboratorRes.length, 1);
  });
}
