// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/finished_nokhte_sessions/queries.dart';

import 'shared/shared.dart';

void main() {
  late FinishedNokhteSessionQueries user1Queries;
  final tSetup = CommonCollaborativeTestFunctions();
  late List<String> sortedUIDs;
  final tSessionContent = ["test1", 'test2', 'test3'];
  final now = DateTime.now().toIso8601String();

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    user1Queries = FinishedNokhteSessionQueries(supabase: tSetup.user1Supabase);
  });

  tearDownAll(() async {
    await tSetup.supabaseAdmin.from('finished_nokhte_sessions').delete().eq(
          FinishedNokhteSessionQueries.COLLABORATOR_UIDS,
          [tSetup.firstUserUID, tSetup.secondUserUID]..sort(),
        );
    await tSetup.supabaseAdmin.from('finished_nokhte_sessions').delete().eq(
          FinishedNokhteSessionQueries.COLLABORATOR_UIDS,
          [tSetup.firstUserUID, tSetup.thirdUserUID]..sort(),
        );
  });

  test("insert", () async {
    sortedUIDs = [tSetup.firstUserUID, tSetup.secondUserUID]..sort();
    final res = await user1Queries.insert(
      collaboratorUIDs: sortedUIDs,
      sessionContent: tSessionContent,
      sessionTimestamp: now,
    );
    expect(
        res.first[FinishedNokhteSessionQueries.COLLABORATOR_UIDS], sortedUIDs);
    expect(res.first[FinishedNokhteSessionQueries.CONTENT], tSessionContent);
  });

  test("select", () async {
    final res = await user1Queries.select();
    expect(res, isNotEmpty);
  });

  test("selectByCollaborationId", () async {
    final user1And3 = [tSetup.firstUserUID, tSetup.thirdUserUID]..sort();
    await user1Queries.insert(
      collaboratorUIDs: user1And3,
      sessionContent: tSessionContent,
      sessionTimestamp: now,
    );
    final res = await user1Queries.selectByCollaborationId(tSetup.thirdUserUID);
    expect(
        res.first[FinishedNokhteSessionQueries.COLLABORATOR_UIDS], user1And3);
  });
}
