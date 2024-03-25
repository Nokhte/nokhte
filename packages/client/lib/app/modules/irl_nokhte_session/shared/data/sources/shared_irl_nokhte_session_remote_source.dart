import 'package:nokhte_backend/tables/irl_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SharedIrlNokhteSessionRemoteSource {
  Future<int> decidePhoneRole();
}

class SharedIrlNokhteSessionRemoteSourceImpl
    implements SharedIrlNokhteSessionRemoteSource {
  final SupabaseClient supabase;
  final ActiveIrlNokhteSessionQueries queries;
  SharedIrlNokhteSessionRemoteSourceImpl({required this.supabase})
      : queries = ActiveIrlNokhteSessionQueries(supabase: supabase);
  @override
  Future<int> decidePhoneRole() async {
    await queries.computeCollaboratorInformation();
    return queries.userIndex;
  }
}
