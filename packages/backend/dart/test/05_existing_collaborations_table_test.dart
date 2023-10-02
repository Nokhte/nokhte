// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/existing_collaborations.dart';

void main() {
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
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
      /// arrange
      await SignIn.user1(supabase: supabase);
      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      /// act
      final res = await existingCollaborationsQueries.fetchCollaborationInfo();

      /// assert
      expect(res, isNotEmpty);
      expect(res[0]["collaborator_one"], firstUserUID);
      expect(res[0]["collaborator_two"], secondUserUID);
      expect(res[0]["who_gets_the_question"], 1);
    });

    test("should be properly identified as collaborator_one", () async {
      /// arrange
      await SignIn.user1(supabase: supabase);
      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      /// act
      final res =
          await existingCollaborationsQueries.fetchCollaboratorsUIDAndNumber();

      /// assert
      expect(res, isNotEmpty);
      expect(res[0], secondUserUID);
      expect(res[1], 2);
    });
    test("should be properly identified as collaborator_two", () async {
      /// arrange
      await SignIn.user2(supabase: supabase);
      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      /// act
      final res =
          await existingCollaborationsQueries.fetchCollaboratorsUIDAndNumber();

      /// assert
      expect(res, isNotEmpty);
      expect(res[0], firstUserUID);
      expect(res[1], 1);
    });
  });

  // test("if they are collaborator_one")

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
      /// arrange
      await SignIn.user1(supabase: supabase);
      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      /// act
      final res = await existingCollaborationsQueries.fetchCollaborationInfo();

      /// assert
      expect(res, isNotEmpty);
      expect(res[0]["collaborator_one"], secondUserUID);
      expect(res[0]["collaborator_two"], firstUserUID);
      expect(res[0]["who_gets_the_question"], 2);
    });

    test("should be properly identified as collaborator_one", () async {
      /// arrange
      await SignIn.user2(supabase: supabase);

      final existingCollaborationsQueries =
          ExistingCollaborationsQueries(supabase: supabase);

      /// act
      final res =
          await existingCollaborationsQueries.fetchCollaboratorsUIDAndNumber();

      /// assert
      expect(res, isNotEmpty);
      expect(res[0], firstUserUID);
      expect(res[1], 2);
    });
  });
}
