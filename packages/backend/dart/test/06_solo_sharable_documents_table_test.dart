// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';

import 'shared/shared.dart';

void main() {
  late SoloSharableDocumentQueries user1Queries;
  late SoloSharableDocumentQueries user2Queries;
  late SoloSharableDocumentQueries adminQueries;
  final tSetup = CommonCollaborativeTestFunctions();
  setUpAll(() async {
    await tSetup.setUp();
    user1Queries = SoloSharableDocumentQueries(supabase: tSetup.user1Supabase);
    user2Queries = SoloSharableDocumentQueries(supabase: tSetup.user2Supabase);
    adminQueries = SoloSharableDocumentQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    adminQueries.currentUserUID = tSetup.firstUserUID;
    await adminQueries.deleteDocument();
    await tSetup.tearDownAll();
  });

  test("User Can Create a document", () async {
    final res = await user1Queries.createSoloDoc(desiredDocType: 'purpose');

    expect(res.first["owner_uid"], tSetup.firstUserUID);
    expect(res.first["collaborator_uid"], tSetup.secondUserUID);
    expect(res.first["is_visible_to_collaborator"], false);
    expect(res.first["session_is_completed"], false);
  });

  test("collaborator should not be able to read an unshared doc", () async {
    final res = await user2Queries.getDocInfo(getCollaboratorsDoc: true);
    expect(res, isEmpty);
  });

  test("user should be able to share a doc", () async {
    await user1Queries.updateDocVisibility(makeVisible: true);
    final res = await user2Queries.getDocInfo(getCollaboratorsDoc: true);
    expect(res, isNotEmpty);
  });
}
