// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/finished_collaborative_p2p_purpose_documents.dart';

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
  });

  tearDown(() async {
    await supabaseAdmin
        .from('finished_collaborative_p2p_purpose_documents')
        .delete()
        .eq(
          'collaborator_one_uid',
          firstUserUID,
        );
  });

  test("User Should be able to commit a message, add it here", () async {
    await SignIn.user1(supabase: supabase);

    final res = await FinishedCollaborativeP2PPurposeDocuments.insertDoc(
      supabase: supabase,
      currentUserUID: firstUserUID,
      collaboratorUserUID: secondUserUID,
      content: "committed purpose",
      docType: 'purpose',
    );
    expect(res[0]["collaborator_one_uid"], firstUserUID);
    expect(res[0]["doc_type"], "purpose");
    expect(res[0]["collaborator_two_uid"], secondUserUID);
    expect(res[0]["content"], "committed purpose");
    await SignIn.user2(supabase: supabase);
    final res2 = await FinishedCollaborativeP2PPurposeDocuments.fetchDocInfo(
      supabase: supabase,
      currentUserUID: firstUserUID,
      docType: 'purpose',
    );
    expect(res2[0]["collaborator_one_uid"], firstUserUID);
    expect(res2[0]["collaborator_two_uid"], secondUserUID);
    expect(res2[0]["content"], "committed purpose");
    expect(res2[0]["doc_type"], "purpose");
  });
}
