// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'shared/shared.dart';

void main() {
  late ExistingCollaborationsStream user1Streams;
  late InitiateCollaboratorSearch user1StartEdgeFunctions;
  late EndCollaboratorSearch user1EndEdgeFunctions;
  late InitiateCollaboratorSearch user2EdgeFunctions;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp(
        // shouldMakeCollaboration: true,
        );
    user1StartEdgeFunctions =
        InitiateCollaboratorSearch(supabase: tSetup.user1Supabase);
    user1EndEdgeFunctions =
        EndCollaboratorSearch(supabase: tSetup.user1Supabase);
    user2EdgeFunctions =
        InitiateCollaboratorSearch(supabase: tSetup.user2Supabase);
    user1Streams = ExistingCollaborationsStream(supabase: tSetup.user1Supabase);
  });

  tearDownAll(() async {
    await tSetup.tearDownAll();
  });

  test("user should be able to enter the pool", () async {
    await user1StartEdgeFunctions.invoke(tSetup.thirdUserUID);
    final firstPoolRes =
        await tSetup.supabaseAdmin.from('p2p_collaborator_pool').select();

    expect(firstPoolRes.length, 1);
  });

  test("user should be able to leave the pool", () async {
    await user1EndEdgeFunctions.invoke();

    final secondPoolRes =
        await tSetup.supabaseAdmin.from('p2p_collaborator_pool').select();

    expect(secondPoolRes.length, 1);
  });

  test("user should be able to make a collaboration", () async {
    await tSetup.supabaseAdmin.from('existing_collaborations').insert({
      "collaborator_one": tSetup.firstUserUID,
      "collaborator_two": tSetup.thirdUserUID,
      "collaboration_id": "${tSetup.firstUserUID}_${tSetup.thirdUserUID}",
      "is_consecrated": true,
      "is_currently_active": false,
      "who_gets_the_question": 2,
    });
    await user1StartEdgeFunctions.invoke(tSetup.secondUserUID);
    await user2EdgeFunctions.invoke(tSetup.firstUserUID);
    final user1Stream = user1Streams.getCollaboratorSearchAndEntryStatus();
    expect(user1Stream, emits(true));
  });
}
