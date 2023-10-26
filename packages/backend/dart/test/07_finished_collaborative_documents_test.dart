// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/constants/constants.dart';
import 'package:nokhte_backend/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/finished_collaborative_documents.dart';

void main() {
  late SupabaseClient user1Supabase;
  late SupabaseClient user2Supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late ExistingCollaborationsQueries existingCollaborationsQueries;
  late FinishedCollaborativeP2PPurposeDocumentsQueries user1FinishedQueries;
  late FinishedCollaborativeP2PPurposeDocumentsQueries user2FinishedQueries;

  setUpAll(() async {
    user1Supabase = SupabaseClientConfigConstants.supabase;
    user2Supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    existingCollaborationsQueries =
        ExistingCollaborationsQueries(supabase: supabaseAdmin);
    await SignIn.user1(supabase: user1Supabase);
    await SignIn.user2(supabase: user2Supabase);
    user1FinishedQueries = FinishedCollaborativeP2PPurposeDocumentsQueries(
      supabase: user1Supabase,
    );
    user2FinishedQueries = FinishedCollaborativeP2PPurposeDocumentsQueries(
      supabase: user2Supabase,
    );
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];
    await existingCollaborationsQueries.createNewCollaboration(
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });

  tearDownAll(() async {
    //
    await existingCollaborationsQueries.deleteExistingCollaboration(
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });

  test("User Should be able to commit a message, add it here", () async {
    final res = await user1FinishedQueries.insertDoc(
      content: "committed purpose",
      docType: 'purpose',
    );
    expect(res[0]["collaborator_one_uid"], firstUserUID);
    expect(res[0]["doc_type"], "purpose");
    expect(res[0]["collaborator_two_uid"], secondUserUID);
    expect(res[0]["content"], "committed purpose");
    final res2 = await user2FinishedQueries.fetchDocInfo(
      docType: 'purpose',
    );
    expect(res2[0]["collaborator_one_uid"], firstUserUID);
    expect(res2[0]["collaborator_two_uid"], secondUserUID);
    expect(res2[0]["content"], "committed purpose");
    expect(res2[0]["doc_type"], "purpose");
  });
}
