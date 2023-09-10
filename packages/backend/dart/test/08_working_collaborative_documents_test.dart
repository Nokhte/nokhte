// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/working_collaborative_documents.dart';

void main() {
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];
    await ExistingCollaborationsQueries.createNewCollaboration(
      supabase: supabaseAdmin,
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });

  tearDown(() async {
    await supabaseAdmin.from('working_collaborative_documents').delete().eq(
          'collaborator_one_uid',
          firstUserUID,
        );
    await ExistingCollaborationsQueries.deleteExistingCollaboration(
      supabase: supabaseAdmin,
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });

  test("User Should be able to create a document", () async {
    await SignIn.user1(supabase: supabase);
    final res =
        await WorkingCollaborativeDocumentsQueries.createCollaborativeDocument(
            supabase: supabase,
            currentUserUID: firstUserUID,
            docType: 'purpose');
    expect(res[0]["collaborator_one_uid"], firstUserUID);
    expect(res[0]["doc_type"], "purpose");
    expect(res[0]["collaborator_two_uid"], secondUserUID);
    expect(res[0]["content"], isEmpty);
    expect(res[0]["collaborator_one_delta"], -1);
    expect(res[0]["collaborator_two_delta"], -1);
    expect(res[0]["collaborator_one_is_active"], false);
    expect(res[0]["collaborator_two_is_active"], false);
  });
}
