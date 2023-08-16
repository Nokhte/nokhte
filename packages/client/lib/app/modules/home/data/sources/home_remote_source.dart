import 'package:primala/app/core/utilities/misc_algos.dart';
import 'package:primala_backend/user_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeRemoteSource {
  Future<List<dynamic>> addNamesToDatabase();
}

class HomeRemoteSourceImpl implements HomeRemoteSource {
  final SupabaseClient supabase;

  HomeRemoteSourceImpl({required this.supabase});
  @override
  addNamesToDatabase() async {
    final String fullName =
        supabase.auth.currentUser?.userMetadata?["full_name"] ??
            supabase.auth.currentUser?.userMetadata?["name"];
    final [firstName, lastName] = MiscAlgos.returnSplitName(fullName);

    final List nameCheck = await CommonUserNamesQueries.fetchUserInfo(
      supabase: supabase,
      userUID: supabase.auth.currentUser?.id ?? '',
    );

    // add check for if it already exists
    List insertRes;
    if (nameCheck.isEmpty) {
      insertRes = await CommonUserNamesQueries.insertUserInfo(
        supabase: supabase,
        userUID: supabase.auth.currentUser?.id,
        firstName: firstName,
        lastName: lastName,
      );
    } else {
      insertRes = [];
    }
    return nameCheck.isEmpty ? insertRes : nameCheck;
  }
}
