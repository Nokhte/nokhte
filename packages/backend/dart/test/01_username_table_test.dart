// ignore_for_file: file_names

import 'package:test/test.dart';
import 'package:supabase/supabase.dart';
import 'constants/usernames/fraudulent_user_data.dart';
import './constants/general/supabase_client_constants.dart';

/// @dev run this one first as all subsequent tests are dependent on the
/// code that is run the `teardownAll` block

void main() {
  late SupabaseClient supabaseAdmin;
  late SupabaseClient supabase;
  final fraudulentSupabaseUserData = FraudulentUserData.firstFraud();
  late String? currentUserUID;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    try {
      await supabase.auth
          .signUp(email: 'test3@example.com', password: 'test123');
      await supabase.auth.signOut();
      await supabase.auth
          .signUp(email: 'test2@example.com', password: 'test123');
      await supabase.auth.signOut();
      await supabase.auth
          .signUp(email: 'test@example.com', password: "test123");
    } catch (e) {
      await supabase.auth
          .signInWithPassword(email: 'test@example.com', password: "test123");
      // await supabaseAdmin.from('usernames').delete().eq('username', 'tester');
    }
    currentUserUID = supabase.auth.currentUser?.id;
  });

  tearDown(() async {
    await supabaseAdmin.from('user_names').delete().eq('uid', currentUserUID);
  });

  tearDownAll(() async {
    try {
      await supabase.auth.signOut();
      await supabase.auth
          .signInWithPassword(email: 'test@example.com', password: 'test123');
      await supabase.from('user_names').insert(
        {"uid": supabase.auth.currentUser?.id, "username": "tester"},
      );
      await supabase.auth.signOut();
      await supabase.auth
          .signInWithPassword(email: 'test2@example.com', password: 'test123');
      await supabase.from('usernames').insert(
        {"uid": supabase.auth.currentUser?.id, "username": "tester2"},
      );
      await supabase.auth.signOut();
      await supabase.auth
          .signInWithPassword(email: 'test3@example.com', password: 'test123');
      await supabase.from('usernames').insert(
        {"uid": supabase.auth.currentUser?.id, "username": "tester3"},
      );
    } catch (e) {
      // do nothing
    }
  });
  test(
      "✅ should be able to CREATE & READ a row in the table if their uid isn't present already",
      () async {
    // arrange
    await supabase.from('usernames').insert(
      {"uid": currentUserUID, "username": "tester"},
    );
    //act
    final res =
        await supabase.from('usernames').select().eq('uid', currentUserUID);
    // assert
    expect(res[0]['username'], 'tester');
    await supabase.from('usernames').delete().eq('uid', currentUserUID);
  });

  test("shouldn't be able to insert another row if they already have one",
      () async {
    // arrange
    await supabase.from('usernames').insert(
      {"uid": currentUserUID, "username": "tester"},
    );
    // act
    try {
      await supabase.from('usernames').insert(
        {"uid": currentUserUID, "username": "tester"},
      );
    } catch (e) {
      // assert
      expect(e, isA<PostgrestException>());
    }
  });
  test("❌ SHOULDN'T be able to enter a UID that isn't theirs", () async {
    try {
      await supabase
          .from('usernames')
          .insert(fraudulentSupabaseUserData.toJson());
    } catch (e) {
      expect(e, isA<PostgrestException>());
    }
  });
}
