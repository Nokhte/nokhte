// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

void main() {
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults.first;
    secondUserUID = userIdResults[1];
  });

  group("If they are collaborator_one...", () {
    setUpAll(() async {
      await supabaseAdmin.from('existing_collaborations').insert({
        "collaborator_one": firstUserUID,
        "collaborator_two": secondUserUID,
        "who_gets_the_question": 1,
      });
    });
    tearDownAll(() async {
      await supabaseAdmin.from('existing_collaborations').delete().or(
          'collaborator_one.eq.$firstUserUID,collaborator_two.eq.$firstUserUID');
    });
    test("should be able to read from the table", () async {
      await SignIn.user1(supabase: supabase);
      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      final res =
          await existingCollaborationsQueries.fetchActiveCollaborationInfo();

      expect(res, isNotEmpty);
      expect(res.first["collaborator_one"], firstUserUID);
      expect(res.first["collaborator_two"], secondUserUID);
      expect(res.first["is_currently_active"], true);
      expect(res.first["who_gets_the_question"], 1);
    });

    test("should be properly identified as collaborator_one", () async {
      await SignIn.user1(supabase: supabase);
      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      final res = await existingCollaborationsQueries
          .fetchActiveCollaboratorsUIDAndNumber();

      expect(res, isNotEmpty);
      expect(res.first, secondUserUID);
      expect(res[1], 2);
    });
    test("should be properly identified as collaborator_two", () async {
      await SignIn.user2(supabase: supabase);
      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      final res = await existingCollaborationsQueries
          .fetchActiveCollaboratorsUIDAndNumber();

      expect(res, isNotEmpty);
      expect(res.first, firstUserUID);
      expect(res[1], 1);
    });
    test(
        "should be able to update the status of the collaboration [let's say at the end of the purpose session]",
        () async {
      await SignIn.user1(supabase: supabase);
      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      await existingCollaborationsQueries.updateActivityStatus(
        collaboratorOneUID: firstUserUID,
        collaboratorTwoUID: secondUserUID,
        newActivityStatus: false,
      );

      final res =
          await existingCollaborationsQueries.fetchAllCollaborationInfo();
      expect(res, isNotEmpty);
      expect(res.first["collaborator_one"], firstUserUID);
      expect(res.first["collaborator_two"], secondUserUID);
      expect(res.first["is_currently_active"], false);
      expect(res.first["who_gets_the_question"], 1);
    });
  });

  group("If they are collaborator_two...", () {
    setUpAll(() async {
      await supabaseAdmin.from('existing_collaborations').insert({
        "collaborator_one": secondUserUID,
        "collaborator_two": firstUserUID,
        "who_gets_the_question": 2,
      });
    });
    tearDownAll(() async {
      await supabaseAdmin.from('existing_collaborations').delete().or(
          'collaborator_one.eq.$firstUserUID,collaborator_two.eq.$firstUserUID');
    });
    test("should be able to read from the table", () async {
      await SignIn.user1(supabase: supabase);
      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      final res =
          await existingCollaborationsQueries.fetchActiveCollaborationInfo();

      expect(res, isNotEmpty);
      expect(res.first["collaborator_one"], secondUserUID);
      expect(res.first["collaborator_two"], firstUserUID);
      expect(res.first["who_gets_the_question"], 2);
    });

    test("should be properly identified as collaborator_one", () async {
      await SignIn.user2(supabase: supabase);

      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      final res = await existingCollaborationsQueries
          .fetchActiveCollaboratorsUIDAndNumber();

      expect(res, isNotEmpty);
      expect(res.first, firstUserUID);
      expect(res[1], 2);
    });
  });
}
