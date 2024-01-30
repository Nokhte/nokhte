// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_nokhte_sessions/queries.dart';

import 'shared/shared.dart';

void main() {
  late ActiveNokhteSessionQueries user1Queries;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    user1Queries = ActiveNokhteSessionQueries(supabase: tSetup.user1Supabase);
  });

  test("select", () async {
    await tSetup.supabaseAdmin.from("active_nokhte_sessions").insert({
      "meeting_uid": tSetup.firstUserUID,
      "collaborator_one_uid": tSetup.firstUserUID,
      "collaborator_two_uid": tSetup.secondUserUID,
    });
    final res = await user1Queries.select(tSetup.firstUserUID);
    expect(res, isNotEmpty);
  });

  test("delete", () async {
    await user1Queries.delete();
    final res = await user1Queries.select(tSetup.firstUserUID);
    expect(res, isEmpty);
  });
}
