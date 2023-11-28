// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/timer_information.dart';

import 'shared/shared.dart';

void main() {
  late TimerInformationQueries user1Queries;
  late TimerInformationQueries user2Queries;
  late TimerInformationStreams user1Stream;
  late TimerInformationQueries adminQueries;
  final tSetup = CommonCollaborativeTestFunctions();

  deleteTimer() async {
    adminQueries.currentUserUID = tSetup.firstUserUID;
    await adminQueries.deleteTheTimer();
  }

  updateUserPrecenceToTrue() async {
    await user1Queries.updatePresence(isOnlineParam: true);
    await user2Queries.updatePresence(isOnlineParam: true);
  }

  updateTimerRunningStatus(bool newStatus) async =>
      await user1Queries.updateTimerRunningStatus(newTimerStatus: newStatus);

  initialTimerExpectationSuite(List res) {
    final theCollaboratorsNumber =
        user1Queries.collaboratorInfo.theCollaboratorsNumber;
    final expectedCollaboratorsUID =
        user1Queries.collaboratorInfo.theCollaboratorsUID;
    expect(res, isNotEmpty);
    expect(
        res.first["${theCollaboratorsNumber}_uid"], expectedCollaboratorsUID);
    expect(res.first["${theCollaboratorsNumber}_is_online"], false);
    expect(res.first[TimerInformationQueries.timerIsRunning], false);
  }

  setUpAll(() async {
    await tSetup.setUp();
    user1Queries = TimerInformationQueries(supabase: tSetup.user1Supabase);
    user1Stream = TimerInformationStreams(supabase: tSetup.user1Supabase);
    user2Queries = TimerInformationQueries(supabase: tSetup.user2Supabase);
    adminQueries = TimerInformationQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    await deleteTimer();
    await tSetup.tearDownAll();
  });

  test("users should be able to create a timer", () async {
    final res =
        await user1Queries.createNewTimer(timerLengthInMilliseconds: 3000.0);
    initialTimerExpectationSuite(res);
  });

  test("user should be able to mark when they have completed the timer",
      () async {
    await user1Queries.markTimerAsComplete();
    final timerResponse = await user1Queries.selectMostRecentTimer();
    final user = user1Queries.collaboratorInfo.theUsersCollaboratorNumber;
    final hasCompletedTimer = TimerInformationQueries.hasCompletedTimer;
    expect(timerResponse.first["${user}_$hasCompletedTimer"], true);
  });

  group("assumes timer row as been created", () {
    setUp(() async {
      await user1Queries.createNewTimer(timerLengthInMilliseconds: 3000.0);
    });
    tearDown(() async => await deleteTimer());

    test("user2 can read a timer", () async {
      final res = await user2Queries.selectMostRecentTimer();
      initialTimerExpectationSuite(res);
    });

    test("user can update their presence", () async {
      final res = await user1Queries.updatePresence(isOnlineParam: true);
      final usersCollaboratorNumber =
          user1Queries.collaboratorInfo.theUsersCollaboratorNumber;
      final isOnline = TimerInformationQueries.isOnline;
      expect(res.first["${usersCollaboratorNumber}_$isOnline"], true);
    });

    test("user should be able to updateTimer running status", () async {
      final res = await updateTimerRunningStatus(true);
      expect(res.first[TimerInformationQueries.timerIsRunning], true);
    });

    test("stream should properly emit changes", () async {
      await updateUserPrecenceToTrue();
      await updateTimerRunningStatus(true);
      await user1Queries.markTimerAsComplete();
      await user2Queries.markTimerAsComplete();

      final stream = user1Stream.getStream();
      expect(
        stream,
        emits(
          PresenceAndTimerCompletion(
            timerIsRunning: true,
            bothCollaboratorsAreReadyToMoveOn: true,
            usersPresence: true,
            collaboratorsPresence: true,
          ),
        ),
      );
    });
  });
}
