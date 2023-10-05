// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/constants.dart';
import 'package:primala_backend/existing_collaborations.dart';
import 'package:primala_backend/finished_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/working_collaborative_documents.dart';

void main() {
  late SupabaseClient user1Supabase;
  late SupabaseClient user2Supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late WorkingCollaborativeDocumentsQueries user1WorkingQueries;
  late WorkingCollaborativeDocumentsQueries user2WorkingQueries;
  late FinishedCollaborativeP2PPurposeDocumentsQueries user1FinishedQueries;
  late ExistingCollaborationsQueries existingCollaborationsQueries;

  setUpAll(() async {
    user1Supabase = SupabaseClientConfigConstants.supabase;
    user2Supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    existingCollaborationsQueries =
        ExistingCollaborationsQueries(supabase: supabaseAdmin);
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];
    await SignIn.user1(supabase: user1Supabase);
    await SignIn.user2(supabase: user2Supabase);
    user1WorkingQueries =
        WorkingCollaborativeDocumentsQueries(supabase: user1Supabase);
    user2WorkingQueries =
        WorkingCollaborativeDocumentsQueries(supabase: user2Supabase);
    user1FinishedQueries = FinishedCollaborativeP2PPurposeDocumentsQueries(
      supabase: user1Supabase,
    );
    await existingCollaborationsQueries.createNewCollaboration(
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });

  tearDownAll(() async {
    await supabaseAdmin.from('working_collaborative_documents').delete().eq(
          'collaborator_one_uid',
          firstUserUID,
        );
    await existingCollaborationsQueries.deleteExistingCollaboration(
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });

  test("User Should be able to create, edit & commit a document", () async {
    final res = await user1WorkingQueries.createCollaborativeDocument(
        docType: 'purpose');
    expect(res[0]["collaborator_one_uid"], firstUserUID);
    expect(res[0]["doc_type"], "purpose");
    expect(res[0]["collaborator_two_uid"], secondUserUID);
    expect(res[0]["content"], isEmpty);
    expect(res[0]["collaborator_one_delta"], -1);
    expect(res[0]["collaborator_two_delta"], -1);
    expect(res[0]["collaborator_one_is_active"], false);
    expect(res[0]["collaborator_two_is_active"], false);
    final stream =
        WorkingCollaborativeDocumentsStreams(supabase: user1Supabase);
    stream.docContentStream().listen((value) {
      expect(value.content, "newContent");
      expect(value.lastEditedBy, firstUserUID);
      expect(value.currentUserUID, firstUserUID);
    });
    await user1WorkingQueries.updateExistingDocument(
      newContent: "newContent",
    );
    await user1WorkingQueries.updateCommitDesireStatus(wantsToCommit: true);
    await user2WorkingQueries.updateCommitDesireStatus(wantsToCommit: true);
    final res2 = await user1FinishedQueries.fetchDocInfo(docType: 'purpose');
    expect(res2[0]["collaborator_one_uid"], firstUserUID);
    expect(res2[0]["collaborator_two_uid"], secondUserUID);
    expect(res2[0]["content"], "newContent");
    expect(res2[0]["doc_type"], "purpose");
  });
}
