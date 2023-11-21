// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/constants/constants.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'shared/shared.dart';

void main() {
  late CollaboratorPhraseIDs user1PhraseIDs;
  late CollaboratorPhraseIDs user2PhraseIDs;
  late ExistingCollaborationsStream user1Streams;
  late InitiateCollaboratorSearch user1StartEdgeFunctions;
  late EndCollaboratorSearch user1EndEdgeFunctions;
  late InitiateCollaboratorSearch user2EdgeFunctions;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    user1StartEdgeFunctions =
        InitiateCollaboratorSearch(supabase: tSetup.user1Supabase);
    user1EndEdgeFunctions =
        EndCollaboratorSearch(supabase: tSetup.user1Supabase);
    user2EdgeFunctions =
        InitiateCollaboratorSearch(supabase: tSetup.user2Supabase);
    user1Streams = ExistingCollaborationsStream(supabase: tSetup.user1Supabase);
    final phraseIdResults = await UserSetupConstants.getCollaboratorPhraseIDs(
      supabaseAdmin: tSetup.supabaseAdmin,
    );

    user1PhraseIDs = phraseIdResults.first;
    user2PhraseIDs = phraseIdResults[1];
  });

  tearDown(() async {
    await tSetup.tearDownAll();
  });

  test("user should be able to enter the pool", () async {
    await user1StartEdgeFunctions.invoke(user2PhraseIDs);
    final firstPoolRes =
        await tSetup.supabaseAdmin.from('p2p_collaborator_pool').select();

    expect(firstPoolRes.length, 1);
  });

  test("user should be able to leave the pool", () async {
    await user1EndEdgeFunctions.invoke();

    final secondPoolRes =
        await tSetup.supabaseAdmin.from('p2p_collaborator_pool').select();

    expect(secondPoolRes.length, 0);
  });

  test("user should be able to make a collaboration", () async {
    await user1StartEdgeFunctions.invoke(user2PhraseIDs);
    await user2EdgeFunctions.invoke(user1PhraseIDs);
    final user1Stream = user1Streams.getCollaboratorSearchStatus();
    expect(user1Stream, emits(true));
  });
}
