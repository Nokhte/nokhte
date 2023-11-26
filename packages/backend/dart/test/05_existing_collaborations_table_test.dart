// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

import 'shared/shared.dart';

void main() {
  late ExistingCollaborationsQueries user1Queries;
  late ExistingCollaborationsQueries user2Queries;
  late ExistingCollaborationsStream user1Stream;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp();
    user1Queries =
        ExistingCollaborationsQueries(supabase: tSetup.user1Supabase);
    user2Queries =
        ExistingCollaborationsQueries(supabase: tSetup.user2Supabase);
    user1Stream = ExistingCollaborationsStream(supabase: tSetup.user1Supabase);
  });

  test("should be able to read from the table", () async {
    final res = await user1Queries.getActiveCollaborationInfo();

    expect(res, isNotEmpty);
    expect(res.first["collaborator_one"], tSetup.firstUserUID);
    expect(res.first["collaborator_two"], tSetup.secondUserUID);
    expect(res.first["is_currently_active"], true);
    expect(res.first["who_gets_the_question"], 2);
  });

  test("should be properly identified as collaborator_one", () async {
    final res = await user1Queries.getActiveCollaboratorsUIDAndNumber();

    expect(res, isNotEmpty);
    expect(res.first, tSetup.secondUserUID);
    expect(res[1], 2);
  });

  test("should be able to consecrate the collaboration", () async {
    final res = await user1Queries.consecrateTheCollaboration();
    expect(res.first["is_consecrated"], true);
    await user1Queries.consecrateTheCollaboration(shouldConsecrate: false);
  });

  test("should be able to modify their entry status", () async {
    final res =
        await user1Queries.updateUserHasEnteredStatus(newEntryStatus: true);
    expect(
        res.first[
            "${user1Queries.collaboratorInfo.theUsersCollaboratorNumber}_has_entered"],
        true);
  });
  test("should be properly identified as collaborator_two", () async {
    final res = await user2Queries.getActiveCollaboratorsUIDAndNumber();

    expect(res, isNotEmpty);
    expect(res.first, tSetup.firstUserUID);
    expect(res[1], 1);
  });
  test(
      "should be able to update the status of the collaboration [let's say at the end of the purpose session]",
      () async {
    await user1Queries.updateActivityStatus(newActivityStatus: false);

    final res = await user1Queries.getAllCollaborationInfo();
    print("res $res");
    expect(res, isNotEmpty);
    expect(res.first["collaborator_one"], tSetup.firstUserUID);
    expect(res.first["collaborator_two"], tSetup.secondUserUID);
    expect(res.first["is_currently_active"], false);
    expect(res.first["who_gets_the_question"], 2);
    await user1Queries.updateActivityStatus(newActivityStatus: true);
  });

  test(
      "should be able to update talking status & receive changes in the stream",
      () async {
    final stream = user1Stream.checkIfCollaboratorIsTalking();
    await user1Queries.setUserAsTheCurrentTalker();
    await user2Queries.setUserAsTheCurrentTalker();
    await user1Queries.clearTheCurrentTalker();
    expect(stream, emits(true));
  });

  test(
      "should be able to abort a collaboration that is active and un-consecrated",
      () async {
    await user1Queries.abortUnConsecratedTheCollaboration();
    final res = await user1Queries.getAllCollaborationInfo();
    expect(res, isEmpty);
  });
}
