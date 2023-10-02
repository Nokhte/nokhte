// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/working_collaborative_scheduling.dart';

void main() {
  // do a similar testing protocol
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late WorkingCollaborativeSchedulingQueries queries;
  late ExistingCollaborationsQueries existingCollaborationsQueries;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    existingCollaborationsQueries =
        ExistingCollaborationsQueries(supabase: supabaseAdmin);
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];
    await SignIn.user1(supabase: supabase);
    queries = WorkingCollaborativeSchedulingQueries(supabase: supabase);
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
    final queries =
        WorkingCollaborativeSchedulingQueries(supabase: supabaseAdmin);
    queries.currentUserUID = firstUserUID;
    await queries.deleteSchedulingSession();
  });

  test(
      "User should be able to create a scheduling session & update the document",
      () async {
    final theDateWeAreUsing = DateTime.now();
    final res = await queries.createSchedulingDocument();
    expect(res[0]["collaborator_one_uid"], firstUserUID);
    expect(res[0]["collaborator_two_uid"], secondUserUID);
    final stream = WorkingCollaborativeSchedulingStream(supabase: supabase);
    stream.collaboratorsDateAndTimeStream().listen((value) {
      expect(value.date, theDateWeAreUsing);
      // second wave of expects
    });
    await queries.updateTimeOrDate(theDateWeAreUsing, updateDate: true);
  });
}
