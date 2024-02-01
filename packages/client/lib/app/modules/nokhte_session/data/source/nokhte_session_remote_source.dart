import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class NokhteSessionRemoteSource {
  Future<bool> checkifUserHasTheQuestion();
}

class NokhteSessionRemoteSourceImpl implements NokhteSessionRemoteSource {
  final SupabaseClient supabase;

  final ActiveNokhteSessionQueries queries;

  NokhteSessionRemoteSourceImpl({
    required this.supabase,
  }) : queries = ActiveNokhteSessionQueries(supabase: supabase);

  @override
  Future<bool> checkifUserHasTheQuestion() async =>
      await queries.checkIfUserHasTheQuestion();
}
