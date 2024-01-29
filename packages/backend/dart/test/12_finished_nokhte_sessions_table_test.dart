// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/finished_nokhte_sessions/queries.dart';

import 'shared/shared.dart';

void main() {
  late FinishedNokhteSessionQueries user1Queries;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    user1Queries = FinishedNokhteSessionQueries(supabase: tSetup.user1Supabase);
  });

  tearDownAll(() async {
    await tSetup.supabaseAdmin
        .from("finished_nokhte_sessions")
        .delete()
        .eq("collaborator_one_uid", tSetup.firstUserUID);
  });

  test("insert", () async {
    final res = await user1Queries.insert(
      collaboratorOneUID: tSetup.firstUserUID,
      collaboratorTwoUID: tSetup.secondUserUID,
    );
    expect(res, isNotEmpty);
  });

  test("select", () async {
    final res = await user1Queries.select(
      collaboratorOneUID: tSetup.firstUserUID,
      collaboratorTwoUID: tSetup.secondUserUID,
    );
    expect(res, isNotEmpty);
  });
}
