// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/finished_nokhte_sessions/queries.dart';

import 'shared/shared.dart';

void main() {
  late FinishedNokhteSessionQueries user1Queries;
  final tSetup = CommonCollaborativeTestFunctions();
  late List<String> sortedUIDs;
  final tSessionMetadata = [
    {"audioID": "s1t1", "content": "s1t1"},
    {"audioID": "s1t2", "content": "s1t2"},
    {"audioID": "s1t3", "content": "s1t3"},
  ];
  final t2SessionMetadata = [
    {"audioID": "s2t1", "content": "s2t1"},
    {"audioID": "s2t2", "content": "s2t2"},
    {"audioID": "s2t3", "content": "s2t3"},
  ];
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
      sessionMetadata: tSessionMetadata,
      sessionTimestamp: now,
    );
    expect(
        res.first[FinishedNokhteSessionQueries.COLLABORATOR_UIDS], sortedUIDs);
    expect(res.first[FinishedNokhteSessionQueries.SESSION_METADATA],
        tSessionMetadata);
  });

  test("select", () async {
    final res = await user1Queries.select();
    expect(res, isNotEmpty);
  });

  test("selectByCollaborationId", () async {
    final user1And3 = [tSetup.firstUserUID, tSetup.thirdUserUID]..sort();
    await user1Queries.insert(
      collaboratorUIDs: user1And3,
      sessionMetadata: tSessionMetadata,
      sessionTimestamp: now,
    );
    final res = await user1Queries.selectByCollaborationId(tSetup.thirdUserUID);
    expect(
        res.first[FinishedNokhteSessionQueries.COLLABORATOR_UIDS], user1And3);
  });

  test("getAudioPathsFromSession", () async {
    await user1Queries.insert(
      collaboratorUIDs: sortedUIDs,
      sessionMetadata: t2SessionMetadata,
      sessionTimestamp: now,
    );
    final session1res =
        await user1Queries.getAudioPathsFromSession(tSetup.secondUserUID, 0);
    expect(session1res.first, contains('s1t1.wav'));
    expect(session1res[1], contains('s1t2.wav'));
    expect(session1res[2], contains('s1t3.wav'));
    final session2res =
        await user1Queries.getAudioPathsFromSession(tSetup.secondUserUID, 1);
    expect(session2res.first, contains('s2t1.wav'));
    expect(session2res[1], contains('s2t2.wav'));
    expect(session2res[2], contains('s2t3.wav'));
  });
}
