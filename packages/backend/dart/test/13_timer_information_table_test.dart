// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/timer_information.dart';

import 'shared/shared.dart';

void main() {
  late TimerInformationQueries user1Queries;
  late TimerInformationQueries adminQueries;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp();
    user1Queries = TimerInformationQueries(supabase: tSetup.user1Supabase);
    adminQueries = TimerInformationQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    adminQueries.currentUserUID = tSetup.firstUserUID;
    await adminQueries.deleteTheTimer();
    await tSetup.tearDownAll();
  });

  test("users should be able to create a timer", () async {
    final res =
        await user1Queries.createNewTimer(timerLengthInMilliseconds: 500.0);
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
  });
}
