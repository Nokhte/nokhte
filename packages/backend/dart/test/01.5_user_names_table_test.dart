import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/user_names/queries.dart';

import 'shared/shared.dart';

void main() {
  late UserNamesQueries user1Queries;
  final tSetup = CommonCollaborativeTestFunctions();

  setUp(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    user1Queries = UserNamesQueries(supabase: tSetup.user1Supabase);
  });

  group("getCollaboratorRows", () {
    tearDownAll(
        () async => await tSetup.supabaseAdmin.from('user_names').update({
              "authorized_viewers": [],
            }).eq('uid', tSetup.secondUserUID));
    test("shoulnd't be able to read anything if nothing is shared", () async {
      final initialRes = await user1Queries.getCollaboratorRows();
      expect(initialRes, isEmpty);
    });
    test("should be able to read collaborators row (if shared)", () async {
      await tSetup.supabaseAdmin.from('user_names').update({
        "authorized_viewers": [tSetup.firstUserUID],
      }).eq('uid', tSetup.secondUserUID);
      final postRes = await user1Queries.getCollaboratorRows();
      expect(postRes, isNotEmpty);
      await tSetup.supabaseAdmin.from('user_names').update({
        "authorized_viewers": [tSetup.firstUserUID],
      }).eq('uid', tSetup.secondUserUID);
    });
  });
}
