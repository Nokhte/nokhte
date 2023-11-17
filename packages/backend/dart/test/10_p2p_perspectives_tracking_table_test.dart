// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/constants/general/general.dart';
import 'package:nokhte_backend/tables/p2p_perspectives_tracking.dart';

import 'shared/shared.dart';

void main() {
  final tSetup = CommonCollaborativeTestFunctions();
  late P2PPerspectivesTrackingQueries user1Queries;
  late P2PPerspectivesTrackingQueries adminQueries;
  final tPerspectives = ['perspective1', 'perspective2', 'perspective 3'];
  final tPerspectives2 = ['perspective11', 'perspective22', 'perspective 33'];
  final tPerspectives3 = [
    'perspective111',
    'perspective222',
    'perspective 333'
  ];

  setUpAll(() async {
    await tSetup.setUp();
    user1Queries =
        P2PPerspectivesTrackingQueries(supabase: tSetup.user1Supabase);
    adminQueries = P2PPerspectivesTrackingQueries(
        supabase: SupabaseClientConfigConstants.supabaseAdmin);
  });

  tearDownAll(() async {
    adminQueries.currentUserUID = tSetup.firstUserUID;
    await adminQueries.deletePerspectivesRow();
    tSetup.tearDownAll();
  });
  test(
      "collaborators should be able to commit multiple perspectives & retain perspectives history",
      () async {
    final res1 = await user1Queries.insertNewPerspectives(
      newPerspectives: tPerspectives,
    );

    expect(res1.first["current_perspectives"], tPerspectives);
    expect(res1.first["past_perspectives"], {});

    final res2 = await user1Queries.insertNewPerspectives(
      newPerspectives: tPerspectives2,
    );

    final List pastPerspectives =
        res2.first["past_perspectives"]["commits"].first["perspectives"];
    expect(pastPerspectives, tPerspectives);
    expect(res2.first["current_perspectives"], tPerspectives2);

    final res3 = await user1Queries.insertNewPerspectives(
      newPerspectives: tPerspectives3,
    );

    final List pastPerspectives2 =
        res3.first["past_perspectives"]["commits"][1]["perspectives"];
    final List pastPerspectives3 =
        res3.first["past_perspectives"]["commits"].first["perspectives"];
    expect(pastPerspectives2, tPerspectives2);
    expect(pastPerspectives3, tPerspectives);
  });
}
