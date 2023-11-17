// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/timer_information.dart';

import 'shared/shared.dart';

void main() {
  late TimerInformationQueries user1Queries;
  late TimerInformationQueries user2Queries;
  late TimerInformationQueries adminQueries;
  final tSetup = CommonCollaborativeTestFunctions();

  deleteTimer() async {
    adminQueries.currentUserUID = tSetup.firstUserUID;
    await adminQueries.deleteTheTimer();
  }

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
    expect(
      res.first[TimerInformationQueries.timeRemainingInMilliseconds],
      500.0,
    );
  }

  setUpAll(() async {
    await tSetup.setUp();
    user1Queries = TimerInformationQueries(supabase: tSetup.user1Supabase);
    user2Queries = TimerInformationQueries(supabase: tSetup.user2Supabase);
    adminQueries = TimerInformationQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    await deleteTimer();
    await tSetup.tearDownAll();
  });

  test("users should be able to create a timer", () async {
    final res =
        await user1Queries.createNewTimer(timerLengthInMilliseconds: 500.0);
    initialTimerExpectationSuite(res);
  });

  group("assumes timer row as been created", () {
    setUp(() async {
      await user1Queries.createNewTimer(timerLengthInMilliseconds: 500.0);
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
  });

  test("when both users are online the clock winds down", () async {
    await user1Queries.updatePresence(isOnlineParam: true);
    await user2Queries.updatePresence(isOnlineParam: true);
    int timerCount = 0;
    Timer.periodic(const Duration(milliseconds: 1), (timer) async {
      if (timerCount < 3) {
        timer.cancel();
        final res = (await user1Queries.selectMostRecentTimer())
            .first[TimerInformationQueries.timeRemainingInMilliseconds];
        expect(res, 498.0);
      }
      await user1Queries.markDownTheClock();
      timerCount++;
    });
  });
}
