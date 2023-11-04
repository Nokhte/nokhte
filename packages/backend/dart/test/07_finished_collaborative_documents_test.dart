// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/finished_collaborative_documents.dart';

import 'shared/shared.dart';

void main() {
  final tSetup = CommonCollaborativeTestFunctions();
  late FinishedCollaborativeP2PPurposeDocumentsQueries user1FinishedQueries;
  late FinishedCollaborativeP2PPurposeDocumentsQueries user2FinishedQueries;
  late FinishedCollaborativeP2PPurposeDocumentsQueries adminQueries;

  setUpAll(() async {
    await tSetup.setUp();
    user1FinishedQueries = FinishedCollaborativeP2PPurposeDocumentsQueries(
      supabase: tSetup.user1Supabase,
    );
    user2FinishedQueries = FinishedCollaborativeP2PPurposeDocumentsQueries(
      supabase: tSetup.user2Supabase,
    );
    adminQueries = FinishedCollaborativeP2PPurposeDocumentsQueries(
      supabase: tSetup.supabaseAdmin,
    );
  });

  tearDownAll(() async {
    adminQueries.collaboratorInfo = user1FinishedQueries.collaboratorInfo;
    await tSetup.tearDownAll();
    await adminQueries.deleteADoc();
  });

  test("User Should be able to commit a message, add it here", () async {
    final res = await user1FinishedQueries.insertDoc(
      content: "committed purpose",
      docType: 'purpose',
    );
    expect(res[0]["collaborator_one_uid"], tSetup.firstUserUID);
    expect(res[0]["doc_type"], "purpose");
    expect(res[0]["collaborator_two_uid"], tSetup.secondUserUID);
    expect(res[0]["content"], "committed purpose");
    final res2 = await user2FinishedQueries.fetchDocInfo(
      docType: 'purpose',
    );
    expect(res2[0]["collaborator_one_uid"], tSetup.firstUserUID);
    expect(res2[0]["collaborator_two_uid"], tSetup.secondUserUID);
    expect(res2[0]["content"], "committed purpose");
    expect(res2[0]["doc_type"], "purpose");
  });
}
