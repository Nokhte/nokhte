// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/collaborator_phrases.dart';

void main() {
  late SupabaseClient supabase;
  late String? currentUserUID;
  late String? otherUserUID;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    final userIDResults = await UserSetupConstants.fetchUIDs();
    currentUserUID = userIDResults[0];
    otherUserUID = userIDResults[1];
    await SignIn.user1(supabase: supabase);
  });

  // tearDown(() async {});

  test("Should be able to read their row", () async {
    final collaboratorPhrasRes = await CollaboratorPhraseQueries.fetchUserInfo(
      supabase: supabase,
      userUID: currentUserUID,
    );
    expect(collaboratorPhrasRes, isNotEmpty);
  });
  test("Shouldn't be able to read someone else's row", () async {
    final collaboratorPhrasRes = await CollaboratorPhraseQueries.fetchUserInfo(
      supabase: supabase,
      userUID: otherUserUID,
    );
    expect(collaboratorPhrasRes, isEmpty);
  });

  test("Shouldn't be able to insert another row", () async {
    try {
      final failedInsertRes = await supabase
          .from('collaborator_phrases')
          .insert({
        "collaborator_phrase": "abandoned acid",
        "noun_id": "1",
        "adjective_id": "1"
      });
      expect(failedInsertRes, isA<PostgrestException>());
    } catch (e) {
      expect(e, isA<PostgrestException>());
    }
  });
}
