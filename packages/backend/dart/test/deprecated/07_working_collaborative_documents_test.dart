// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/deprecated/_real_time_enabled/working_collaborative_documents/queries.dart';

import '../shared/shared.dart';

void main() {
  final tSetup = CommonCollaborativeTestFunctions();
  late WorkingCollaborativeDocumentsQueries user1WorkingQueries;
  late WorkingCollaborativeDocumentsQueries adminWorkingQueries;
  late String usersCollaboratorNumber;
  late String collaboratorsNumber;
  late String usersUID;
  late String collaboratorsUID;
  final wantsToCommit = WorkingCollaborativeDocumentsQueries.wantsToCommit;
  final delta = WorkingCollaborativeDocumentsQueries.delta;
  final isActive = WorkingCollaborativeDocumentsQueries.isActive;
  final content = WorkingCollaborativeDocumentsQueries.content;

  final tContent = "newContent";

  setUpAll(() async {
    await tSetup.setUp();
    user1WorkingQueries =
        WorkingCollaborativeDocumentsQueries(supabase: tSetup.user1Supabase);

    await user1WorkingQueries.ensureActiveCollaboratorInfo();
    usersCollaboratorNumber =
        user1WorkingQueries.collaboratorInfo.theUsersCollaboratorNumber;
    usersUID = user1WorkingQueries.collaboratorInfo.theUsersUID;
    collaboratorsNumber =
        user1WorkingQueries.collaboratorInfo.theCollaboratorsNumber;
    collaboratorsUID = user1WorkingQueries.collaboratorInfo.theCollaboratorsUID;
    adminWorkingQueries =
        WorkingCollaborativeDocumentsQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    adminWorkingQueries.collaboratorInfo = user1WorkingQueries.collaboratorInfo;
    adminWorkingQueries.collaboratorInfo = user1WorkingQueries.collaboratorInfo;
    await adminWorkingQueries.deleteThedoc();
    await tSetup.tearDownAll();
  });

  initialDocExpectationSuite(List res) {
    expect(res.first["${usersCollaboratorNumber}_uid"], usersUID);
    expect(res.first["doc_type"], "purpose");
    expect(res.first["${collaboratorsNumber}_uid"], collaboratorsUID);
    expect(res.first[content], isEmpty);
    expect(res.first["collaborator_one_delta"], -1);
    expect(res.first["collaborator_two_delta"], -1);
    expect(res.first["collaborator_one_is_active"], false);
    expect(res.first["collaborator_two_is_active"], false);
  }

  group("insert", () {
    test("createCollaborativeDocument", () async {
      final res = await user1WorkingQueries.createCollaborativeDocument(
          docType: 'purpose');
      initialDocExpectationSuite(res);
    });

    tearDown(() async {
      adminWorkingQueries.collaboratorInfo =
          user1WorkingQueries.collaboratorInfo;
      await adminWorkingQueries.deleteThedoc();
    });
  });

  group("select", () {
    setUp(() async {
      await user1WorkingQueries.createCollaborativeDocument(docType: 'purpose');
    });

    test("getDocInfo", () async {
      final res = await user1WorkingQueries.getDocInfo();
      initialDocExpectationSuite(res);
    });
    tearDown(() async {
      adminWorkingQueries.collaboratorInfo =
          user1WorkingQueries.collaboratorInfo;
      await adminWorkingQueries.deleteThedoc();
    });
  });

  group("delete", () {
    setUp(
      () async =>
          user1WorkingQueries.createCollaborativeDocument(docType: 'purpose'),
    );

    test("deleteTheDoc", () async {
      await user1WorkingQueries.deleteThedoc();
      final res = await user1WorkingQueries.getDocInfo();
      expect(res, isEmpty);
    });
  });

  group("update", () {
    setUp(
      () async =>
          user1WorkingQueries.createCollaborativeDocument(docType: 'purpose'),
    );

    tearDown(() async {
      adminWorkingQueries.collaboratorInfo =
          user1WorkingQueries.collaboratorInfo;
      await adminWorkingQueries.deleteThedoc();
    });

    test("updateCommitDesireStatus", () async {
      await user1WorkingQueries.updateCommitDesireStatus(
          wantsToCommitParam: true);
      final res = await user1WorkingQueries.getDocInfo();
      final usersCommitStatus =
          res.first["${usersCollaboratorNumber}_$wantsToCommit"];
      expect(usersCommitStatus, true);
    });
    test(" updateDelta", () async {
      await user1WorkingQueries.updateDelta(deltaParam: 3);
      final res = await user1WorkingQueries.getDocInfo();
      final usersDelta = res.first["${usersCollaboratorNumber}_$delta"];
      expect(usersDelta, 3);
    });
    test(" updatePresence", () async {
      await user1WorkingQueries.updatePresence(isPresent: true);
      final res = await user1WorkingQueries.getDocInfo();
      final usersPresence = res.first["${usersCollaboratorNumber}_$isActive"];
      expect(usersPresence, true);
    });

    test("updateUsersDocContent", () async {
      await user1WorkingQueries.updateUsersDocContent(newContent: tContent);
      final res = await user1WorkingQueries.getDocInfo();
      final usersDocContent = res.first[content];
      expect(usersDocContent, tContent);
    });
  });
}
