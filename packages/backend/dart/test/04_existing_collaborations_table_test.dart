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

  test("getCurrentPhases", () async {
    final res = await user1Queries.getCurrentPhases();
    expect(res, [1, 1]);
  });

  test("getSpeakerSpotlight", () async {
    final res = await user1Queries.getSpeakerSpotlight();
    expect(res, null);
  });

  test("updateOnlineStatus", () async {
    final res = await user1Queries.updateOnlineStatus(true);
    expect(res.first[ExistingCollaborationsQueries.isOnline], [true, false]);
  });

  test("updateOnCallStatus", () async {
    final res = await user1Queries.updateOnCallStatus(true);
    expect(res.first[ExistingCollaborationsQueries.isOnCall], [true, false]);
  });

  test("updateCurrentPhases", () async {
    final res = await user1Queries.updateCurrentPhases(2);
    expect(res.first[ExistingCollaborationsQueries.currentPhases], [2, 1]);
  });

  test("updateTimerRunningStatus", () async {
    final res = await user1Queries.updateTimerRunningStatus(true);
    expect(res.first[ExistingCollaborationsQueries.timerShouldRun], true);
  });

  test("setUserAsTheCurrentTalker", () async {
    final res = await user1Queries.setUserAsTheCurrentTalker();
    expect(res.first[ExistingCollaborationsQueries.speakerSpotlight],
        tSetup.firstUserUID);
  });

  group("clearTheCurrentTalker", () {
    test("collaborator attempt (shouldn't do anything)", () async {
      final res = await user2Queries.clearTheCurrentTalker();
      expect(await user1Queries.getSpeakerSpotlight(), tSetup.firstUserUID);
      expect(res, []);
    });

    test("user attempt (should work)", () async {
      await user1Queries.clearTheCurrentTalker();
      expect(await user1Queries.getSpeakerSpotlight(), null);
    });
  });

  test("getSessionMetadata", () async {
    final stream = user1Stream.getSessionMetadata();
    await user1Queries.setUserAsTheCurrentTalker();
    await user1Queries.updateOnCallStatus(true);
    await user2Queries.updateOnCallStatus(true);
    await user1Queries.updateOnlineStatus(true);
    await user2Queries.updateOnlineStatus(true);
    await user1Queries.updateTimerRunningStatus(true);
    expect(
      stream,
      emits(
        CollaborationSessionMetadata(
          userPhase: 2,
          collaboratorPhase: 1,
          userIsOnCall: true,
          collaboratorIsOnCall: true,
          userIsOnline: true,
          collaboratorIsOnline: true,
          timerShouldRun: true,
          collaboratorIsTalking: false,
          userIsTalking: true,
        ),
      ),
    );
  });

  test(
      "should be able to abort a collaboration that is active and un-consecrated",
      () async {
    await user1Queries.deleteUnConsecratedTheCollaboration();
    final res = await user1Queries.getCollaborations();
    expect(res, isEmpty);
  });
}
