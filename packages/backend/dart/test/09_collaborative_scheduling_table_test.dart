// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/working_collaborative_scheduling.dart';
import 'package:primala_backend/existing_collaborations.dart';

void main() {
  // do a similar testing protocol
  late SupabaseClient user1Supabase;
  late SupabaseClient user2Supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late WorkingCollaborativeSchedulingQueries user1Queries;
  late ExistingCollaborationsQueries existingCollaborationsQueries;

  setUpAll(() async {
    user1Supabase = SupabaseClientConfigConstants.supabase;
    user2Supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    await SignIn.user1(supabase: user1Supabase);
    await SignIn.user1(supabase: supabaseAdmin);
    await SignIn.user2(supabase: user2Supabase);

    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    existingCollaborationsQueries =
        ExistingCollaborationsQueries(supabase: supabaseAdmin);
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];
    user1Queries =
        WorkingCollaborativeSchedulingQueries(supabase: user1Supabase);
    await existingCollaborationsQueries.createNewCollaboration(
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });

  tearDownAll(() async {
    existingCollaborationsQueries.currentUserUID = firstUserUID;
    await existingCollaborationsQueries.deleteExistingCollaboration(
      collaboratorOneUID: firstUserUID,
      collaboratorTwoUID: secondUserUID,
    );
  });

  tearDown(() async {
    final user1Queries =
        WorkingCollaborativeSchedulingQueries(supabase: supabaseAdmin);
    user1Queries.currentUserUID = firstUserUID;
    await user1Queries.deleteSchedulingSession();
  });

  test("User should be able to create a scheduling session", () async {
    final now = DateTime.now();
    final dateOnly = DateTime(now.year, now.month, now.day);
    final res = await user1Queries.createSchedulingSession(
      sessionTypeBeingPlanned: "collective",
    );
    expect(res[0]["collaborator_one_uid"], firstUserUID);
    expect(res[0]["collaborator_two_uid"], secondUserUID);
    print("hey here's the res ${res[0]}");
    await user1Queries.updateTimeOrDate(dateOnly, updateDate: true);
  });
}
