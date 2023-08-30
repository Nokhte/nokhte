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

  tearDown(() async {
    await supabaseAdmin.from('existing_collaborations').delete().or(
        'collaborator_one.eq.$firstUserUID,collaborator_two.eq.$secondUserUID');
  });

  test(
      "User if they are collaborator_one should be able to read from the table",
      () async {
    /// arrange
    await SignIn.user1(supabase: supabase);
    await supabaseAdmin.from('existing_collaborations').insert({
      "collaborator_one": firstUserUID,
      "collaborator_two": secondUserUID,
    });

    /// act
    final res = await ExistingCollaborationsQueries.fetchCollaborationInfo(
        supabase: supabase, currentUserUID: firstUserUID);

    /// assert
    expect(res, isNotEmpty);
    expect(res[0]["collaborator_one"], firstUserUID);
    expect(res[0]["collaborator_two"], secondUserUID);
  });

  test(
      "User if they are collaborator_one should be able to read from the table",
      () async {
    /// arrange
    await supabaseAdmin.from('existing_collaborations').insert({
      "collaborator_one": secondUserUID,
      "collaborator_two": firstUserUID,
    });
    await SignIn.user1(supabase: supabase);

    /// act
    final res = await ExistingCollaborationsQueries.fetchCollaborationInfo(
        supabase: supabase, currentUserUID: firstUserUID);

    /// assert
    expect(res, isNotEmpty);
    expect(res[0]["collaborator_one"], secondUserUID);
    expect(res[0]["collaborator_two"], firstUserUID);
  });
}
