// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/shared/collaborative_queries.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

import 'shared/shared.dart';

void main() {
  late ExistingCollaborationsQueries user1Queries;
  late ExistingCollaborationsQueries user2Queries;
  late CollaborativeQueries user1CollaborativeQueries;
  late ExistingCollaborationsStream user1Stream;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp();
    user1Queries =
        ExistingCollaborationsQueries(supabase: tSetup.user1Supabase);
    user2Queries =
        ExistingCollaborationsQueries(supabase: tSetup.user2Supabase);
    user1CollaborativeQueries =
        CollaborativeQueries(supabase: tSetup.user1Supabase);
    user1Stream = ExistingCollaborationsStream(supabase: tSetup.user1Supabase);
  });

  test("should be able to read from the table", () async {
    final res = await user1Queries.getCollaborations(filterForIsActive: true);

    expect(res, isNotEmpty);
    expect(res.first["collaborator_one"], tSetup.firstUserUID);
    expect(res.first["collaborator_two"], tSetup.secondUserUID);
    expect(res.first["is_currently_active"], true);
    expect(res.first["who_gets_the_question"], 2);
  });

  test("should be properly identified as collaborator_one", () async {
    final res =
        await user1CollaborativeQueries.getActiveCollaboratorsUIDAndNumber();

    expect(res, isNotEmpty);
    expect(res.first, tSetup.secondUserUID);
    expect(res[1], 2);
  });

  test("should be able to consecrate the collaboration", () async {
    final res = await user1Queries.consecrateTheCollaboration();
    expect(res.first["is_consecrated"], true);
    await user1Queries.consecrateTheCollaboration(shouldConsecrate: false);
  });

  test("should be properly identified as collaborator_two", () async {
    final res = await user2Queries.getActiveCollaboratorsUIDAndNumber();

    expect(res, isNotEmpty);
    expect(res.first, tSetup.firstUserUID);
    expect(res[1], 1);
  });

  group("checkifUserHasTheQuestion", () {
    test("user does not have the question", () async {
      final res = await user1Queries.checkIfUserHasTheQuestion();
      expect(res, false);
    });

    test("user has the question", () async {
      final res = await user2Queries.checkIfUserHasTheQuestion();
      expect(res, true);
    });
  });

  test("getWhoIsOnline", () async {
    final res = await user1Queries.getWhoIsOnline();
    expect(res, [false, false]);
  });

  test("getWhoIsOnTheCall", () async {
    final res = await user1Queries.getWhoIsOnTheCall();
    expect(res, [false, false]);
  });

  test("getTimerInitStatuses", () async {
    final res = await user1Queries.getTimerInitStatuses();
    expect(res, [false, false]);
  });

  test("setOnlineStatus", () async {
    final res = await user1Queries.setOnlineStatus(true);
    expect(res.first[ExistingCollaborationsQueries.isOnline], [true, false]);
  });

  test("setOnCallStatus", () async {
    final res = await user1Queries.setOnCallStatus(true);
    expect(res.first[ExistingCollaborationsQueries.isOnCall], [true, false]);
  });

  test("setTimerInitStatus", () async {
    final res = await user1Queries.setTimerInitStatus(true);
    expect(res.first[ExistingCollaborationsQueries.timerInitStatus],
        [true, false]);
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
    final res = await user1Queries.getCollaborations();
    expect(res, isEmpty);
  });
}
