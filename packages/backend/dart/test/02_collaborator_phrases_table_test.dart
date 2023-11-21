// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/collaborator_phrases.dart';

import 'shared/shared.dart';

void main() {
  final tSetup = CommonCollaborativeTestFunctions();
  late CollaboratorPhraseQueries user1Queries;

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    user1Queries = CollaboratorPhraseQueries(supabase: tSetup.user1Supabase);
  });

  test("Should be able to read their row", () async {
    final res = await user1Queries.getUserInfo();
    expect(res, isNotEmpty);
  });
}
