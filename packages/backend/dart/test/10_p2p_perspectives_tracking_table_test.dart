// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/constants/general/general.dart';
import 'package:nokhte_backend/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';

void main() {
  late SupabaseClient user1Supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late ExistingCollaborationsQueries existingCollaborationsQueries;
  late P2PPerspectivesTracking user1Queries;
  late P2PPerspectivesTracking adminQueries;
  final tPerspectives = ['perspective1', 'perspective2', 'perspective 3'];
  final tPerspectives2 = ['perspective11', 'perspective22', 'perspective 33'];
  final tPerspectives3 = [
    'perspective111',
    'perspective222',
    'perspective 333'
  ];

  setUpAll(() async {
    user1Supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    await SignIn.user1(supabase: user1Supabase);
    await SignIn.user1(supabase: supabaseAdmin);

    existingCollaborationsQueries = ExistingCollaborationsQueries(
      supabase: SupabaseClientConfigConstants.supabaseAdmin,
    );
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];
    user1Queries = P2PPerspectivesTracking(supabase: user1Supabase);
    adminQueries = P2PPerspectivesTracking(
        supabase: SupabaseClientConfigConstants.supabaseAdmin);
    await existingCollaborationsQueries.createNewCollaboration(
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });

  // tearDown(() async {});

  tearDownAll(() async {
    existingCollaborationsQueries.currentUserUID = firstUserUID;
    adminQueries.currentUserUID = firstUserUID;
    await adminQueries.deletePerspectivesRow();
    await existingCollaborationsQueries.deleteExistingCollaboration(
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });
  test(
      "collaborators should be able to commit multiple perspectives & retain perspectives history",
      () async {
    // act I
    final res1 = await user1Queries.insertNewPerspectives(
      newPerspectives: tPerspectives,
    );
    // assert I
    expect(res1[0]["current_perspectives"], tPerspectives);
    expect(res1[0]["past_perspectives"], {});
    // act ii
    final res2 = await user1Queries.insertNewPerspectives(
      newPerspectives: tPerspectives2,
    );
    // assert ii
    final List pastPerspectives =
        res2[0]["past_perspectives"]["commits"][0]["perspectives"];
    expect(pastPerspectives, tPerspectives);
    expect(res2[0]["current_perspectives"], tPerspectives2);
    // act iii
    final res3 = await user1Queries.insertNewPerspectives(
      newPerspectives: tPerspectives3,
    );
    // assert iii
    final List pastPerspectives2 =
        res3[0]["past_perspectives"]["commits"][1]["perspectives"];
    final List pastPerspectives3 =
        res3[0]["past_perspectives"]["commits"][0]["perspectives"];
    expect(pastPerspectives2, tPerspectives2);
    expect(pastPerspectives3, tPerspectives);
  });
}
