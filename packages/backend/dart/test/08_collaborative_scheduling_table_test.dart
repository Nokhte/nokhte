// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/working_collaborative_scheduling.dart';

import 'shared/shared.dart';

void main() {
  final tSetup = CommonCollaborativeTestFunctions();
  late WorkingCollaborativeSchedulingQueries user1Queries;

  setUpAll(() async {
    await tSetup.setUp();
    user1Queries =
        WorkingCollaborativeSchedulingQueries(supabase: tSetup.user1Supabase);
  });

  tearDownAll(() async {
    await tSetup.tearDownAll();
  });

  tearDown(() async {
    final user1Queries =
        WorkingCollaborativeSchedulingQueries(supabase: tSetup.supabaseAdmin);
    user1Queries.currentUserUID = tSetup.firstUserUID;
    await user1Queries.deleteSchedulingSession();
  });

  test("User should be able to create a scheduling session", () async {
    final now = DateTime.now();
    final dateOnly = DateTime(now.year, now.month, now.day);
    final res = await user1Queries.createSchedulingSession(
      sessionTypeBeingPlanned: "collective",
    );
    expect(res.first["collaborator_one_uid"], tSetup.firstUserUID);
    expect(res.first["collaborator_two_uid"], tSetup.secondUserUID);
    print("hey here's the res ${res.first}");
    await user1Queries.updateTimeOrDate(dateOnly, updateDate: true);
  });
}
