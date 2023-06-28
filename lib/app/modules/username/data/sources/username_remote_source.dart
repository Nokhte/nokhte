import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UsernameRemoteSource {
  Future<String> getDefaultUsername();

  Future<List<dynamic>> createUsername(String username);

  Future<List<dynamic>> checkIfUsernameIsCreated();
}

class UsernameRemoteSourceImpl implements UsernameRemoteSource {
  final SupabaseClient supabase;
  // final String? currentUserUID;
//
  UsernameRemoteSourceImpl({required this.supabase});
  // : currentUserUID = supabase.auth.currentUser?.id;

  @override
  Future<String> getDefaultUsername() async {
    final currentUserUID = supabase.auth.currentUser?.email;
    return currentUserUID ?? "";
  }

  @override
  Future<List<dynamic>> createUsername(String username) async {
    final currentUserUID = supabase.auth.currentUser?.id;

    await supabase.from('usernames').insert(
      {"uid": currentUserUID, "username": username},
    );
    return await supabase.from('usernames').select().eq('uid', currentUserUID);
  }

  @override
  Future<List> checkIfUsernameIsCreated() async {
    final currentUserUID = supabase.auth.currentUser?.id;
    return await supabase.from('usernames').select().eq('uid', currentUserUID);
  }
}

/// @dev Queries are tested in the `local_supabase_primala` repository
/// in dart code so they are not covered here for obvious duplication reasons
