// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/deprecated/_real_time_disabled/finished_collaborative_documents/queries.dart';

import '../shared/shared.dart';

void main() {
  final tSetup = CommonCollaborativeTestFunctions();
  late FinishedCollaborativeDocumentsQueries user1FinishedQueries;
  late FinishedCollaborativeDocumentsQueries user2FinishedQueries;
  late FinishedCollaborativeDocumentsQueries adminQueries;

  setUpAll(() async {
    await tSetup.setUp();
    user1FinishedQueries = FinishedCollaborativeDocumentsQueries(
      supabase: tSetup.user1Supabase,
    );
    user2FinishedQueries = FinishedCollaborativeDocumentsQueries(
      supabase: tSetup.user2Supabase,
    );
    adminQueries = FinishedCollaborativeDocumentsQueries(
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
    expect(res.first["collaborator_one_uid"], tSetup.firstUserUID);
    expect(res.first["doc_type"], "purpose");
    expect(res.first["collaborator_two_uid"], tSetup.secondUserUID);
    expect(res.first["content"], "committed purpose");
    final res2 = await user2FinishedQueries.getDocInfo(
      docType: 'purpose',
    );
    expect(res2.first["collaborator_one_uid"], tSetup.firstUserUID);
    expect(res2.first["collaborator_two_uid"], tSetup.secondUserUID);
    expect(res2.first["content"], "committed purpose");
    expect(res2.first["doc_type"], "purpose");
  });
}
