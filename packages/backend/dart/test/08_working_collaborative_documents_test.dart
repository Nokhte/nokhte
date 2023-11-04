// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/finished_collaborative_documents.dart';
import 'package:nokhte_backend/working_collaborative_documents.dart';

import 'shared/shared.dart';

void main() {
  final tSetup = CommonCollaborativeTestFunctions();
  late WorkingCollaborativeDocumentsQueries user1WorkingQueries;
  late WorkingCollaborativeDocumentsQueries user2WorkingQueries;
  late WorkingCollaborativeDocumentsQueries adminWorkingQueries;
  late FinishedCollaborativeP2PPurposeDocumentsQueries user1FinishedQueries;
  late FinishedCollaborativeP2PPurposeDocumentsQueries adminFinishedQueries;

  setUpAll(() async {
    await tSetup.setUp();
    user1WorkingQueries =
        WorkingCollaborativeDocumentsQueries(supabase: tSetup.user1Supabase);
    user2WorkingQueries =
        WorkingCollaborativeDocumentsQueries(supabase: tSetup.user2Supabase);
    user1FinishedQueries = FinishedCollaborativeP2PPurposeDocumentsQueries(
      supabase: tSetup.user1Supabase,
    );
    adminFinishedQueries = FinishedCollaborativeP2PPurposeDocumentsQueries(
      supabase: tSetup.supabaseAdmin,
    );
    adminWorkingQueries =
        WorkingCollaborativeDocumentsQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    adminFinishedQueries.collaboratorInfo =
        user1FinishedQueries.collaboratorInfo;
    adminWorkingQueries.collaboratorInfo =
        adminFinishedQueries.collaboratorInfo;
    await adminWorkingQueries.deleteThedoc();
    await adminFinishedQueries.deleteADoc();
    await tSetup.tearDownAll();
  });

  test("User Should be able to create, edit & commit a document", () async {
    final res = await user1WorkingQueries.createCollaborativeDocument(
        docType: 'purpose');
    expect(res[0]["collaborator_one_uid"], tSetup.firstUserUID);
    expect(res[0]["doc_type"], "purpose");
    expect(res[0]["collaborator_two_uid"], tSetup.secondUserUID);
    expect(res[0]["content"], isEmpty);
    expect(res[0]["collaborator_one_delta"], -1);
    expect(res[0]["collaborator_two_delta"], -1);
    expect(res[0]["collaborator_one_is_active"], false);
    expect(res[0]["collaborator_two_is_active"], false);
    final stream =
        WorkingCollaborativeDocumentsStreams(supabase: tSetup.user1Supabase);
    stream.docContentStream().listen((value) {
      expect(value.content, "newContent");
      expect(value.lastEditedBy, tSetup.firstUserUID);
      expect(value.currentUserUID, tSetup.firstUserUID);
    });
    await user1WorkingQueries.updateExistingDocument(
      newContent: "newContent",
    );
    await user1WorkingQueries.updateCommitDesireStatus(wantsToCommit: true);
    await user2WorkingQueries.updateCommitDesireStatus(wantsToCommit: true);
    final res2 = await user1FinishedQueries.fetchDocInfo(docType: 'purpose');
    expect(res2[0]["collaborator_one_uid"], tSetup.firstUserUID);
    expect(res2[0]["collaborator_two_uid"], tSetup.secondUserUID);
    expect(res2[0]["content"], "newContent");
    expect(res2[0]["doc_type"], "purpose");
  });
}
